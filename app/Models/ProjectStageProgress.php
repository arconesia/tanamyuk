<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProjectStageProgress extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'project_stage_progress';

    protected $fillable = [
        'cultivation_project_id',
        'program_stage_id',
        'status',
        'completion_percent',
        'started_at',
        'completed_at',
        'xp_earned',
    ];

    protected function casts(): array
    {
        return [
            'completion_percent' => 'decimal:2',
            'xp_earned' => 'integer',
            'started_at' => 'datetime',
            'completed_at' => 'datetime',
            'created_at' => 'datetime',
        ];
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(CultivationProject::class, 'cultivation_project_id');
    }

    public function stage(): BelongsTo
    {
        return $this->belongsTo(ProgramStage::class, 'program_stage_id');
    }
}
