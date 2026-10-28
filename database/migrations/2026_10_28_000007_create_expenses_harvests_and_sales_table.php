<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('expense_categories', function (Blueprint $table) {
            $table->id();
            $table->string('code', 50)->unique();
            $table->string('name', 120);
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('project_expenses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->foreignId('expense_category_id')->constrained('expense_categories')->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->date('expense_date');
            $table->string('description', 250);
            $table->decimal('amount', 15, 2);
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('harvests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->unsignedInteger('harvest_no');
            $table->foreignId('recorded_by')->constrained('users')->cascadeOnDelete();
            $table->date('harvest_date');
            $table->decimal('weight_kg', 12, 2)->default(0);
            $table->string('note', 500)->nullable();
            $table->string('photo_url', 500)->nullable();
            $table->timestamp('created_at')->useCurrent();

            $table->unique(['cultivation_project_id', 'harvest_no'], 'uq_project_harvest');
        });

        Schema::create('harvest_sales', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cultivation_project_id')->constrained('cultivation_projects')->cascadeOnDelete();
            $table->foreignId('harvest_id')->nullable()->constrained('harvests')->nullOnDelete();
            $table->foreignId('sold_by')->constrained('users')->cascadeOnDelete();
            $table->date('sale_date');
            $table->string('buyer_name', 180)->nullable();
            $table->decimal('qty_kg', 12, 2);
            $table->decimal('price_per_kg', 15, 2);
            $table->decimal('total_amount', 15, 2);
            $table->enum('payment_status', ['unpaid', 'partial', 'paid'])->default('paid');
            $table->timestamp('created_at')->useCurrent();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('harvest_sales');
        Schema::dropIfExists('harvests');
        Schema::dropIfExists('project_expenses');
        Schema::dropIfExists('expense_categories');
    }
};
