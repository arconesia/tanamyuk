<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        DB::statement('DROP VIEW IF EXISTS v_dashboard_projects;');
        DB::statement("
            CREATE VIEW v_dashboard_projects AS
            SELECT p.id AS project_id,
                   p.workspace_id,
                   p.name AS project_name,
                   c.name AS commodity_name,
                   p.current_plant_count,
                   p.start_date,
                   p.estimated_harvest_date,
                   p.status,
                   COALESCE(MAX(CASE WHEN ps.status='active' THEN ps.completion_percent END), 100) AS current_stage_progress
            FROM cultivation_projects p
            JOIN cultivation_programs cp ON cp.id = p.cultivation_program_id
            JOIN commodities c ON c.id = cp.commodity_id
            LEFT JOIN project_stage_progress ps ON ps.cultivation_project_id = p.id
            GROUP BY p.id, p.workspace_id, p.name, c.name, p.current_plant_count, p.start_date, p.estimated_harvest_date, p.status;
        ");

        DB::statement('DROP VIEW IF EXISTS v_project_results;');
        DB::statement('
            CREATE VIEW v_project_results AS
            SELECT p.id AS project_id,
                   p.workspace_id,
                   p.name AS project_name,
                   COALESCE(e.total_expense, 0) AS total_expense,
                   COALESCE(h.total_harvest_kg, 0) AS total_harvest_kg,
                   COALESCE(s.total_sales, 0) AS total_sales,
                   COALESCE(s.total_sales, 0) - COALESCE(e.total_expense, 0) AS profit_loss
            FROM cultivation_projects p
            LEFT JOIN (SELECT cultivation_project_id, SUM(amount) AS total_expense FROM project_expenses GROUP BY cultivation_project_id) e ON e.cultivation_project_id = p.id
            LEFT JOIN (SELECT cultivation_project_id, SUM(weight_kg) AS total_harvest_kg FROM harvests GROUP BY cultivation_project_id) h ON h.cultivation_project_id = p.id
            LEFT JOIN (SELECT cultivation_project_id, SUM(total_amount) AS total_sales FROM harvest_sales GROUP BY cultivation_project_id) s ON s.cultivation_project_id = p.id;
        ');

        DB::statement('DROP VIEW IF EXISTS v_user_gamification;');
        DB::statement('
            CREATE VIEW v_user_gamification AS
            SELECT u.id AS user_id,
                   u.name,
                   COALESCE(x.total_xp, 0) AS total_xp,
                   COALESCE(a.total_badges, 0) AS total_badges,
                   COALESCE(st.current_streak_days, 0) AS current_streak_days,
                   COALESCE(st.longest_streak_days, 0) AS longest_streak_days
            FROM users u
            LEFT JOIN (SELECT user_id, SUM(xp_amount) AS total_xp FROM user_xp_transactions GROUP BY user_id) x ON x.user_id = u.id
            LEFT JOIN (SELECT user_id, COUNT(*) AS total_badges FROM user_achievements GROUP BY user_id) a ON a.user_id = u.id
            LEFT JOIN user_streaks st ON st.user_id = u.id;
        ');
    }

    public function down(): void
    {
        DB::statement('DROP VIEW IF EXISTS v_user_gamification;');
        DB::statement('DROP VIEW IF EXISTS v_project_results;');
        DB::statement('DROP VIEW IF EXISTS v_dashboard_projects;');
    }
};
