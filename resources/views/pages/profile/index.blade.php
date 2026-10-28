@extends('layouts.app')

@section('title', 'TanamYuk - Profil & Ruang Kerja')

@section('content')
<div class="space-y-6">
    
    <!-- Screen Header -->
    <header class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-2 border-b border-slate-200">
        <div>
            <h1 class="text-2xl font-black text-slate-900 tracking-tight">Profil & Ruang Kerja SaaS</h1>
            <p class="text-xs sm:text-sm text-slate-600 font-bold mt-0.5">Kelola akun pengguna, beralih ruang kerja (workspace), dan akses komoditas pertanian.</p>
        </div>
        <div class="flex items-center gap-2 self-start sm:self-auto">
            <span class="text-xs px-3.5 py-1.5 rounded-full bg-emerald-100 text-emerald-950 font-black border border-emerald-300">
                Multi-Tenant SaaS
            </span>
        </div>
    </header>

    <!-- Responsive 2-Column Grid on Desktop -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-start">
        
        <!-- Left Column (5 Cols on LG) -->
        <div class="lg:col-span-5 space-y-6">
            
            <!-- User Profile Header Card -->
            <section class="bg-white p-5 sm:p-6 rounded-3xl border border-slate-200 shadow-xs space-y-4">
                <div class="flex items-center gap-4">
                    <div class="w-16 h-16 rounded-2xl overflow-hidden border-2 border-emerald-600 shadow-sm bg-slate-100 shrink-0">
                        @if($user->avatar_url)
                            <img alt="{{ $user->name }}" class="w-full h-full object-cover" src="{{ $user->avatar_url }}"/>
                        @else
                            <div class="w-full h-full bg-emerald-100 text-emerald-900 font-black flex items-center justify-center text-2xl">
                                {{ strtoupper(substr($user->name, 0, 2)) }}
                            </div>
                        @endif
                    </div>
                    <div class="min-w-0 flex-1">
                        <h2 class="text-xl font-black text-slate-900 leading-tight truncate">{{ $user->name }}</h2>
                        <p class="text-xs text-slate-600 font-bold mt-0.5 truncate">{{ $user->email }}</p>
                        <span class="inline-block mt-2 px-3 py-0.5 rounded-md bg-emerald-100 text-emerald-900 text-xs font-black border border-emerald-300">
                            {{ ucfirst($user->status) }} Member • SaaS User
                        </span>
                    </div>
                </div>

                <!-- Demo User Quick Switcher Dropdown -->
                <div class="pt-3 border-t border-slate-200">
                    <span class="text-xs font-black text-slate-600 uppercase tracking-wider block mb-2">Beralih Akun Uji Coba:</span>
                    <div class="flex flex-wrap gap-2">
                        @foreach($allDemoUsers as $u)
                            <form action="{{ route('auth.switch-user', $u) }}" method="POST" class="m-0">
                                @csrf
                                <button type="submit" class="px-3.5 py-1.5 rounded-xl text-xs font-black transition {{ $user->id === $u->id ? 'bg-emerald-700 text-white shadow-xs' : 'bg-slate-100 text-slate-800 hover:bg-slate-200 border border-slate-300' }}">
                                    {{ $u->name }}
                                </button>
                            </form>
                        @endforeach
                    </div>
                </div>
            </section>

            <!-- Multi-Tenant Workspace Switcher Card -->
            <section class="bg-gradient-to-br from-emerald-800 via-teal-900 to-slate-950 text-white p-6 rounded-3xl shadow-md space-y-4">
                <div class="flex justify-between items-start">
                    <div>
                        <span class="text-xs font-black uppercase tracking-wider text-emerald-300 bg-white/15 px-3 py-1 rounded-full border border-white/20">
                            Ruang Kerja Aktif
                        </span>
                        <h3 class="text-2xl font-black text-white mt-2">{{ $workspace->name }}</h3>
                        <p class="text-xs text-emerald-100 font-bold mt-0.5">Tipe: {{ ucfirst($workspace->type) }} • Zona: {{ $workspace->timezone }}</p>
                    </div>
                    <span class="text-3xl">🏡</span>
                </div>

                <div class="pt-3 border-t border-white/20 space-y-2">
                    <span class="text-xs font-black text-emerald-200 block">Daftar Ruang Kerja Anda:</span>
                    <div class="flex flex-col gap-2">
                        @foreach($myWorkspaces as $ws)
                            <form action="{{ route('workspaces.switch', $ws) }}" method="POST" class="m-0">
                                @csrf
                                <button type="submit" class="w-full text-left px-4 py-3 rounded-2xl text-xs font-black transition flex items-center justify-between {{ $workspace->id === $ws->id ? 'bg-white text-emerald-950 shadow-sm' : 'bg-white/10 text-white hover:bg-white/20' }}">
                                    <span class="truncate">{{ $ws->name }} ({{ ucfirst($ws->type) }})</span>
                                    @if($workspace->id === $ws->id)
                                        <span class="text-emerald-900 bg-emerald-100 px-2.5 py-0.5 rounded-md text-xs font-black">Aktif</span>
                                    @endif
                                </button>
                            </form>
                        @endforeach
                    </div>
                </div>
            </section>

            <!-- Achievement Summary (Level, XP, Badge) -->
            <section class="bg-white p-5 rounded-3xl shadow-xs border border-slate-200">
                <div class="grid grid-cols-3 divide-x divide-slate-200 text-center">
                    <div class="flex flex-col items-center justify-center px-2">
                        <span class="text-2xl">🌱</span>
                        <span class="text-base font-black text-slate-900 mt-1">Level {{ $level }}</span>
                        <span class="text-xs text-slate-600 font-bold">Petani</span>
                    </div>
                    <div class="flex flex-col items-center justify-center px-2">
                        <span class="text-2xl">🔥</span>
                        <span class="text-base font-black text-slate-900 mt-1">{{ number_format($totalXp) }}</span>
                        <span class="text-xs text-slate-600 font-bold">XP</span>
                    </div>
                    <div class="flex flex-col items-center justify-center px-2">
                        <span class="text-2xl">🎖️</span>
                        <span class="text-base font-black text-slate-900 mt-1">{{ $badgesCount }}</span>
                        <span class="text-xs text-slate-600 font-bold">Lencana</span>
                    </div>
                </div>
            </section>

        </div>

        <!-- Right Column: Commodities, History, Settings (7 Cols on LG) -->
        <div class="lg:col-span-7 space-y-6">
            
            <!-- Komoditas Saya Section (Multi-Commodity) -->
            <section class="bg-white rounded-3xl p-5 sm:p-6 border border-slate-200 shadow-xs space-y-4">
                <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
                    <div>
                        <h3 class="text-base sm:text-lg font-black text-slate-900 tracking-tight">Katalog Komoditas Workspace</h3>
                        <p class="text-xs text-slate-600 font-bold">Komoditas yang telah diaktifkan untuk budidaya di ruang kerja ini</p>
                    </div>
                    <button onclick="document.getElementById('modal-tambah-komoditas').classList.remove('hidden')" class="px-4 py-2 bg-emerald-700 hover:bg-emerald-800 text-white font-black text-xs rounded-xl shadow-2xs transition">
                        + Tambah Akses
                    </button>
                </div>

                <div class="grid grid-cols-2 sm:grid-cols-4 gap-3">
                    @foreach($commodities as $com)
                        @php $hasAccess = in_array($com->id, $accessibleCommodityIds); @endphp
                        <div class="bg-slate-50 p-4 rounded-2xl border border-slate-200 flex flex-col items-center justify-center text-center relative {{ $hasAccess ? 'border-emerald-300 bg-emerald-50/40' : 'opacity-60' }}">
                            <span class="text-3xl mb-1.5">
                                @if($com->code === 'CABAI') 🌶️
                                @elseif($com->code === 'TOMAT') 🍅
                                @elseif($com->code === 'PAKCOY') 🥬
                                @else 🌿
                                @endif
                            </span>
                            <span class="text-xs font-black text-slate-900 leading-tight">{{ $com->name }}</span>
                            <span class="text-xs font-black {{ $hasAccess ? 'text-emerald-900 bg-emerald-100 px-2.5 py-0.5 rounded-full mt-1.5 border border-emerald-300' : 'text-slate-500 mt-1.5' }}">
                                {{ $hasAccess ? 'Aktif' : 'Terkunci' }}
                            </span>
                        </div>
                    @endforeach
                </div>
            </section>

            <!-- Riwayat Budidaya Section -->
            <section class="bg-white rounded-3xl p-5 sm:p-6 border border-slate-200 shadow-xs space-y-4">
                <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
                    <div>
                        <h3 class="text-base sm:text-lg font-black text-slate-900 tracking-tight">Riwayat Siklus Selesai</h3>
                        <p class="text-xs text-slate-600 font-bold">Daftar panen yang telah rampung</p>
                    </div>
                    <a href="{{ route('plants.index', ['tab' => 'selesai']) }}" class="text-xs font-black text-emerald-800 hover:text-emerald-950">
                        Lihat Semua &rarr;
                    </a>
                </div>

                <div class="space-y-3">
                    @forelse($historyProjects as $hp)
                        <article class="bg-slate-50 p-4 rounded-2xl border border-slate-200 flex items-center justify-between hover:bg-slate-100 transition">
                            <div class="flex items-center space-x-3.5">
                                <div class="w-12 h-12 rounded-xl overflow-hidden bg-slate-200 border border-slate-300 shrink-0">
                                    <img alt="{{ $hp->name }}" class="w-full h-full object-cover" src="{{ $hp->program->commodity->image_url ?? 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=150&q=80' }}"/>
                                </div>
                                <div>
                                    <h4 class="text-sm font-black text-slate-900 leading-tight">{{ $hp->name }}</h4>
                                    <p class="text-xs text-slate-600 font-bold mt-0.5">Panen • {{ \Carbon\Carbon::parse($hp->actual_end_date)->translatedFormat('d M Y') }}</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <span class="text-xs sm:text-sm font-black text-emerald-950 bg-emerald-100 px-3.5 py-1 rounded-full border border-emerald-300">
                                    {{ number_format($hp->total_harvest_kg, 1) }} kg
                                </span>
                            </div>
                        </article>
                    @empty
                        <div class="p-6 text-center bg-slate-50 rounded-2xl border-2 border-dashed border-slate-200 text-xs text-slate-600 font-bold">
                            Belum ada siklus budidaya yang berstatus selesai.
                        </div>
                    @endforelse
                </div>
            </section>

            <!-- Settings Menu List -->
            <section class="bg-white rounded-3xl border border-slate-200 shadow-xs overflow-hidden divide-y divide-slate-100">
                <div class="flex items-center justify-between p-4 hover:bg-slate-50 transition cursor-pointer">
                    <div class="flex items-center space-x-3 text-slate-800">
                        <span class="text-xl">🔔</span>
                        <div>
                            <span class="text-sm font-black block text-slate-900">Pengaturan Notifikasi Tugas</span>
                            <span class="text-xs text-slate-600 font-semibold">Pengingat siram, pemupukan, dan inspeksi berkala</span>
                        </div>
                    </div>
                    <span class="text-slate-600 text-sm font-black">&gt;</span>
                </div>

                <div class="flex items-center justify-between p-4 hover:bg-slate-50 transition cursor-pointer">
                    <div class="flex items-center space-x-3 text-slate-800">
                        <span class="text-xl">💬</span>
                        <div>
                            <span class="text-sm font-black block text-slate-900">Pusat Bantuan & Komunitas Agraris</span>
                            <span class="text-xs text-slate-600 font-semibold">Konsultasi hama & tips budidaya cerdas</span>
                        </div>
                    </div>
                    <span class="text-slate-600 text-sm font-black">&gt;</span>
                </div>

                <div class="flex items-center justify-between p-4 hover:bg-slate-50 transition cursor-pointer">
                    <div class="flex items-center space-x-3 text-slate-800">
                        <span class="text-xl">ℹ️</span>
                        <div>
                            <span class="text-sm font-black block text-slate-900">Tentang TanamYuk v1.0 (Laravel 13 SaaS)</span>
                            <span class="text-xs text-slate-600 font-semibold">Multi-User, Multi-Workspace, Multi-Commodity, Multi-Cycle</span>
                        </div>
                    </div>
                    <span class="text-slate-600 text-sm font-black">&gt;</span>
                </div>
            </section>

        </div>

    </div>

