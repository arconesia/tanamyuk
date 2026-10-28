<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProjectPhoto extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'cultivation_project_id',
        'project_note_id',
        'user_id',
        'photo_date',
        'file_url',
        'caption',
    ];

    protected function casts(): array
    {
        return [
            'photo_date' => 'date',
            'created_at' => 'datetime',
        ];
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(CultivationProject::class, 'cultivation_project_id');
    }

    public function note(): BelongsTo
    {
        return $this->belongsTo(ProjectNote::class, 'project_note_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
