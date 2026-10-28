<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('achievements', function (Blueprint $table) {
            $table->id();
            $table->string('code', 60)->unique();
            $table->string('name', 140);
            $table->string('description', 500);
            $table->unsignedInteger('xp_bonus')->default(0);
            $table->string('icon', 150)->nullable();
            $table->enum('criteria_type', ['first_project', 'task_count', 'streak_days', 'problem_resolved', 'first_harvest', 'cycle_complete', 'custom']);
            $table->decimal('criteria_value', 12, 2)->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('user_xp_transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('workspace_id')->constrained('workspaces')->cascadeOnDelete();
            $table->foreignId('cultivation_project_id')->nullable()->constrained('cultivation_projects')->nullOnDelete();
            $table->enum('source_type', ['task', 'stage', 'achievement', 'problem', 'harvest', 'streak', 'manual']);
            $table->unsignedBigInteger('source_id')->nullable();
            $table->integer('xp_amount');
            $table->string('description', 250)->nullable();
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('user_achievements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('workspace_id')->constrained('workspaces')->cascadeOnDelete();
            $table->foreignId('achievement_id')->constrained('achievements')->cascadeOnDelete();
            $table->foreignId('cultivation_project_id')->nullable()->constrained('cultivation_projects')->nullOnDelete();
            $table->timestamp('unlocked_at')->useCurrent();

            $table->unique(['user_id', 'workspace_id', 'achievement_id'], 'uq_user_achievement');
        });

        Schema::create('user_streaks', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('workspace_id')->constrained('workspaces')->cascadeOnDelete();
            $table->unsignedInteger('current_streak_days')->default(0);
            $table->unsignedInteger('longest_streak_days')->default(0);
            $table->date('last_activity_date')->nullable();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();

            $table->unique(['user_id', 'workspace_id'], 'uq_user_workspace_streak');
        });

        Schema::create('notifications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('workspace_id')->constrained('workspaces')->cascadeOnDelete();
            $table->string('title', 180);
            $table->string('body', 700);
            $table->string('type', 80);
            $table->json('data')->nullable();
            $table->enum('status', ['queued', 'sent', 'read', 'failed'])->default('queued');
            $table->timestamp('created_at')->useCurrent();
            $table->dateTime('sent_at')->nullable();
            $table->dateTime('read_at')->nullable();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('notifications');
        Schema::dropIfExists('user_streaks');
        Schema::dropIfExists('user_achievements');
        Schema::dropIfExists('user_xp_transactions');
        Schema::dropIfExists('achievements');
    }
};
