<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class CultivationProject extends Model
{
    use HasFactory;

    protected $fillable = [
        'workspace_id',
        'cultivation_program_id',
        'created_by',
        'project_code',
        'name',
        'cycle_no',
        'location_name',
        'initial_plant_count',
        'current_plant_count',
        'start_date',
        'estimated_harvest_date',
        'actual_end_date',
        'status',
        'target_yield_kg',
        'notes',
    ];

    protected function casts(): array
    {
        return [
            'cycle_no' => 'integer',
            'initial_plant_count' => 'integer',
            'current_plant_count' => 'integer',
            'start_date' => 'date',
            'estimated_harvest_date' => 'date',
            'actual_end_date' => 'date',
            'target_yield_kg' => 'decimal:2',
        ];
    }

    public function workspace(): BelongsTo
    {
        return $this->belongsTo(Workspace::class);
    }

    public function program(): BelongsTo
    {
        return $this->belongsTo(CultivationProgram::class, 'cultivation_program_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function members(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'project_members')
            ->withPivot(['id', 'role', 'joined_at']);
    }

    public function stageProgress(): HasMany
    {
        return $this->hasMany(ProjectStageProgress::class);
    }

    public function activeStageProgress()
    {
        return $this->hasOne(ProjectStageProgress::class)->where('status', 'active');
    }

    public function tasks(): HasMany
    {
        return $this->hasMany(ProjectTask::class);
    }

    public function todayTasks(): HasMany
    {
        return $this->hasMany(ProjectTask::class)->orderByRaw("status = 'pending' DESC")->orderBy('due_at');
    }

    public function projectNotes(): HasMany
    {
        return $this->hasMany(ProjectNote::class)->orderByDesc('note_date');
    }

    public function photos(): HasMany
    {
        return $this->hasMany(ProjectPhoto::class)->orderByDesc('photo_date');
    }

    public function problems(): HasMany
    {
        return $this->hasMany(ProjectProblem::class)->orderByDesc('detected_at');
    }

    public function expenses(): HasMany
    {
        return $this->hasMany(ProjectExpense::class)->orderByDesc('expense_date');
    }

    public function harvests(): HasMany
    {
        return $this->hasMany(Harvest::class)->orderBy('harvest_no');
    }

    public function sales(): HasMany
    {
        return $this->hasMany(HarvestSale::class)->orderByDesc('sale_date');
    }

    // Computed Attributes
    public function getDaysElapsedAttribute(): int
    {
        $startDate = Carbon::parse($this->start_date)->startOfDay();
        $targetDate = $this->actual_end_date ? Carbon::parse($this->actual_end_date)->startOfDay() : Carbon::now()->startOfDay();
        $diff = (int) $startDate->diffInDays($targetDate) + 1;

        return max(1, $diff);
    }

    public function getDaysUntilHarvestAttribute(): ?int
    {
        if (! $this->estimated_harvest_date) {
            return null;
        }
        $now = Carbon::now()->startOfDay();
        $harvest = Carbon::parse($this->estimated_harvest_date)->startOfDay();

        return (int) $now->diffInDays($harvest, false);
    }

    public function getCurrentStageNameAttribute(): string
    {
        $active = $this->stageProgress()->where('status', 'active')->with('stage')->first();
        if ($active && $active->stage) {
            return $active->stage->name;
        }

        $lastCompleted = $this->stageProgress()->where('status', 'completed')->with('stage')->latest('completed_at')->first();
        if ($lastCompleted && $lastCompleted->stage) {
            return $lastCompleted->stage->name;
        }

        return 'Mulai';
    }

    public function getCurrentProgressPercentAttribute(): float
    {
        $active = $this->stageProgress()->where('status', 'active')->first();
        if ($active) {
            return (float) $active->completion_percent;
        }
        if ($this->status === 'completed') {
            return 100.0;
        }

        return 0.0;
    }

    public function getTotalExpenseAttribute(): float
    {
        return (float) $this->expenses()->sum('amount');
    }

    public function getTotalHarvestKgAttribute(): float
    {
        return (float) $this->harvests()->sum('weight_kg');
    }

    public function getTotalSalesAttribute(): float
    {
        return (float) $this->sales()->sum('total_amount');
    }

    public function getNetProfitLossAttribute(): float
    {
        return $this->total_sales - $this->total_expense;
    }
}
