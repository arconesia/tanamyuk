<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cultivation_programs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('commodity_id')->constrained('commodities')->cascadeOnDelete();
            $table->string('code', 70)->unique();
            $table->string('name', 180);
            $table->unsignedInteger('duration_days');
            $table->string('description', 700)->nullable();
            $table->string('cover_image_url', 500)->nullable();
            $table->boolean('is_published')->default(true);
            $table->timestamps();
        });

        Schema::create('program_stages', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_program_id')->constrained('cultivation_programs')->cascadeOnDelete();
            $table->unsignedInteger('stage_no');
            $table->string('code', 50);
            $table->string('name', 100);
            $table->unsignedInteger('start_day');
            $table->unsignedInteger('end_day');
            $table->string('description', 700)->nullable();
            $table->unsignedInteger('xp_reward')->default(0);
            $table->timestamp('created_at')->useCurrent();

            $table->unique(['cultivation_program_id', 'stage_no'], 'uq_program_stage_no');
        });

        Schema::create('stage_tasks', function (Blueprint $table) {
            $table->id();
            $table->foreignId('program_stage_id')->constrained('program_stages')->cascadeOnDelete();
            $table->string('code', 70);
            $table->string('title', 180);
            $table->string('short_instruction', 500)->nullable();
            $table->enum('task_type', ['watering', 'fertilizing', 'inspection', 'weeding', 'photo', 'planting', 'harvest', 'other'])->default('other');
            $table->enum('recurrence_type', ['once', 'daily', 'weekly', 'interval'])->default('once');
            $table->unsignedInteger('recurrence_interval')->nullable();
            $table->time('default_time')->nullable();
            $table->unsignedInteger('xp_reward')->default(10);
            $table->boolean('is_required')->default(true);
            $table->integer('sort_order')->default(0);
            $table->timestamp('created_at')->useCurrent();

            $table->unique(['program_stage_id', 'code'], 'uq_stage_task_code');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('stage_tasks');
        Schema::dropIfExists('program_stages');
        Schema::dropIfExists('cultivation_programs');
    }
};
