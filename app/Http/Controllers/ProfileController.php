<?php

namespace App\Http\Controllers;

use App\Models\Commodity;
use App\Models\User;
use App\Models\Workspace;
use App\Models\WorkspaceCommodityAccess;
use App\Services\WorkspaceManager;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function __construct(protected WorkspaceManager $workspaceManager) {}

    public function index()
    {
        $user = $this->workspaceManager->getCurrentUser();
        $workspace = $this->workspaceManager->getCurrentWorkspace();

        // Accessible commodities in this workspace
        $accessibleCommodityIds = $workspace ? $workspace->commodityAccess()->where('status', 'active')->pluck('commodity_id')->toArray() : [];
        $commodities = Commodity::where('is_active', true)->get();

        // Completed cultivation projects (Riwayat Budidaya)
        $historyProjects = $workspace ? $workspace->cultivationProjects()
            ->where('status', 'completed')
            ->with(['harvests', 'program.commodity'])
            ->latest('actual_end_date')
            ->take(5)
            ->get() : collect();

        // Gamification metrics
        $totalXp = $user->total_xp;
        $level = $user->level;
        $badgesCount = $user->achievements()->count();

        // Available workspaces for user
        $myWorkspaces = $user->workspaces()->get();
        $allDemoUsers = User::all();

        return view('pages.profile.index', compact(
            'user',
            'workspace',
            'commodities',
            'accessibleCommodityIds',
            'historyProjects',
            'totalXp',
            'level',
            'badgesCount',
            'myWorkspaces',
            'allDemoUsers'
        ));
    }

    public function switchWorkspace(Workspace $workspace)
    {
        $this->workspaceManager->switchWorkspace($workspace->id);

        return back()->with('success', "Beralih ke workspace {$workspace->name}!");
    }

    public function switchUser(User $user)
    {
        $this->workspaceManager->switchUser($user->id);

        return redirect()->route('dashboard')->with('success', "Login sebagai {$user->name}!");
    }

    public function addCommodityAccess(Request $request)
    {
        $workspace = $this->workspaceManager->getCurrentWorkspace();

        $validated = $request->validate([
            'commodity_id' => 'required|exists:commodities,id',
        ]);

        $commodity = Commodity::findOrFail($validated['commodity_id']);

        WorkspaceCommodityAccess::updateOrCreate(
            [
                'workspace_id' => $workspace->id,
                'commodity_id' => $commodity->id,
            ],
            [
                'access_type' => 'lifetime',
                'starts_at' => now(),
                'ends_at' => null,
                'status' => 'active',
            ]
        );

        return back()->with('success', "Akses komoditas {$commodity->name} berhasil diaktifkan untuk workspace ini!");
    }
}
