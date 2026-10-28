<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class CultivationProgram extends Model
{
    use HasFactory;

    protected $fillable = [
        'commodity_id',
        'code',
        'name',
        'duration_days',
        'description',
        'cover_image_url',
        'is_published',
    ];

    protected function casts(): array
    {
        return [
            'duration_days' => 'integer',
            'is_published' => 'boolean',
        ];
    }

    public function commodity(): BelongsTo
    {
        return $this->belongsTo(Commodity::class);
    }

    public function stages(): HasMany
    {
        return $this->hasMany(ProgramStage::class)->orderBy('stage_no');
    }

    public function projects(): HasMany
    {
        return $this->hasMany(CultivationProject::class);
    }
}
