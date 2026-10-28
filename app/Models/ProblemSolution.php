<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProblemSolution extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'problem_catalog_id',
        'step_no',
        'action_text',
    ];

    protected function casts(): array
    {
        return [
            'step_no' => 'integer',
            'created_at' => 'datetime',
        ];
    }

    public function problem(): BelongsTo
    {
        return $this->belongsTo(ProblemCatalog::class, 'problem_catalog_id');
    }
}
