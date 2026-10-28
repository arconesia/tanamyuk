<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Achievement extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'code',
        'name',
        'description',
        'xp_bonus',
        'icon',
        'criteria_type',
        'criteria_value',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'xp_bonus' => 'integer',
            'criteria_value' => 'decimal:2',
            'is_active' => 'boolean',
            'created_at' => 'datetime',
        ];
    }

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'user_achievements')
            ->withPivot(['workspace_id', 'cultivation_project_id', 'unlocked_at']);
    }
}
