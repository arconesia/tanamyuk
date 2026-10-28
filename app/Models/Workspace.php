<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Workspace extends Model
{
    use HasFactory;

    protected $fillable = [
        'owner_user_id',
        'name',
        'slug',
        'type',
        'timezone',
        'currency',
        'status',
    ];

    public function owner(): BelongsTo
    {
        return $this->belongsTo(User::class, 'owner_user_id');
    }

    public function members(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'workspace_members')
            ->withPivot(['id', 'role', 'status', 'joined_at', 'created_at']);
    }

    public function workspaceMembers(): HasMany
    {
        return $this->hasMany(WorkspaceMember::class);
    }

    public function commodityAccess(): HasMany
    {
        return $this->hasMany(WorkspaceCommodityAccess::class);
    }

    public function commodities(): BelongsToMany
    {
        return $this->belongsToMany(Commodity::class, 'workspace_commodity_access')
            ->withPivot(['id', 'commodity_product_id', 'source_order_item_id', 'access_type', 'starts_at', 'ends_at', 'status']);
    }

    public function cultivationProjects(): HasMany
    {
        return $this->hasMany(CultivationProject::class);
    }

    public function activeProjects(): HasMany
    {
        return $this->hasMany(CultivationProject::class)->where('status', 'active');
    }

    public function completedProjects(): HasMany
    {
        return $this->hasMany(CultivationProject::class)->where('status', 'completed');
    }

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }

    public function reminders(): HasMany
    {
        return $this->hasMany(Reminder::class);
    }

    public function notifications(): HasMany
    {
        return $this->hasMany(Notification::class);
    }
}
