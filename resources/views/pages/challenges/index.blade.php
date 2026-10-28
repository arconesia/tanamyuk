@extends('layouts.app')

@section('title', 'TanamYuk - Tantangan & Gamifikasi')

@section('content')
<div class="space-y-6">
    
    <!-- Screen Header -->
    <header class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-2 border-b border-slate-200">
        <div>
            <h1 class="text-2xl font-black text-slate-900 tracking-tight">Tantangan & Gamifikasi Petani</h1>
            <p class="text-xs sm:text-sm text-slate-600 font-bold mt-0.5">Selesaikan target harian, pertahankan streak, dan kumpulkan lencana prestasi.</p>
        </div>
        <div class="flex items-center gap-2 self-start sm:self-auto px-4 py-2 bg-gradient-to-r from-amber-100 to-orange-100 rounded-2xl border border-amber-300 text-amber-950 font-black text-sm shadow-2xs">
            <span class="text-lg">🔥</span>
            <span>{{ $currentStreak }} Hari Beruntun</span>
        </div>
    </header>

    <!-- Hero Stats: Streak Card & Level Card (2 Columns on Desktop) -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        
        <!-- Streak Card (Hero Card) -->
        <section class="bg-gradient-to-br from-amber-500 via-orange-500 to-rose-600 text-white rounded-3xl p-6 sm:p-7 shadow-md relative overflow-hidden flex flex-col justify-between">
            <div class="absolute -right-4 -bottom-4 opacity-15 pointer-events-none">
                <span class="text-9xl">🔥</span>
            </div>
            <div class="relative z-10 space-y-2">
                <div class="flex items-center gap-2">
                    <span class="px-3 py-1 rounded-full bg-white/25 backdrop-blur-xs text-xs font-black tracking-wider uppercase border border-white/20">
                        Streak Perawatan
                    </span>
                </div>
                <h2 class="text-3xl font-black tracking-tight leading-tight">{{ $currentStreak }} Hari Beruntun!</h2>
                <p class="text-xs sm:text-sm text-white font-bold">Pertahankan konsistensi harian untuk meraih bonus 200 XP mingguan.</p>
            </div>

            <!-- Streak 7-day mini markers -->
            <div class="relative z-10 flex items-center justify-between pt-6 border-t border-white/25 mt-4">
                @for($d = 1; $d <= 7; $d++)
                    @php $isDone = ($d <= min(7, $currentStreak % 7 == 0 ? 7 : $currentStreak % 7)); @endphp
                    <div class="flex flex-col items-center gap-1.5">
                        <div class="w-9 h-9 rounded-full flex items-center justify-center font-black text-xs {{ $isDone ? 'bg-white text-orange-700 shadow-sm' : 'bg-white/20 text-white' }}">
                            {{ $isDone ? '✓' : $d }}
                        </div>
                        <span class="text-xs text-white font-bold">H{{ $d }}</span>
                    </div>
                @endfor
            </div>
        </section>

        <!-- XP & Level Progress Card -->
        <section class="bg-white rounded-3xl p-6 sm:p-7 border border-slate-200 shadow-xs flex flex-col justify-between space-y-4">
            <div class="flex justify-between items-start">
                <div class="flex items-center gap-3.5">
                    <div class="w-14 h-14 rounded-2xl bg-emerald-100 border border-emerald-200 text-emerald-800 flex items-center justify-center text-3xl font-black shadow-2xs">
                        🌱
                    </div>
                    <div>
                        <span class="text-xs font-black uppercase tracking-wider text-emerald-900 bg-emerald-100 px-3 py-0.5 rounded-full border border-emerald-200">
                            Peringkat Petani
                        </span>
                        <h3 class="text-xl font-black text-slate-900 mt-1.5">Level {{ $level }} - Petani Semangat</h3>
                        <p class="text-xs text-slate-600 font-bold mt-0.5">{{ number_format($totalXp) }} total XP terkumpul</p>
                    </div>
                </div>
                <span class="text-sm font-black text-emerald-900 bg-emerald-100 px-3.5 py-1 rounded-full border border-emerald-200">
                    {{ $levelPercent }}%
                </span>
            </div>

            <div class="space-y-2 pt-2">
                <div class="flex justify-between text-xs font-black text-slate-900">
                    <span>Progress Menuju Level {{ $level + 1 }}</span>
                    <span>{{ $totalXp }} / {{ $levelTarget }} XP</span>
                </div>
                <div class="w-full h-3 bg-slate-200 rounded-full overflow-hidden">
                    <div class="h-full bg-gradient-to-r from-emerald-600 to-teal-700 rounded-full transition-all duration-500" style="width: {{ $levelPercent }}%"></div>
                </div>
                <p class="text-xs text-slate-600 font-bold">
                    Selesaikan {{ ceil(($levelTarget - $totalXp) / 50) }} tugas lagi untuk naik peringkat berikutnya!
                </p>
            </div>
        </section>

    </div>

    <!-- Badges / Achievements Grid -->
    <section class="space-y-4 pt-2">
        <div class="flex justify-between items-center pb-2 border-b border-slate-200">
            <div>
                <h3 class="text-base sm:text-lg font-black text-slate-900 tracking-tight">Koleksi Lencana Budidaya</h3>
                <p class="text-xs text-slate-600 font-bold mt-0.5">Buka berbagai pencapaian dengan merawat tanaman secara konsisten</p>
            </div>
            <span class="text-xs font-black text-emerald-900 bg-emerald-100 px-3 py-1 rounded-full border border-emerald-300">
                {{ count($unlockedAchievementIds) }}/{{ $achievements->count() }} Terbuka
            </span>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            @foreach($achievements as $ach)
                @php $unlocked = in_array($ach->id, $unlockedAchievementIds); @endphp
                <div class="rounded-3xl p-5 border transition relative {{ $unlocked ? 'bg-white border-slate-200 shadow-xs' : 'bg-slate-100 border-slate-300 opacity-70' }}">
                    <div class="flex items-start gap-3.5">
                        <div class="w-12 h-12 rounded-2xl flex items-center justify-center text-2xl shrink-0 {{ $unlocked ? 'bg-amber-100 text-amber-800 border border-amber-300 shadow-2xs' : 'bg-slate-200 text-slate-500' }}">
                            @if($ach->icon === 'seed') 🌱
                            @elseif($ach->icon === 'leaf') 🍃
                            @elseif($ach->icon === 'fire') 🔥
                            @elseif($ach->icon === 'health') 🩺
                            @elseif($ach->icon === 'harvest') 🧺
                            @else 🎖️
                            @endif
                        </div>
                        <div class="min-w-0 flex-1">
                            <h4 class="text-sm font-black text-slate-900 truncate">{{ $ach->name }}</h4>
                            <p class="text-xs text-slate-600 font-bold mt-1 leading-snug">{{ $ach->description }}</p>
                        </div>
                    </div>
                    <div class="mt-4 flex items-center justify-between pt-3 border-t border-slate-200 text-xs font-black">
                        <span class="text-emerald-900 bg-emerald-100 px-2.5 py-0.5 rounded-full border border-emerald-300">+{{ $ach->xp_bonus }} XP</span>
                        <span class="{{ $unlocked ? 'text-emerald-800 font-black' : 'text-slate-500 font-bold' }}">
                            {{ $unlocked ? '✓ Didapatkan' : '🔒 Terkunci' }}
                        </span>
                    </div>
                </div>
            @endforeach
        </div>
    </section>

    <!-- Recent XP Activity Log -->
    <section class="space-y-3 pt-2">
        <h3 class="text-xs font-black text-slate-600 uppercase tracking-wider">Riwayat Perolehan XP Terkini</h3>
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-xs divide-y divide-slate-100">
            @forelse($recentXp as $xp)
                <div class="py-3 flex justify-between items-center text-xs">
                    <div>
                        <span class="font-black text-slate-900 text-sm block">{{ $xp->description }}</span>
                        <span class="text-xs text-slate-500 font-bold">{{ \Carbon\Carbon::parse($xp->created_at)->translatedFormat('d M Y, H:i') }}</span>
                    </div>
                    <span class="font-black text-emerald-900 bg-emerald-100 px-3 py-1 rounded-full border border-emerald-300">
                        +{{ $xp->xp_amount }} XP
                    </span>
                </div>
            @empty
                <p class="text-xs text-slate-500 py-4 text-center font-bold">Belum ada riwayat XP tercatat.</p>
            @endforelse
        </div>
    </section>

</div>
@endsection
