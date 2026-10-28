<?php

namespace App\Http\Controllers;

use App\Models\Commodity;
use App\Models\CultivationProgram;
use App\Models\CultivationProject;
use App\Models\ExpenseCategory;
use App\Models\Harvest;
use App\Models\HarvestSale;
use App\Models\ProblemCatalog;
use App\Models\ProjectExpense;
use App\Models\ProjectMember;
use App\Models\ProjectNote;
use App\Models\ProjectPhoto;
use App\Models\ProjectProblem;
use App\Models\ProjectProblemAction;
use App\Models\ProjectStageProgress;
use App\Models\ProjectTask;
use App\Models\UserXpTransaction;
use App\Services\WorkspaceManager;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PlantController extends Controller
{
    public function __construct(protected WorkspaceManager $workspaceManager) {}

    public function index(Request $request)
    {
        $workspace = $this->workspaceManager->getCurrentWorkspace();
        $statusTab = $request->query('tab', 'aktif'); // 'aktif' or 'selesai'

        $query = $workspace->cultivationProjects()
            ->with(['program.commodity', 'stageProgress.stage']);

        if ($statusTab === 'selesai') {
            $projects = $query->where('status', 'completed')->latest('start_date')->get();
        } else {
            $projects = $query->where('status', 'active')->latest('start_date')->get();
        }

        $activeCount = $workspace->cultivationProjects()->where('status', 'active')->count();
        $completedCount = $workspace->cultivationProjects()->where('status', 'completed')->count();

        // Accessible commodities in this workspace for the "Tambah Tanaman" modal
        $commodities = Commodity::where('is_active', true)->with('programs')->get();

        return view('pages.plants.index', compact(
            'projects',
            'statusTab',
            'activeCount',
            'completedCount',
            'commodities',
            'workspace'
        ));
    }

    public function store(Request $request)
    {
        $workspace = $this->workspaceManager->getCurrentWorkspace();
        $user = $this->workspaceManager->getCurrentUser();

        $validated = $request->validate([
            'commodity_id' => 'required|exists:commodities,id',
            'name' => 'required|string|max:180',
            'cycle_no' => 'required|integer|min:1',
            'location_name' => 'nullable|string|max:180',
            'initial_plant_count' => 'required|integer|min:1',
            'start_date' => 'required|date',
            'target_yield_kg' => 'nullable|numeric|min:0',
            'notes' => 'nullable|string|max:1000',
        ]);

        $commodity = Commodity::findOrFail($validated['commodity_id']);
        $program = $commodity->programs()->first() ?? CultivationProgram::first();

        $startDate = Carbon::parse($validated['start_date']);
        $estimatedHarvest = (clone $startDate)->addDays($program->duration_days ?? 90);

        $code = Str::upper($commodity->code).'-'.str_pad((string) rand(10, 999), 3, '0', STR_PAD_LEFT);

        $project = CultivationProject::create([
            'workspace_id' => $workspace->id,
            'cultivation_program_id' => $program->id,
            'created_by' => $user->id,
            'project_code' => $code,
            'name' => $validated['name'],
            'cycle_no' => $validated['cycle_no'],
            'location_name' => $validated['location_name'] ?? 'Pekarangan Rumah',
            'initial_plant_count' => $validated['initial_plant_count'],
            'current_plant_count' => $validated['initial_plant_count'],
            'start_date' => $validated['start_date'],
            'estimated_harvest_date' => $estimatedHarvest->toDateString(),
            'status' => 'active',
            'target_yield_kg' => $validated['target_yield_kg'] ?? null,
            'notes' => $validated['notes'] ?? null,
        ]);

        // Add user as manager member
        ProjectMember::create([
            'cultivation_project_id' => $project->id,
            'user_id' => $user->id,
            'role' => 'manager',
            'joined_at' => now(),
        ]);

        // Initialize stages progress
        foreach ($program->stages as $index => $stage) {
            $isFirst = ($index === 0);
            ProjectStageProgress::create([
                'cultivation_project_id' => $project->id,
                'program_stage_id' => $stage->id,
                'status' => $isFirst ? 'active' : 'locked',
                'completion_percent' => $isFirst ? 20 : 0,
                'started_at' => $isFirst ? now() : null,
                'xp_earned' => 0,
            ]);

            // If first stage, generate initial tasks
            if ($isFirst) {
                foreach ($stage->tasks as $st) {
                    ProjectTask::create([
                        'cultivation_project_id' => $project->id,
                        'stage_task_id' => $st->id,
                        'assigned_to' => $user->id,
                        'title' => $st->title,
                        'instruction' => $st->short_instruction,
                        'task_type' => $st->task_type,
                        'due_at' => now()->setTime(8, 0),
                        'status' => 'pending',
                        'xp_reward' => $st->xp_reward,
                        'source' => 'system',
                    ]);
                }
            }
        }

        // Gamification XP for creating project
        UserXpTransaction::create([
            'user_id' => $user->id,
            'workspace_id' => $workspace->id,
            'cultivation_project_id' => $project->id,
            'source_type' => 'manual',
            'xp_amount' => 50,
            'description' => "Memulai siklus baru: {$project->name}",
        ]);

        return redirect()->route('plants.show', $project)->with('success', "Budidaya {$project->name} berhasil dibuat!");
    }

    // TAB 1: Hari Ini
    public function show(CultivationProject $project)
    {
        $project->load(['program.commodity', 'stageProgress.stage', 'todayTasks']);
        $activeTab = 'hari-ini';

        return view('pages.plants.show', compact('project', 'activeTab'));
    }

    // TAB 2: Perjalanan
    public function timeline(CultivationProject $project)
    {
        $project->load(['program.stages.tasks', 'stageProgress']);
        $activeTab = 'perjalanan';

        return view('pages.plants.timeline', compact('project', 'activeTab'));
    }

    // TAB 3: Masalah
    public function problems(CultivationProject $project)
    {
        $project->load(['problems.actions.user', 'problems.catalog.solutions', 'program.commodity.problemCatalog.solutions']);
        $activeTab = 'masalah';

        $problemCatalog = ProblemCatalog::where('commodity_id', $project->program->commodity_id)
            ->where('is_active', true)
            ->with('solutions')
            ->get();

        return view('pages.plants.problems', compact('project', 'activeTab', 'problemCatalog'));
    }

    public function storeProblem(Request $request, CultivationProject $project)
    {
        $user = $this->workspaceManager->getCurrentUser();

        $validated = $request->validate([
            'title' => 'required|string|max:180',
            'problem_catalog_id' => 'nullable|exists:problem_catalog,id',
            'description' => 'nullable|string|max:1000',
            'photo_url' => 'nullable|url|max:500',
        ]);

        ProjectProblem::create([
            'cultivation_project_id' => $project->id,
            'problem_catalog_id' => $validated['problem_catalog_id'] ?? null,
            'reported_by' => $user->id,
            'title' => $validated['title'],
            'description' => $validated['description'] ?? null,
            'status' => 'open',
            'detected_at' => now(),
            'photo_url' => $validated['photo_url'] ?? null,
        ]);

        return back()->with('success', 'Laporan masalah berhasil dicatat.');
    }

    public function storeProblemAction(Request $request, ProjectProblem $problem)
    {
        $user = $this->workspaceManager->getCurrentUser();

        $validated = $request->validate([
            'action_text' => 'required|string|max:700',
            'result_status' => 'required|in:done,improved,no_change,resolved',
        ]);

        ProjectProblemAction::create([
            'project_problem_id' => $problem->id,
            'user_id' => $user->id,
            'action_date' => now(),
            'action_text' => $validated['action_text'],
            'result_status' => $validated['result_status'],
        ]);

        if ($validated['result_status'] === 'resolved') {
            $problem->update([
                'status' => 'resolved',
                'resolved_at' => now(),
            ]);

            // Award XP
            UserXpTransaction::create([
                'user_id' => $user->id,
                'workspace_id' => $problem->project->workspace_id,
                'cultivation_project_id' => $problem->cultivation_project_id,
                'source_type' => 'problem',
                'source_id' => $problem->id,
                'xp_amount' => 50,
                'description' => "Menyelesaikan masalah: {$problem->title}",
            ]);
        } else {
            $problem->update(['status' => 'monitoring']);
        }

        return back()->with('success', 'Tindakan penanganan masalah berhasil dicatat.');
    }

    // TAB 4: Catatan
    public function notes(CultivationProject $project)
    {
        $project->load(['projectNotes.author', 'projectNotes.photos', 'photos']);
        $activeTab = 'catatan';

        return view('pages.plants.notes', compact('project', 'activeTab'));
    }

    public function storeNote(Request $request, CultivationProject $project)
    {
        $user = $this->workspaceManager->getCurrentUser();

        $validated = $request->validate([
            'note_text' => 'required|string',
            'condition_status' => 'required|in:good,normal,attention',
            'photo_url' => 'nullable|url|max:500',
            'caption' => 'nullable|string|max:500',
        ]);

        $note = ProjectNote::create([
            'cultivation_project_id' => $project->id,
            'user_id' => $user->id,
            'note_date' => now()->toDateString(),
            'condition_status' => $validated['condition_status'],
            'note_text' => $validated['note_text'],
        ]);

        if (! empty($validated['photo_url'])) {
            ProjectPhoto::create([
                'cultivation_project_id' => $project->id,
                'project_note_id' => $note->id,
                'user_id' => $user->id,
                'photo_date' => now()->toDateString(),
                'file_url' => $validated['photo_url'],
                'caption' => $validated['caption'] ?? 'Foto catatan tanaman',
            ]);
        }

        return back()->with('success', 'Catatan perkembangan berhasil disimpan.');
    }

    // TAB 5: Hasil
    public function results(CultivationProject $project)
    {
        $project->load(['expenses.category', 'harvests', 'sales']);
        $activeTab = 'hasil';
        $categories = ExpenseCategory::all();

        return view('pages.plants.results', compact('project', 'activeTab', 'categories'));
    }

    public function storeExpense(Request $request, CultivationProject $project)
    {
        $user = $this->workspaceManager->getCurrentUser();

        $validated = $request->validate([
            'expense_category_id' => 'required|exists:expense_categories,id',
            'description' => 'required|string|max:250',
            'amount' => 'required|numeric|min:0',
            'expense_date' => 'required|date',
        ]);

        ProjectExpense::create([
            'cultivation_project_id' => $project->id,
            'expense_category_id' => $validated['expense_category_id'],
            'user_id' => $user->id,
            'expense_date' => $validated['expense_date'],
            'description' => $validated['description'],
            'amount' => $validated['amount'],
        ]);

        return back()->with('success', 'Biaya modal berhasil dicatat.');
    }

    public function storeHarvest(Request $request, CultivationProject $project)
    {
        $user = $this->workspaceManager->getCurrentUser();

        $validated = $request->validate([
            'weight_kg' => 'required|numeric|min:0.1',
            'harvest_date' => 'required|date',
            'note' => 'nullable|string|max:500',
            'photo_url' => 'nullable|url|max:500',
        ]);

        $nextHarvestNo = ($project->harvests()->max('harvest_no') ?? 0) + 1;

        Harvest::create([
            'cultivation_project_id' => $project->id,
            'harvest_no' => $nextHarvestNo,
            'recorded_by' => $user->id,
            'harvest_date' => $validated['harvest_date'],
            'weight_kg' => $validated['weight_kg'],
            'note' => $validated['note'] ?? null,
            'photo_url' => $validated['photo_url'] ?? null,
        ]);

        // Award XP
        UserXpTransaction::create([
            'user_id' => $user->id,
            'workspace_id' => $project->workspace_id,
            'cultivation_project_id' => $project->id,
            'source_type' => 'harvest',
            'xp_amount' => 100,
            'description' => "Mencatat panen ke-{$nextHarvestNo}: {$validated['weight_kg']} kg",
        ]);

        return back()->with('success', 'Catatan panen berhasil ditambahkan! +100 XP 🎉');
    }

    public function storeSale(Request $request, CultivationProject $project)
    {
        $user = $this->workspaceManager->getCurrentUser();

        $validated = $request->validate([
            'sale_date' => 'required|date',
            'buyer_name' => 'nullable|string|max:180',
            'qty_kg' => 'required|numeric|min:0.1',
            'price_per_kg' => 'required|numeric|min:0',
            'payment_status' => 'required|in:unpaid,partial,paid',
        ]);

        $totalAmount = $validated['qty_kg'] * $validated['price_per_kg'];

        HarvestSale::create([
            'cultivation_project_id' => $project->id,
            'sold_by' => $user->id,
            'sale_date' => $validated['sale_date'],
            'buyer_name' => $validated['buyer_name'] ?? 'Pelanggan',
            'qty_kg' => $validated['qty_kg'],
            'price_per_kg' => $validated['price_per_kg'],
            'total_amount' => $totalAmount,
            'payment_status' => $validated['payment_status'],
        ]);

        return back()->with('success', 'Penjualan hasil panen berhasil dicatat.');
    }
}
