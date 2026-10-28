<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserStreak extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'workspace_id',
        'current_streak_days',
        'longest_streak_days',
        'last_activity_date',
    ];

    protected function casts(): array
    {
        return [
            'current_streak_days' => 'integer',
            'longest_streak_days' => 'integer',
            'last_activity_date' => 'date',
            'updated_at' => 'datetime',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function workspace(): BelongsTo
    {
        return $this->belongsTo(Workspace::class);
    }
}
