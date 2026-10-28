@extends('layouts.app')

@section('title', "TanamYuk - {$project->name} (Hari Ini)")

@section('content')
@include('pages.plants._header')

<div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-start">
    
    <!-- Left Column: Summary Card & Meta Info (5 Cols on LG) -->
    <div class="lg:col-span-5 space-y-4">
        <!-- Plant Summary Card -->
        <article class="bg-white rounded-3xl p-5 sm:p-6 border border-slate-200 shadow-xs flex flex-col sm:flex-row items-center gap-4">
            <!-- Thumbnail -->
            <div class="w-24 h-24 rounded-2xl overflow-hidden shrink-0 bg-emerald-50 border border-slate-200 relative">
                <img alt="{{ $project->name }}" class="w-full h-full object-cover" src="{{ $project->program->commodity->image_url ?? 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=300&q=80' }}"/>
            </div>

            <!-- Detail Fase & Progress Bar -->
            <div class="flex-1 min-w-0 w-full">
                <div class="flex items-center gap-2">
                    <span class="text-xs font-black uppercase tracking-wider px-2.5 py-0.5 rounded-md bg-emerald-100 text-emerald-900 border border-emerald-300">
                        {{ $project->program->commodity->name ?? 'Komoditas' }}
                    </span>
                    <span class="text-xs text-slate-600 font-bold">Siklus #{{ $project->cycle_no }}</span>
                </div>
                <h2 class="text-xl font-black text-slate-900 leading-tight mt-1.5">Hari ke-{{ $project->days_elapsed }}</h2>
                <p class="text-xs text-slate-600 font-bold mt-0.5">Fase {{ $project->current_stage_name }}</p>

                <!-- Progress Bar & Persentase -->
                <div class="mt-3 flex items-center gap-3">
                    <div class="flex-1 h-2.5 bg-slate-200 rounded-full overflow-hidden">
                        <div class="h-full bg-gradient-to-r from-emerald-600 to-teal-700 rounded-full transition-all duration-500" style="width: {{ $project->current_progress_percent }}%;"></div>
                    </div>
                    <span class="text-xs font-black text-slate-900 shrink-0">{{ (int)$project->current_progress_percent }}%</span>
                </div>
            </div>
        </article>

        <!-- Quick Meta Info Pills -->
        <div class="grid grid-cols-2 gap-3 text-xs">
            <div class="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs flex items-center gap-3">
                <div class="w-10 h-10 rounded-xl bg-emerald-100 text-emerald-800 flex items-center justify-center text-xl font-black">
                    🌱
                </div>
                <div>
                    <span class="text-xs text-slate-600 font-bold block">Jumlah Tanaman</span>
                    <span class="font-black text-slate-900 text-base">{{ $project->current_plant_count }} pohon</span>
                </div>
            </div>
            <div class="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs flex items-center gap-3">
                <div class="w-10 h-10 rounded-xl bg-amber-100 text-amber-800 flex items-center justify-center text-xl font-black">
                    ⏱️
                </div>
                <div>
                    <span class="text-xs text-slate-600 font-bold block">Target Panen</span>
                    <span class="font-black text-slate-900 text-base">
                        @if($project->days_until_harvest !== null)
                            ± {{ $project->days_until_harvest }} hari
                        @else
                            Selesai
                        @endif
                    </span>
                </div>
            </div>
        </div>

        <!-- Quick Links to problems/notes/results -->
        <div class="p-4 bg-slate-100 rounded-2xl border border-slate-300 flex items-center justify-around text-xs font-extrabold text-slate-700">
            <a href="{{ route('plants.problems', $project) }}" class="hover:text-emerald-800 flex items-center gap-1.5 transition">
                <span>🐛</span> Diagnosa Hama
            </a>
            <span class="text-slate-400">•</span>
            <a href="{{ route('plants.notes', $project) }}" class="hover:text-emerald-800 flex items-center gap-1.5 transition">
                <span>📝</span> Catatan
            </a>
            <span class="text-slate-400">•</span>
            <a href="{{ route('plants.results', $project) }}" class="hover:text-emerald-800 flex items-center gap-1.5 transition">
                <span>💰</span> Keuangan
            </a>
        </div>
    </div>

    <!-- Right Column: Daily Tasks Section (7 Cols on LG) -->
    <div class="lg:col-span-7">
        <section class="bg-white rounded-3xl p-5 sm:p-6 border border-slate-200 shadow-xs space-y-4">
            <div class="flex justify-between items-center pb-2.5 border-b border-slate-100">
                <div>
                    <h3 class="text-base font-black text-slate-900">Tugas Siklus Hari Ini</h3>
                    <p class="text-xs text-slate-600 font-bold">Checklist perawatan harian untuk fase ini</p>
                </div>
                <span class="px-3 py-1 rounded-full text-xs font-black {{ $project->todayTasks->count() > 0 ? 'bg-emerald-100 text-emerald-900 border border-emerald-300' : 'bg-slate-200 text-slate-800' }}">
                    {{ $project->todayTasks->where('status', 'done')->count() }}/{{ $project->todayTasks->count() }} Selesai
                </span>
            </div>

            <div class="space-y-3">
                @forelse($project->todayTasks as $task)
                    <form action="{{ route('tasks.toggle', $task) }}" method="POST" class="m-0">
                        @csrf
                        <article class="bg-slate-50 rounded-2xl p-4 border border-slate-200 shadow-2xs flex items-center justify-between hover:bg-emerald-50 hover:border-emerald-300 transition {{ $task->status === 'done' ? 'opacity-70 bg-slate-100' : '' }}">
                            <div class="flex items-center space-x-3.5">
                                <!-- Icon according to task_type -->
                                <div class="w-10 h-10 rounded-xl flex items-center justify-center shrink-0 
                                    {{ $task->task_type === 'watering' ? 'bg-blue-100 text-blue-700' : '' }}
                                    {{ $task->task_type === 'inspection' ? 'bg-emerald-100 text-emerald-800' : '' }}
                                    {{ $task->task_type === 'fertilizing' ? 'bg-amber-100 text-amber-800' : '' }}
                                    {{ $task->task_type === 'harvest' ? 'bg-purple-100 text-purple-800' : '' }}
                                    {{ !in_array($task->task_type, ['watering', 'inspection', 'fertilizing', 'harvest']) ? 'bg-slate-200 text-slate-800' : '' }}
                                ">
                                    @if($task->task_type === 'watering')
                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M12 2.69l5.66 5.66a8 8 0 1 1-11.31 0z"></path></svg>
                                    @elseif($task->task_type === 'inspection')
                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M17 8C8 10 5.9 16.17 3.82 21.34L5.71 22l1-2.3A9.49 9.49 0 0 0 12 21c7 0 11-8 11-14a5 5 0 0 0-5-5c-3 0-5 2-6 5 2-1 4-1 5 1z"></path></svg>
                                    @elseif($task->task_type === 'fertilizing')
                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M12 3v18m-9-9h18"></path></svg>
                                    @else
                                        <svg class="w-5 h-5 stroke-current fill-none stroke-[2.5]" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 14 14"></polyline></svg>
                                    @endif
                                </div>

                                <div>
                                    <span class="text-xs sm:text-sm font-black text-slate-900 block {{ $task->status === 'done' ? 'line-through text-slate-500' : '' }}">
                                        {{ $task->title }}
                                    </span>
                                    @if($task->instruction)
                                        <span class="text-xs text-slate-600 font-bold block mt-0.5">{{ $task->instruction }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="flex items-center space-x-3 shrink-0">
                                <span class="text-xs font-black text-emerald-900 bg-emerald-100 px-3 py-1 rounded-full border border-emerald-300">
                                    +{{ $task->xp_reward }} XP
                                </span>
                                <input type="checkbox" {{ $task->status === 'done' ? 'checked' : '' }} onchange="this.closest('form').submit()" class="w-5 h-5 rounded-md border-slate-400 text-emerald-700 focus:ring-0 cursor-pointer"/>
                            </div>
                        </article>
                    </form>
                @empty
                    <div class="p-8 text-center bg-slate-50 rounded-2xl border-2 border-dashed border-slate-200">
                        <span class="text-3xl">🎉</span>
                        <p class="text-sm font-black text-slate-900 mt-2">Tidak ada tugas tertunda untuk hari ini!</p>
                        <p class="text-xs text-slate-600 font-semibold mt-0.5">Tanaman Anda dalam kondisi terpantau baik.</p>
                    </div>
                @endforelse
            </div>
        </section>
    </div>

</div>
@endsection
