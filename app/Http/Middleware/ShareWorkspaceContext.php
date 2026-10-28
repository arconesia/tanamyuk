<?php

namespace App\Http\Middleware;

use App\Models\User;
use App\Services\WorkspaceManager;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Symfony\Component\HttpFoundation\Response;

class ShareWorkspaceContext
{
    public function __construct(protected WorkspaceManager $workspaceManager) {}

    public function handle(Request $request, Closure $next): Response
    {
        $currentUser = $this->workspaceManager->getCurrentUser();
        $currentWorkspace = $this->workspaceManager->getCurrentWorkspace();
        $userWorkspaces = $currentUser->workspaces()->get();
        $allDemoUsers = User::all();

        View::share('currentUser', $currentUser);
        View::share('currentWorkspace', $currentWorkspace);
        View::share('userWorkspaces', $userWorkspaces);
        View::share('allDemoUsers', $allDemoUsers);

        return $next($request);
    }
}
