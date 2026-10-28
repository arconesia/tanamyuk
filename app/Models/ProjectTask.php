<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProjectTask extends Model
{
    use HasFactory;

    protected $fillable = [
        'cultivation_project_id',
        'stage_task_id',
        'assigned_to',
        'title',
        'instruction',
        'task_type',
        'due_at',
        'status',
        'xp_reward',
        'completed_at',
        'completed_by',
        'source',
    ];

    protected function casts(): array
    {
        return [
            'due_at' => 'datetime',
            'completed_at' => 'datetime',
            'xp_reward' => 'integer',
        ];
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(CultivationProject::class, 'cultivation_project_id');
    }

    public function stageTask(): BelongsTo
    {
        return $this->belongsTo(StageTask::class, 'stage_task_id');
    }

    public function assignee(): BelongsTo
    {
        return $this->belongsTo(User::class, 'assigned_to');
    }

    public function completedByUser(): BelongsTo
    {
        return $this->belongsTo(User::class, 'completed_by');
    }

    public function reminders(): HasMany
    {
        return $this->hasMany(Reminder::class);
    }
}
