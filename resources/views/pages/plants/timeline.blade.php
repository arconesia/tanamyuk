@extends('layouts.app')

@section('title', "TanamYuk - {$project->name} (Perjalanan)")

@section('content')
@include('pages.plants._header')

<div class="space-y-6">
    
    <!-- Header Title -->
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-2 border-b border-slate-200">
        <div>
            <h2 class="text-xl sm:text-2xl font-black text-slate-900 tracking-tight">Peta Perjalanan Budidaya</h2>
            <p class="text-xs text-slate-600 font-bold mt-0.5">Program {{ $project->program->name }} (Total Durasi: {{ $project->program->duration_days }} Hari)</p>
        </div>
        <span class="text-xs font-black text-emerald-950 bg-emerald-100 px-3.5 py-1.5 rounded-full border border-emerald-300 self-start sm:self-auto">
            Fase {{ $project->current_stage_name }}
        </span>
    </div>

    <!-- Timeline Stages Container -->
    <div class="space-y-5 relative before:absolute before:inset-0 before:left-5 before:w-1 before:bg-slate-300">
        @foreach($project->program->stages as $stage)
            @php
                $progress = $project->stageProgress->firstWhere('program_stage_id', $stage->id);
                $status = $progress ? $progress->status : 'locked';
            @endphp

            <div class="relative flex items-start gap-4 group">
                <!-- Status Icon Node -->
                <div class="w-10 h-10 rounded-full flex items-center justify-center shrink-0 z-10 border-2 
                    {{ $status === 'completed' ? 'bg-emerald-700 border-emerald-700 text-white shadow-sm' : '' }}
                    {{ $status === 'active' ? 'bg-white border-emerald-700 text-emerald-800 shadow-md ring-4 ring-emerald-200' : '' }}
                    {{ $status === 'locked' ? 'bg-slate-200 border-slate-300 text-slate-500' : '' }}
                ">
                    @if($status === 'completed')
                        <svg class="w-5 h-5 stroke-current stroke-[3]" fill="none" viewBox="0 0 24 24"><path d="M5 13l4 4L19 7" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                    @elseif($status === 'active')
                        <span class="w-3.5 h-3.5 rounded-full bg-emerald-700 animate-pulse"></span>
                    @else
                        <svg class="w-4 h-4 stroke-current stroke-[2.5]" fill="none" viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0110 0v4"></path></svg>
                    @endif
                </div>

                <!-- Stage Card -->
                <div class="flex-1 bg-white rounded-3xl p-5 sm:p-6 border border-slate-200 shadow-xs 
                    {{ $status === 'active' ? 'border-emerald-400 ring-2 ring-emerald-600/15' : '' }}
                ">
                    <div class="flex flex-col sm:flex-row sm:items-start justify-between gap-3">
                        <div>
                            <span class="text-xs font-black uppercase tracking-wider text-emerald-900 bg-emerald-100 px-2.5 py-1 rounded-md border border-emerald-200">
                                Tahap {{ $stage->stage_no }}: Hari {{ $stage->start_day }}-{{ $stage->end_day }}
                            </span>
                            <h3 class="text-base sm:text-lg font-black text-slate-900 mt-2">{{ $stage->name }}</h3>
                            <p class="text-xs text-slate-600 font-bold mt-1 leading-relaxed">{{ $stage->description }}</p>
                        </div>
                        <span class="text-xs font-black text-amber-900 bg-amber-100 px-3 py-1 rounded-full border border-amber-300 shrink-0 self-start sm:self-auto">
                            +{{ $stage->xp_reward }} XP
                        </span>
                    </div>

                    <!-- Progress bar if active -->
                    @if($status === 'active')
                        <div class="mt-4 pt-3 border-t border-slate-100">
                            <div class="flex justify-between text-xs font-black text-slate-900 mb-1.5">
                                <span>Kemajuan Tahap</span>
                                <span>{{ (int)($progress->completion_percent ?? 0) }}%</span>
                            </div>
                            <div class="w-full h-2.5 bg-slate-200 rounded-full overflow-hidden">
                                <div class="bg-gradient-to-r from-emerald-600 to-teal-700 h-full rounded-full" style="width: {{ $progress->completion_percent ?? 0 }}%"></div>
                            </div>
                        </div>
                    @endif

                    <!-- Stage Tasks list preview -->
                    @if($stage->tasks->count() > 0)
                        <div class="mt-4 pt-3 border-t border-slate-200 space-y-2">
                            <span class="text-xs font-black text-slate-600 uppercase tracking-wider block">Agenda Kegiatan:</span>
                            @foreach($stage->tasks as $t)
                                <div class="flex items-center gap-2.5 text-xs text-slate-800 font-bold">
                                    <span class="w-2 h-2 rounded-full {{ $status === 'completed' ? 'bg-emerald-600' : 'bg-slate-400' }}"></span>
                                    <span>{{ $t->title }}</span>
                                </div>
                            @endforeach
                        </div>
                    @endif
                </div>
            </div>
        @endforeach
    </div>

</div>
@endsection
