<?php

use App\Http\Controllers\ChallengeController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PlantController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

// Beranda (Dashboard)
Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
Route::post('/tasks/{task}/toggle', [DashboardController::class, 'toggleTask'])->name('tasks.toggle');

// Tanaman Saya & Proyek Budidaya
Route::prefix('plants')->name('plants.')->group(function () {
    Route::get('/', [PlantController::class, 'index'])->name('index');
    Route::post('/', [PlantController::class, 'store'])->name('store');

    // 5 Detail Tanaman Tabs
    Route::get('/{project}', [PlantController::class, 'show'])->name('show');
    Route::get('/{project}/timeline', [PlantController::class, 'timeline'])->name('timeline');
    Route::get('/{project}/problems', [PlantController::class, 'problems'])->name('problems');
    Route::post('/{project}/problems', [PlantController::class, 'storeProblem'])->name('problems.store');
    Route::get('/{project}/notes', [PlantController::class, 'notes'])->name('notes');
    Route::post('/{project}/notes', [PlantController::class, 'storeNote'])->name('notes.store');
    Route::get('/{project}/results', [PlantController::class, 'results'])->name('results');
    Route::post('/{project}/expenses', [PlantController::class, 'storeExpense'])->name('expenses.store');
    Route::post('/{project}/harvests', [PlantController::class, 'storeHarvest'])->name('harvests.store');
    Route::post('/{project}/sales', [PlantController::class, 'storeSale'])->name('sales.store');
});

// Problem Actions
Route::post('/problems/{problem}/action', [PlantController::class, 'storeProblemAction'])->name('problems.action.store');

// Tantangan (Gamification & Streaks)
Route::get('/challenges', [ChallengeController::class, 'index'])->name('challenges.index');

// Profil & Workspace Switcher
Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
Route::post('/workspaces/switch/{workspace}', [ProfileController::class, 'switchWorkspace'])->name('workspaces.switch');
Route::post('/auth/switch-user/{user}', [ProfileController::class, 'switchUser'])->name('auth.switch-user');
Route::post('/commodities/grant', [ProfileController::class, 'addCommodityAccess'])->name('commodities.grant');

// Indonesian URL aliases
Route::redirect('/tanaman', '/plants');
Route::redirect('/tantangan', '/challenges');
Route::redirect('/profil', '/profile');
