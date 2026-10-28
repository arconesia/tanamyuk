<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('project_notes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->date('note_date');
            $table->enum('condition_status', ['good', 'normal', 'attention'])->default('normal');
            $table->text('note_text')->nullable();
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('project_photos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->foreignId('project_note_id')->nullable()->constrained('project_notes')->nullOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->date('photo_date');
            $table->string('file_url', 500);
            $table->string('caption', 500)->nullable();
            $table->timestamp('created_at')->useCurrent();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('project_photos');
        Schema::dropIfExists('project_notes');
    }
};
