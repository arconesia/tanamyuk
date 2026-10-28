<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProjectProblemAction extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'project_problem_id',
        'user_id',
        'action_date',
        'action_text',
        'result_status',
    ];

    protected function casts(): array
    {
        return [
            'action_date' => 'datetime',
            'created_at' => 'datetime',
        ];
    }

    public function problem(): BelongsTo
    {
        return $this->belongsTo(ProjectProblem::class, 'project_problem_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
