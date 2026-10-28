<?php

namespace App\Http\Controllers;

use App\Models\ProjectTask;
use App\Models\UserXpTransaction;
use App\Services\WorkspaceManager;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function __construct(protected WorkspaceManager $workspaceManager) {}

    public function index()
    {
        $workspace = $this->workspaceManager->getCurrentWorkspace();
        $user = $this->workspaceManager->getCurrentUser();

        if (! $workspace) {
            return redirect()->route('plants.index');
        }

        // Active projects in this workspace
        $activeProjects = $workspace->cultivationProjects()
            ->where('status', 'active')
            ->with(['program.commodity', 'stageProgress.stage'])
            ->get();

        // Today tasks across active projects
        $projectIds = $activeProjects->pluck('id');
        $todayTasks = ProjectTask::whereIn('cultivation_project_id', $projectIds)
            ->with('project')
            ->orderByRaw("status = 'pending' DESC")
            ->orderBy('due_at')
            ->take(6)
            ->get();

        // Weather data
        $weather = [
            'temp' => '28°C',
            'condition' => 'Cerah',
        ];

        return view('pages.dashboard', compact('activeProjects', 'todayTasks', 'weather', 'workspace', 'user'));
    }

    public function toggleTask(Request $request, ProjectTask $task)
    {
        $user = $this->workspaceManager->getCurrentUser();
        $workspace = $this->workspaceManager->getCurrentWorkspace();

        if ($task->status === 'done') {
            $task->update([
                'status' => 'pending',
                'completed_at' => null,
                'completed_by' => null,
            ]);
            $message = 'Tugas diubah kembali menjadi belum selesai.';
        } else {
            $task->update([
                'status' => 'done',
                'completed_at' => now(),
                'completed_by' => $user->id,
            ]);

            // Award XP
            if ($task->xp_reward > 0 && $workspace) {
                UserXpTransaction::create([
                    'user_id' => $user->id,
                    'workspace_id' => $workspace->id,
                    'cultivation_project_id' => $task->cultivation_project_id,
                    'source_type' => 'task',
                    'source_id' => $task->id,
                    'xp_amount' => $task->xp_reward,
                    'description' => "Menyelesaikan tugas: {$task->title}",
                ]);
            }

            $message = "Tugas selesai! +{$task->xp_reward} XP didapatkan 🎉";
        }

        if ($request->wantsJson()) {
            return response()->json([
                'success' => true,
                'status' => $task->status,
                'message' => $message,
                'total_xp' => $user->total_xp,
            ]);
        }

        return back()->with('success', $message);
    }
}
