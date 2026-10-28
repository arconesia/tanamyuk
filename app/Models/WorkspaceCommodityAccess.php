<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class WorkspaceCommodityAccess extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'workspace_commodity_access';

    protected $fillable = [
        'workspace_id',
        'commodity_id',
        'commodity_product_id',
        'source_order_item_id',
        'access_type',
        'starts_at',
        'ends_at',
        'status',
    ];

    protected function casts(): array
    {
        return [
            'starts_at' => 'datetime',
            'ends_at' => 'datetime',
            'created_at' => 'datetime',
        ];
    }

    public function workspace(): BelongsTo
    {
        return $this->belongsTo(Workspace::class);
    }

    public function commodity(): BelongsTo
    {
        return $this->belongsTo(Commodity::class);
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(CommodityProduct::class, 'commodity_product_id');
    }
}
