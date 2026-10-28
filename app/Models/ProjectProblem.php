<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProjectProblem extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'cultivation_project_id',
        'problem_catalog_id',
        'reported_by',
        'title',
        'description',
        'status',
        'detected_at',
        'resolved_at',
        'photo_url',
    ];

    protected function casts(): array
    {
        return [
            'detected_at' => 'datetime',
            'resolved_at' => 'datetime',
            'created_at' => 'datetime',
        ];
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(CultivationProject::class, 'cultivation_project_id');
    }

    public function catalog(): BelongsTo
    {
        return $this->belongsTo(ProblemCatalog::class, 'problem_catalog_id');
    }

    public function reporter(): BelongsTo
    {
        return $this->belongsTo(User::class, 'reported_by');
    }

    public function actions(): HasMany
    {
        return $this->hasMany(ProjectProblemAction::class)->orderBy('action_date');
    }
}
