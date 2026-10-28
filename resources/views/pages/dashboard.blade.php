@extends('layouts.app')

@section('title', 'TanamYuk - Beranda Budidaya')

@section('content')
<div class="space-y-6">
    
    <!-- Greeting Banner & Weather Widget -->
    <section class="bg-gradient-to-r from-emerald-800 via-emerald-700 to-teal-800 rounded-3xl p-6 sm:p-8 text-white shadow-lg relative overflow-hidden flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div class="relative z-10 space-y-1.5">
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/20 backdrop-blur-xs text-xs font-bold text-white mb-1 border border-white/20 shadow-2xs">
                <span class="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
                <span>{{ $currentWorkspace->name }} • {{ ucfirst($currentWorkspace->type) }}</span>
            </div>
            <h1 class="text-2xl sm:text-3xl font-black tracking-tight leading-tight">
                Selamat berbudidaya, <span class="text-emerald-300">{{ $currentUser->name }}!</span>
            </h1>
            <p class="text-xs sm:text-sm text-emerald-50 font-semibold">
                Pantau perkembangan siklus tanam, selesaikan tugas harian, dan raih panen maksimal.
            </p>
        </div>

        <!-- Weather Widget Card -->
        <div class="relative z-10 flex items-center gap-3.5 bg-white/15 backdrop-blur-md border border-white/25 rounded-2xl py-3 px-4 shadow-sm shrink-0">
            <div class="w-11 h-11 rounded-xl bg-amber-400/30 flex items-center justify-center text-amber-300">
                <svg class="w-7 h-7 fill-current" viewBox="0 0 24 24">
                    <path d="M12 7c-2.76 0-5 2.24-5 5s2.24 5 5 5 5-2.24 5-5-2.24-5-5-5zm0 8c-1.65 0-3-1.35-3-3s1.35-3 3-3 3 1.35 3 3-1.35 3-3 3zm0-13c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1s1-.45 1-1V3c0-.55-.45-1-1-1zm0 18c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1s1-.45 1-1v-2c0-.55-.45-1-1-1zm10-9c0-.55-.45-1-1-1h-2c-.55 0-1 .45-1 1s.45 1 1 1h2c.55 0 1-.45 1-1zm-18 0c0-.55-.45-1-1-1H1c-.55 0-1 .45-1 1s.45 1 1 1h2c.55 0 1-.45 1-1zm14.07-7.07c-.39-.39-1.02-.39-1.41 0s-.39 1.02 0 1.41l1.41 1.41c.39.39 1.02.39 1.41 0s.39-1.02 0-1.41l-1.41-1.41zM6.34 17.66c-.39-.39-1.02-.39-1.41 0s-.39 1.02 0 1.41l1.41 1.41c.39.39 1.02.39 1.41 0s.39-1.02 0-1.41l-1.41-1.41zm12.73 0c-.39-.39-1.02-.39-1.41 0s-.39 1.02 0 1.41l1.41 1.41c.39.39 1.02.39 1.41 0s.39-1.02 0-1.41l-1.41-1.41zM6.34 6.34c-.39-.39-1.02-.39-1.41 0s-.39 1.02 0 1.41l1.41 1.41c.39.39 1.02.39 1.41 0s.39-1.02 0-1.41L6.34 6.34z"></path>
                </svg>
            </div>
            <div class="text-left">
                <span class="block text-base font-black text-white leading-none">{{ $weather['temp'] }}</span>
                <span class="text-xs font-bold text-emerald-100 mt-1 block">{{ $weather['condition'] }} • Lahan Terbuka</span>
            </div>
        </div>

        <!-- Decorative Pattern -->
        <div class="absolute -right-10 -bottom-10 opacity-10 pointer-events-none">
            <svg class="w-64 h-64 fill-white" viewBox="0 0 24 24">
                <path d="M17 8C8 10 5.9 16.17 3.82 21.34L5.71 22l1-2.3A9.49 9.49 0 0 0 12 21c7 0 11-8 11-14a5 5 0 0 0-5-5c-3 0-5 2-6 5 2-1 4-1 5 1z"></path>
            </svg>
        </div>
    </section>

    <!-- Main Grid: 2 Columns on Desktop -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-start">
        
        <!-- Left Column: Tasks & Quick Workspace Context (5 Cols on LG) -->
        <div class="lg:col-span-5 space-y-6">
            
            <!-- Today Tasks Section -->
            <section class="bg-white rounded-3xl p-5 border border-slate-200 shadow-xs space-y-4">
                <div class="flex justify-between items-center pb-2.5 border-b border-slate-100">
                    <div>
                        <h2 class="font-black text-base text-slate-900 tracking-tight">Tugas Hari Ini</h2>
                        <p class="text-xs text-slate-600 font-bold">Beri tanda selesai untuk raih XP</p>
                    </div>
                    <span class="px-3 py-1 rounded-full text-xs font-black {{ $todayTasks->count() > 0 ? 'bg-amber-100 text-amber-900 border border-amber-200' : 'bg-emerald-100 text-emerald-900 border border-emerald-200' }}">
                        {{ $todayTasks->where('status', 'done')->count() }}/{{ $todayTasks->count() }} Selesai
                    </span>
                </div>

                <div class="space-y-2.5">
                    @forelse($todayTasks as $task)
                        <form action="{{ route('tasks.toggle', $task) }}" method="POST" class="m-0">
                            @csrf
                            <label onclick="this.closest('form').submit()" class="flex items-center justify-between p-3.5 bg-slate-50 border border-slate-200 rounded-2xl cursor-pointer hover:bg-emerald-50 hover:border-emerald-300 transition shadow-2xs {{ $task->status === 'done' ? 'opacity-70 bg-slate-100' : '' }}">
                                <div class="flex items-center gap-3">
                                    <input type="checkbox" {{ $task->status === 'done' ? 'checked' : '' }} class="w-5 h-5 rounded-md border-slate-400 text-emerald-700 focus:ring-emerald-600 transition cursor-pointer" onclick="event.stopPropagation(); this.closest('form').submit()"/>
                                    <div>
                                        <p class="text-xs sm:text-sm font-extrabold text-slate-900 leading-tight {{ $task->status === 'done' ? 'line-through text-slate-500' : '' }}">
                                            {{ $task->title }}
                                        </p>
                                        <p class="text-xs text-slate-600 mt-0.5 font-bold">
                                            {{ $task->project->name }}
                                        </p>
                                    </div>
                                </div>
                                <span class="px-2.5 py-1 text-xs font-black text-emerald-800 bg-emerald-100 border border-emerald-200 rounded-full tracking-wide shrink-0">
                                    +{{ $task->xp_reward }} XP
                                </span>
                            </label>
                        </form>
                    @empty
                        <div class="p-6 text-center bg-slate-50 rounded-2xl border-2 border-dashed border-slate-200">
                            <span class="text-3xl">🎉</span>
                            <p class="text-sm font-black text-slate-900 mt-2">Semua tugas hari ini telah selesai!</p>
                            <p class="text-xs text-slate-600 font-semibold mt-0.5">Tanaman Anda terawat optimal.</p>
                        </div>
                    @endforelse
                </div>
            </section>

            <!-- Quick Action / Challenge Promo -->
            <section class="bg-gradient-to-br from-amber-500 to-orange-600 rounded-3xl p-5 text-white shadow-sm flex items-center justify-between gap-4">
                <div class="space-y-1">
                    <span class="text-xs font-black uppercase tracking-wider bg-white/25 px-2.5 py-0.5 rounded-full border border-white/20">Gamifikasi</span>
                    <h3 class="text-lg font-black leading-tight">Tantangan & Lencana</h3>
                    <p class="text-xs text-white font-semibold">Kumpulkan XP dan tingkatkan level petani Anda.</p>
                </div>
                <a href="{{ route('challenges.index') }}" class="px-4 py-2.5 bg-white text-orange-700 hover:bg-orange-50 font-black text-xs rounded-xl shadow-xs shrink-0 transition">
                    Buka →
                </a>
            </section>

        </div>

        <!-- Right Column: Active Plants Cards (7 Cols on LG) -->
        <div class="lg:col-span-7 space-y-4">
            
            <div class="flex justify-between items-center">
                <div>
                    <h2 class="font-black text-base sm:text-lg text-slate-900 tracking-tight">Tanaman & Siklus Aktif</h2>
                    <p class="text-xs text-slate-600 font-bold">Monitoring komoditas yang sedang berjalan</p>
                </div>
                <a class="text-xs font-black text-emerald-800 hover:text-emerald-950 flex items-center gap-1.5 bg-emerald-100 hover:bg-emerald-200 px-3.5 py-1.5 rounded-xl border border-emerald-300 transition shadow-2xs" href="{{ route('plants.index') }}">
                    Kelola Semua <span class="font-black">&rarr;</span>
                </a>
            </div>

            <div class="space-y-3.5">
                @forelse($activeProjects as $project)
                    <a href="{{ route('plants.show', $project) }}" class="block bg-white border border-slate-200 rounded-3xl p-4 sm:p-5 shadow-xs hover:shadow-md hover:border-emerald-300 transition group">
                        <div class="flex flex-col sm:flex-row items-start sm:items-center gap-4">
                            
                            <!-- Plant Thumbnail -->
                            <div class="w-20 h-20 sm:w-24 sm:h-24 rounded-2xl overflow-hidden shrink-0 bg-emerald-50 border border-slate-200 relative group-hover:scale-102 transition duration-300">
                                <img alt="{{ $project->name }}" class="w-full h-full object-cover" src="{{ $project->program->commodity->image_url ?? 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=300&q=80' }}"/>
                                <span class="absolute bottom-1 right-1 bg-black/75 backdrop-blur-xs text-white text-[10px] font-black px-1.5 py-0.5 rounded-md">
                                    #{{ $project->cycle_no }}
                                </span>
                            </div>

                            <!-- Plant Info and Stats -->
                            <div class="flex-1 min-w-0 w-full">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <div class="flex items-center gap-2">
                                            <span class="text-xs font-black uppercase tracking-wider px-2.5 py-0.5 rounded-md bg-emerald-100 text-emerald-900 border border-emerald-200">
                                                {{ $project->program->commodity->name ?? 'Komoditas' }}
                                            </span>
                                            <span class="text-xs text-slate-600 font-bold">• {{ $project->location_name ?? 'Lahan Utama' }}</span>
                                        </div>
                                        <h3 class="font-black text-slate-900 text-base sm:text-lg tracking-tight truncate mt-1 group-hover:text-emerald-800 transition">
                                            {{ $project->name }}
                                        </h3>
                                        <p class="text-xs text-slate-600 font-bold mt-0.5">
                                            Hari ke-{{ $project->days_elapsed }} • Fase {{ $project->current_stage_name }}
                                        </p>
                                    </div>
                                    <span class="text-slate-500 p-1 group-hover:text-emerald-700 transition">
                                        <svg class="w-5 h-5 stroke-[2.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path d="M9 5l7 7-7 7" stroke-linecap="round" stroke-linejoin="round"></path>
                                        </svg>
                                    </span>
                                </div>

                                <!-- Progress Bar -->
                                <div class="mt-3 flex items-center gap-3">
                                    <div class="flex-1 bg-slate-200 h-2.5 rounded-full overflow-hidden">
                                        <div class="bg-gradient-to-r from-emerald-600 to-teal-700 h-full rounded-full transition-all duration-500" style="width: {{ $project->current_progress_percent }}%"></div>
                                    </div>
                                    <span class="text-xs font-black text-slate-900">{{ (int)$project->current_progress_percent }}%</span>
                                </div>

                                <!-- Metadata Tags -->
                                <div class="mt-2.5 flex flex-wrap items-center gap-4 text-xs text-slate-700 font-bold">
                                    <div class="flex items-center gap-1.5">
                                        <svg class="w-4 h-4 text-emerald-700 fill-current" viewBox="0 0 24 24">
                                            <path d="M17 8C8 10 5.9 16.17 3.82 21.34L5.71 22l1-2.3A9.49 9.49 0 0 0 12 21c7 0 11-8 11-14a5 5 0 0 0-5-5c-3 0-5 2-6 5 2-1 4-1 5 1z"></path>
                                        </svg>
                                        <span>{{ $project->current_plant_count }} tanaman</span>
                                    </div>
                                    <div class="flex items-center gap-1.5">
                                        <svg class="w-4 h-4 text-emerald-700 stroke-current fill-none stroke-[2.5]" viewBox="0 0 24 24">
                                            <circle cx="12" cy="12" r="10"></circle>
                                            <polyline points="12 6 12 12 16 14"></polyline>
                                        </svg>
                                        <span>
                                            @if($project->days_until_harvest !== null)
                                                ± {{ $project->days_until_harvest }} hari menuju panen
                                            @else
                                                Siklus Berjalan
                                            @endif
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                @empty
                    <div class="p-8 text-center bg-white rounded-3xl border-2 border-dashed border-slate-200">
                        <span class="text-3xl">🌱</span>
                        <p class="text-sm font-black text-slate-900 mt-2">Belum ada tanaman aktif di ruang kerja ini.</p>
                        <p class="text-xs text-slate-600 font-semibold mt-1">Mulai siklus baru untuk komoditas pilihan Anda.</p>
                        <a href="{{ route('plants.index') }}" class="inline-block mt-4 px-5 py-2.5 bg-emerald-700 text-white rounded-xl text-xs font-black shadow-sm hover:bg-emerald-800 transition">
                            + Tambah Tanaman Baru
                        </a>
                    </div>
                @endforelse
            </div>
        </div>

    </div>

</div>
@endsection
