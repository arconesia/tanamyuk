<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProgramStage extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'cultivation_program_id',
        'stage_no',
        'code',
        'name',
        'start_day',
        'end_day',
        'description',
        'xp_reward',
    ];

    protected function casts(): array
    {
        return [
            'stage_no' => 'integer',
            'start_day' => 'integer',
            'end_day' => 'integer',
            'xp_reward' => 'integer',
            'created_at' => 'datetime',
        ];
    }

    public function program(): BelongsTo
    {
        return $this->belongsTo(CultivationProgram::class, 'cultivation_program_id');
    }

    public function tasks(): HasMany
    {
        return $this->hasMany(StageTask::class)->orderBy('sort_order');
    }

    public function projectProgress(): HasMany
    {
        return $this->hasMany(ProjectStageProgress::class);
    }
}
