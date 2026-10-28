<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class HarvestSale extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'cultivation_project_id',
        'harvest_id',
        'sold_by',
        'sale_date',
        'buyer_name',
        'qty_kg',
        'price_per_kg',
        'total_amount',
        'payment_status',
    ];

    protected function casts(): array
    {
        return [
            'sale_date' => 'date',
            'qty_kg' => 'decimal:2',
            'price_per_kg' => 'decimal:2',
            'total_amount' => 'decimal:2',
            'created_at' => 'datetime',
        ];
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(CultivationProject::class, 'cultivation_project_id');
    }

    public function harvest(): BelongsTo
    {
        return $this->belongsTo(Harvest::class);
    }

    public function seller(): BelongsTo
    {
        return $this->belongsTo(User::class, 'sold_by');
    }
}
