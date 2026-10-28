<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cultivation_projects', function (Blueprint $table) {
            $table->id();
            $table->foreignId('workspace_id')->constrained('workspaces')->cascadeOnDelete();
            $table->foreignId('cultivation_program_id')->constrained('cultivation_programs')->cascadeOnDelete();
            $table->foreignId('created_by')->constrained('users')->cascadeOnDelete();
            $table->string('project_code', 60)->unique();
            $table->string('name', 180);
            $table->unsignedInteger('cycle_no')->default(1);
            $table->string('location_name', 180)->nullable();
            $table->unsignedInteger('initial_plant_count')->default(0);
            $table->unsignedInteger('current_plant_count')->default(0);
            $table->date('start_date');
            $table->date('estimated_harvest_date')->nullable();
            $table->date('actual_end_date')->nullable();
            $table->enum('status', ['draft', 'active', 'paused', 'completed', 'cancelled'])->default('active');
            $table->decimal('target_yield_kg', 12, 2)->nullable();
            $table->string('notes', 1000)->nullable();
            $table->timestamps();

            $table->index(['workspace_id', 'status'], 'idx_projects_workspace_status');
        });

        Schema::create('project_members', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->enum('role', ['manager', 'member', 'viewer'])->default('member');
            $table->dateTime('joined_at')->useCurrent();

            $table->unique(['cultivation_project_id', 'user_id'], 'uq_project_member');
        });

        Schema::create('project_stage_progress', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->foreignId('program_stage_id')->constrained('program_stages')->cascadeOnDelete();
            $table->enum('status', ['locked', 'active', 'completed', 'skipped'])->default('locked');
            $table->decimal('completion_percent', 5, 2)->default(0);
            $table->dateTime('started_at')->nullable();
            $table->dateTime('completed_at')->nullable();
            $table->unsignedInteger('xp_earned')->default(0);
            $table->timestamp('created_at')->useCurrent();

            $table->unique(['cultivation_project_id', 'program_stage_id'], 'uq_project_stage');
        });

        Schema::create('project_tasks', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->foreignId('stage_task_id')->nullable()->constrained('stage_tasks')->nullOnDelete();
            $table->foreignId('assigned_to')->nullable()->constrained('users')->nullOnDelete();
            $table->string('title', 180);
            $table->string('instruction', 500)->nullable();
            $table->enum('task_type', ['watering', 'fertilizing', 'inspection', 'weeding', 'photo', 'planting', 'harvest', 'other'])->default('other');
            $table->dateTime('due_at')->nullable();
            $table->enum('status', ['pending', 'done', 'skipped', 'overdue'])->default('pending');
            $table->unsignedInteger('xp_reward')->default(0);
            $table->dateTime('completed_at')->nullable();
            $table->foreignId('completed_by')->nullable()->constrained('users')->nullOnDelete();
            $table->enum('source', ['system', 'manual'])->default('system');
            $table->timestamps();

            $table->index(['cultivation_project_id', 'status', 'due_at'], 'idx_project_tasks_today');
        });

        Schema::create('reminders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('workspace_id')->constrained('workspaces')->cascadeOnDelete();
            $table->foreignId('cultivation_project_id')->nullable()->constrained('cultivation_projects')->nullOnDelete();
            $table->foreignId('project_task_id')->nullable()->constrained('project_tasks')->nullOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->string('title', 180);
            $table->dateTime('remind_at');
            $table->enum('channel', ['in_app', 'push', 'email', 'whatsapp'])->default('push');
            $table->boolean('is_enabled')->default(true);
            $table->dateTime('sent_at')->nullable();
            $table->timestamp('created_at')->useCurrent();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('reminders');
        Schema::dropIfExists('project_tasks');
        Schema::dropIfExists('project_stage_progress');
        Schema::dropIfExists('project_members');
        Schema::dropIfExists('cultivation_projects');
    }
};
