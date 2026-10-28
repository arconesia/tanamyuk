<?php

namespace App\Services;

use App\Models\User;
use App\Models\Workspace;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class WorkspaceManager
{
    /**
     * Get the current active user (defaults to user ID 1 Robbi if not logged in).
     */
    public function getCurrentUser(): User
    {
        if (Auth::check()) {
            return Auth::user();
        }

        $userId = Session::get('active_user_id', 1);
        $user = User::find($userId) ?? User::first();

        if ($user && ! Auth::check()) {
            Auth::login($user);
        }

        return $user;
    }

    /**
     * Get the current active workspace for the user.
     */
    public function getCurrentWorkspace(): ?Workspace
    {
        $user = $this->getCurrentUser();

        $activeWorkspaceId = Session::get('active_workspace_id');

        if ($activeWorkspaceId) {
            $workspace = $user->workspaces()->where('workspaces.id', $activeWorkspaceId)->first();
            if ($workspace) {
                return $workspace;
            }
        }

        // Default to first workspace user belongs to or owns
        $defaultWorkspace = $user->workspaces()->first() ?? $user->ownedWorkspaces()->first() ?? Workspace::first();

        if ($defaultWorkspace) {
            Session::put('active_workspace_id', $defaultWorkspace->id);
        }

        return $defaultWorkspace;
    }

    /**
     * Switch active workspace.
     */
    public function switchWorkspace(int $workspaceId): bool
    {
        $user = $this->getCurrentUser();
        $workspace = $user->workspaces()->where('workspaces.id', $workspaceId)->first();

        if ($workspace) {
            Session::put('active_workspace_id', $workspace->id);

            return true;
        }

        return false;
    }

    /**
     * Switch active user (for rapid demo / testing).
     */
    public function switchUser(int $userId): bool
    {
        $user = User::find($userId);
        if ($user) {
            Auth::login($user);
            Session::put('active_user_id', $user->id);
            Session::forget('active_workspace_id');
            $this->getCurrentWorkspace();

            return true;
        }

        return false;
    }
}