</div>

<!-- Modal: Tambah Akses Komoditas -->
<div id="modal-tambah-komoditas" class="hidden fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-end sm:items-center justify-center z-50 p-0 sm:p-4">
    <div class="w-full max-w-lg bg-white rounded-t-3xl sm:rounded-3xl p-6 space-y-4 shadow-2xl">
        <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
            <div>
                <h3 class="text-base font-black text-slate-900">Buka Akses Komoditas</h3>
                <p class="text-xs text-slate-600 font-bold">Aktifkan komoditas untuk workspace saat ini</p>
            </div>
            <button onclick="document.getElementById('modal-tambah-komoditas').classList.add('hidden')" class="text-slate-500 hover:text-slate-800 text-xl font-black">&times;</button>
        </div>
        <form action="{{ route('commodities.grant') }}" method="POST" class="space-y-4 text-xs">
            @csrf
            <div>
                <label class="block font-black text-slate-900 mb-1.5">Pilih Komoditas</label>
                <select name="commodity_id" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600">
                    @foreach($commodities as $c)
                        <option value="{{ $c->id }}">{{ $c->name }} ({{ $c->category }} - Siklus ±{{ $c->default_duration_days }} hari)</option>
                    @endforeach
                </select>
            </div>
            <button type="submit" class="w-full py-3.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl font-black transition shadow-sm">
                Aktifkan di Ruang Kerja Ini
            </button>
        </form>
    </div>
</div>
@endsection
