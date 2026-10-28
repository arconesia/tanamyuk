<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Harvest extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'cultivation_project_id',
        'harvest_no',
        'recorded_by',
        'harvest_date',
        'weight_kg',
        'note',
        'photo_url',
    ];

    protected function casts(): array
    {
        return [
            'harvest_no' => 'integer',
            'harvest_date' => 'date',
            'weight_kg' => 'decimal:2',
            'created_at' => 'datetime',
        ];
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(CultivationProject::class, 'cultivation_project_id');
    }

    public function recorder(): BelongsTo
    {
        return $this->belongsTo(User::class, 'recorded_by');
    }

    public function sales(): HasMany
    {
        return $this->hasMany(HarvestSale::class);
    }
}
