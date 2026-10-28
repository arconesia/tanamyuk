<?php

namespace App\Http\Controllers;

use App\Models\Achievement;
use App\Models\UserStreak;
use App\Models\UserXpTransaction;
use App\Services\WorkspaceManager;

class ChallengeController extends Controller
{
    public function __construct(protected WorkspaceManager $workspaceManager) {}

    public function index()
    {
        $user = $this->workspaceManager->getCurrentUser();
        $workspace = $this->workspaceManager->getCurrentWorkspace();

        $streak = UserStreak::where('user_id', $user->id)
            ->where('workspace_id', $workspace->id ?? 1)
            ->first();

        $currentStreak = $streak ? $streak->current_streak_days : 0;
        $longestStreak = $streak ? $streak->longest_streak_days : 0;

        $totalXp = $user->total_xp;
        $level = $user->level;
        $levelTarget = $level * 300;
        $levelBase = ($level - 1) * 300;
        $progressInLevel = max(0, $totalXp - $levelBase);
        $levelPercent = min(100, round(($progressInLevel / 300) * 100));

        $achievements = Achievement::where('is_active', true)->get();
        $unlockedAchievementIds = $user->achievements()->pluck('achievements.id')->toArray();

        $recentXp = UserXpTransaction::where('user_id', $user->id)
            ->where('workspace_id', $workspace->id ?? 1)
            ->latest('created_at')
            ->take(8)
            ->get();

        return view('pages.challenges.index', compact(
            'user',
            'workspace',
            'currentStreak',
            'longestStreak',
            'totalXp',
            'level',
            'levelTarget',
            'levelPercent',
            'achievements',
            'unlockedAchievementIds',
            'recentXp'
        ));
    }
}
