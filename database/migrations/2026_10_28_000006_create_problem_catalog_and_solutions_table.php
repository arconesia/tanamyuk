<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('problem_catalog', function (Blueprint $table) {
            $table->id();
            $table->foreignId('commodity_id')->constrained('commodities')->cascadeOnDelete();
            $table->string('code', 60);
            $table->string('name', 160);
            $table->string('symptom_label', 180);
            $table->string('summary', 700)->nullable();
            $table->string('image_url', 500)->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamp('created_at')->useCurrent();

            $table->unique(['commodity_id', 'code'], 'uq_problem_catalog_code');
        });

        Schema::create('problem_solutions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('problem_catalog_id')->constrained('problem_catalog')->cascadeOnDelete();
            $table->unsignedInteger('step_no');
            $table->string('action_text', 700);
            $table->timestamp('created_at')->useCurrent();

            $table->unique(['problem_catalog_id', 'step_no'], 'uq_problem_solution_step');
        });

        Schema::create('project_problems', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->foreignId('problem_catalog_id')->nullable()->constrained('problem_catalog')->nullOnDelete();
            $table->foreignId('reported_by')->constrained('users')->cascadeOnDelete();
            $table->string('title', 180);
            $table->string('description', 1000)->nullable();
            $table->enum('status', ['open', 'monitoring', 'resolved'])->default('open');
            $table->dateTime('detected_at');
            $table->dateTime('resolved_at')->nullable();
            $table->string('photo_url', 500)->nullable();
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('project_problem_actions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_problem_id')->constrained('project_problems')->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->dateTime('action_date');
            $table->string('action_text', 700);
            $table->enum('result_status', ['done', 'improved', 'no_change', 'resolved'])->default('done');
            $table->timestamp('created_at')->useCurrent();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('project_problem_actions');
        Schema::dropIfExists('project_problems');
        Schema::dropIfExists('problem_solutions');
        Schema::dropIfExists('problem_catalog');
    }
};
