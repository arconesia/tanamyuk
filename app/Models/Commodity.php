<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Commodity extends Model
{
    use HasFactory;

    protected $fillable = [
        'code',
        'name',
        'category',
        'description',
        'image_url',
        'default_duration_days',
        'is_active',
        'sort_order',
    ];

    protected function casts(): array
    {
        return [
            'is_active' => 'boolean',
            'default_duration_days' => 'integer',
            'sort_order' => 'integer',
        ];
    }

    public function products(): HasMany
    {
        return $this->hasMany(CommodityProduct::class);
    }

    public function programs(): HasMany
    {
        return $this->hasMany(CultivationProgram::class);
    }

    public function problemCatalog(): HasMany
    {
        return $this->hasMany(ProblemCatalog::class);
    }

    public function workspaceAccess(): HasMany
    {
        return $this->hasMany(WorkspaceCommodityAccess::class);
    }
}
