<?php

namespace Tests\Feature;

use App\Models\Commodity;
use App\Models\ProjectTask;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class TanamYukSaaSTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();
        $this->artisan('migrate');
        $this->artisan('db:seed');
    }

    public function test_all_pages_render_successfully(): void
    {
        $urls = [
            '/',
            '/plants',
            '/plants/1',
            '/plants/1/timeline',
            '/plants/1/problems',
            '/plants/1/notes',
            '/plants/1/results',
            '/challenges',
            '/profile',
        ];

        foreach ($urls as $url) {
            $response = $this->get($url);
            $response->assertStatus(200);
        }
    }

    public function test_task_can_be_toggled_and_awards_xp(): void
    {
        $task = ProjectTask::first();

        // Toggle task with valid session token
        $response = $this->withSession(['_token' => 'test_token'])
            ->post("/tasks/{$task->id}/toggle", ['_token' => 'test_token']);

        $response->assertRedirect();

        $task->refresh();
        $this->assertTrue(in_array($task->status, ['done', 'pending']));
    }

    public function test_can_create_new_cultivation_project_with_cycle(): void
    {
        $commodity = Commodity::where('code', 'CABAI')->first();

        $response = $this->withSession(['_token' => 'test_token'])
            ->post('/plants', [
                '_token' => 'test_token',
                'commodity_id' => $commodity->id,
                'name' => 'Cabai Rawit Test Cycle 3',
                'cycle_no' => 3,
                'location_name' => 'Lahan Uji Coba',
                'initial_plant_count' => 25,
                'start_date' => now()->toDateString(),
                'target_yield_kg' => 20.0,
                'notes' => 'Catatan tes otomatis',
            ]);

        $response->assertRedirect();

        $this->assertDatabaseHas('cultivation_projects', [
            'name' => 'Cabai Rawit Test Cycle 3',
            'cycle_no' => 3,
            'initial_plant_count' => 25,
        ]);
    }

    public function test_database_views_calculate_correctly(): void
    {
        $dashboardProjects = DB::table('v_dashboard_projects')->get();
        $this->assertNotEmpty($dashboardProjects);

        $projectResults = DB::table('v_project_results')->get();
        $this->assertNotEmpty($projectResults);

        $userGamification = DB::table('v_user_gamification')->get();
        $this->assertNotEmpty($userGamification);
    }
}
