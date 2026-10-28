<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('commodities', function (Blueprint $table) {
            $table->id();
            $table->string('code', 30)->unique();
            $table->string('name', 100);
            $table->string('category', 100)->nullable();
            $table->string('description', 500)->nullable();
            $table->string('image_url', 500)->nullable();
            $table->unsignedInteger('default_duration_days')->nullable();
            $table->boolean('is_active')->default(true);
            $table->integer('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('commodity_products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('commodity_id')->constrained('commodities')->cascadeOnDelete();
            $table->string('code', 60)->unique();
            $table->string('name', 180);
            $table->decimal('price', 15, 2);
            $table->enum('access_type', ['lifetime', 'subscription'])->default('lifetime');
            $table->string('description', 700)->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('workspace_id')->constrained('workspaces')->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->string('order_no', 50)->unique();
            $table->decimal('subtotal', 15, 2)->default(0);
            $table->decimal('discount_amount', 15, 2)->default(0);
            $table->decimal('total_amount', 15, 2)->default(0);
            $table->enum('status', ['pending', 'paid', 'expired', 'cancelled', 'refunded'])->default('pending');
            $table->dateTime('ordered_at')->useCurrent();
            $table->dateTime('paid_at')->nullable();
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('order_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->cascadeOnDelete();
            $table->foreignId('commodity_product_id')->constrained('commodity_products')->cascadeOnDelete();
            $table->string('product_name', 180);
            $table->unsignedInteger('qty')->default(1);
            $table->decimal('unit_price', 15, 2);
            $table->decimal('total_price', 15, 2);
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->cascadeOnDelete();
            $table->string('provider', 50);
            $table->string('provider_reference', 120)->nullable();
            $table->string('payment_method', 80)->nullable();
            $table->decimal('amount', 15, 2);
            $table->enum('status', ['pending', 'paid', 'failed', 'expired', 'refunded'])->default('pending');
            $table->dateTime('paid_at')->nullable();
            $table->json('raw_response')->nullable();
            $table->timestamp('created_at')->useCurrent();
        });

        Schema::create('workspace_commodity_access', function (Blueprint $table) {
            $table->id();
            $table->foreignId('workspace_id')->constrained('workspaces')->cascadeOnDelete();
            $table->foreignId('commodity_id')->constrained('commodities')->cascadeOnDelete();
            $table->foreignId('commodity_product_id')->nullable()->constrained('commodity_products')->nullOnDelete();
            $table->foreignId('source_order_item_id')->nullable()->constrained('order_items')->nullOnDelete();
            $table->enum('access_type', ['lifetime', 'subscription', 'trial', 'admin_grant'])->default('lifetime');
            $table->dateTime('starts_at');
            $table->dateTime('ends_at')->nullable();
            $table->enum('status', ['active', 'expired', 'revoked'])->default('active');
            $table->timestamp('created_at')->useCurrent();

            $table->unique(['workspace_id', 'commodity_id'], 'uq_workspace_commodity');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('workspace_commodity_access');
        Schema::dropIfExists('payments');
        Schema::dropIfExists('order_items');
        Schema::dropIfExists('orders');
        Schema::dropIfExists('commodity_products');
        Schema::dropIfExists('commodities');
    }
};
