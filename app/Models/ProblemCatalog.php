<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProblemCatalog extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'problem_catalog';

    protected $fillable = [
        'commodity_id',
        'code',
        'name',
        'symptom_label',
        'summary',
        'image_url',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'is_active' => 'boolean',
            'created_at' => 'datetime',
        ];
    }

    public function commodity(): BelongsTo
    {
        return $this->belongsTo(Commodity::class);
    }

    public function solutions(): HasMany
    {
        return $this->hasMany(ProblemSolution::class)->orderBy('step_no');
    }

    public function projectProblems(): HasMany
    {
        return $this->hasMany(ProjectProblem::class);
    }
}
