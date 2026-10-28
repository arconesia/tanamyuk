<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class StageTask extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'program_stage_id',
        'code',
        'title',
        'short_instruction',
        'task_type',
        'recurrence_type',
        'recurrence_interval',
        'default_time',
        'xp_reward',
        'is_required',
        'sort_order',
    ];

    protected function casts(): array
    {
        return [
            'recurrence_interval' => 'integer',
            'xp_reward' => 'integer',
            'is_required' => 'boolean',
            'sort_order' => 'integer',
            'created_at' => 'datetime',
        ];
    }

    public function stage(): BelongsTo
    {
        return $this->belongsTo(ProgramStage::class, 'program_stage_id');
    }

    public function projectTasks(): HasMany
    {
        return $this->hasMany(ProjectTask::class);
    }
}
