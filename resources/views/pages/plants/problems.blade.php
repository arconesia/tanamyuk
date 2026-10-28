@extends('layouts.app')

@section('title', "TanamYuk - {$project->name} (Masalah & Hama)")

@section('content')
@include('pages.plants._header')

<div class="space-y-6">
    
    <!-- Header with Laporkan Masalah Button -->
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-2 border-b border-slate-200">
        <div>
            <h2 class="text-xl sm:text-2xl font-black text-slate-900 tracking-tight">Kesehatan Tanaman</h2>
            <p class="text-xs text-slate-600 font-bold mt-0.5">Pantau & atasi serangan hama, penyakit, dan kekurangan nutrisi</p>
        </div>
        <button onclick="document.getElementById('modal-lapor-masalah').classList.remove('hidden')" class="px-4 py-2.5 bg-rose-700 hover:bg-rose-800 text-white rounded-xl text-xs font-black shadow-sm transition flex items-center gap-1.5 self-start sm:self-auto">
            <span>+</span>
            <span>Laporkan Masalah Baru</span>
        </button>
    </div>

    <!-- Active Problem Reports on this Project -->
    @if($project->problems->count() > 0)
        <div class="space-y-4">
            <h3 class="text-xs font-black text-slate-600 uppercase tracking-wider">Laporan Masalah Aktif</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                @foreach($project->problems as $prob)
                    <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-xs space-y-3.5">
                        <div class="flex items-start justify-between gap-3">
                            <div class="flex items-start gap-3">
                                <div class="w-10 h-10 rounded-2xl flex items-center justify-center shrink-0 {{ $prob->status === 'resolved' ? 'bg-emerald-100 text-emerald-800 border border-emerald-300' : 'bg-rose-100 text-rose-800 border border-rose-300' }}">
                                    @if($prob->status === 'resolved')
                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"></path></svg>
                                    @else
                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"></path></svg>
                                    @endif
                                </div>
                                <div>
                                    <h4 class="text-base font-black text-slate-900 leading-tight">{{ $prob->title }}</h4>
                                    <p class="text-xs text-slate-500 font-bold mt-0.5">Dilaporkan {{ $prob->detected_at ? \Carbon\Carbon::parse($prob->detected_at)->translatedFormat('d M Y') : 'Baru saja' }}</p>
                                </div>
                            </div>
                            <span class="text-xs font-black uppercase tracking-wider px-3 py-1 rounded-full border shrink-0 
                                {{ $prob->status === 'resolved' ? 'bg-emerald-100 text-emerald-950 border-emerald-300' : '' }}
                                {{ $prob->status === 'monitoring' ? 'bg-amber-100 text-amber-950 border-amber-300' : '' }}
                                {{ $prob->status === 'open' ? 'bg-rose-100 text-rose-950 border-rose-300' : '' }}
                            ">
                                {{ $prob->status === 'resolved' ? 'Selesai' : ($prob->status === 'monitoring' ? 'Pemantauan' : 'Terbuka') }}
                            </span>
                        </div>

                        @if($prob->description)
                            <p class="text-xs text-slate-700 font-semibold bg-slate-100 p-3 rounded-2xl border border-slate-200 leading-relaxed">
                                {{ $prob->description }}
                            </p>
                        @endif

                        <!-- Action history -->
                        @if($prob->actions->count() > 0)
                            <div class="space-y-2 pt-1 border-t border-slate-100">
                                <span class="text-xs font-black text-slate-600 uppercase tracking-wider block">Tindakan Dilakukan:</span>
                                @foreach($prob->actions as $act)
                                    <div class="text-xs bg-emerald-50/70 p-2.5 rounded-xl border border-emerald-200 flex items-start justify-between gap-2">
                                        <div>
                                            <p class="font-extrabold text-slate-900 leading-tight">{{ $act->action_text }}</p>
                                            <p class="text-xs text-slate-500 font-bold mt-0.5">{{ $act->user->name ?? 'User' }} • {{ \Carbon\Carbon::parse($act->action_date)->translatedFormat('d M H:i') }}</p>
                                        </div>
                                        <span class="text-xs font-black text-emerald-950 bg-emerald-200 px-2 py-0.5 rounded-md shrink-0">
                                            {{ $act->result_status }}
                                        </span>
                                    </div>
                                @endforeach
                            </div>
                        @endif

                        <!-- Tombol Tambah Tindakan jika belum resolved -->
                        @if($prob->status !== 'resolved')
                            <form action="{{ route('problems.action.store', $prob) }}" method="POST" class="pt-2 border-t border-slate-200 space-y-2.5">
                                @csrf
                                <input type="text" name="action_text" placeholder="Catat tindakan penanganan..." required class="w-full text-xs font-bold text-slate-900 rounded-xl border-slate-300 focus:ring-emerald-600 focus:border-emerald-600"/>
                                <div class="flex items-center justify-between gap-2">
                                    <select name="result_status" class="text-xs font-bold text-slate-900 rounded-xl border-slate-300 py-1.5 px-3 focus:ring-emerald-600">
                                        <option value="done">Selesai Dikerjakan</option>
                                        <option value="improved">Kondisi Membaik</option>
                                        <option value="resolved">Masalah Teratasi (Resolve)</option>
                                        <option value="no_change">Belum Ada Perubahan</option>
                                    </select>
                                    <button type="submit" class="px-3.5 py-1.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl text-xs font-black transition shadow-2xs">
                                        Simpan Tindakan
                                    </button>
                                </div>
                            </form>
                        @endif
                    </div>
                @endforeach
            </div>
        </div>
    @endif

    <!-- Kamus Gejala & Solusi (Commodity Problem Catalog) -->
    <section class="space-y-4 pt-2">
        <div class="pb-1 border-b border-slate-200">
            <h3 class="text-base font-black text-slate-900 tracking-tight">Kamus Gejala & Solusi {{ $project->program->commodity->name }}</h3>
            <p class="text-xs text-slate-600 font-bold mt-0.5">Panduan penanganan cepat hama dan penyakit umum untuk komoditas ini</p>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            @foreach($problemCatalog as $cat)
                <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-xs space-y-3">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-2xl bg-amber-100 text-amber-800 border border-amber-300 flex items-center justify-center font-black text-base shrink-0">
                            🔍
                        </div>
                        <div>
                            <h4 class="text-sm font-black text-slate-900">{{ $cat->name }}</h4>
                            <p class="text-xs text-slate-600 font-bold mt-0.5">{{ $cat->summary }}</p>
                        </div>
                    </div>

                    <!-- Steps List -->
                    @if($cat->solutions->count() > 0)
                        <div class="bg-slate-100 p-3 rounded-2xl border border-slate-200 space-y-1.5">
                            <span class="text-xs font-black text-slate-800 block">Langkah Penanganan Cepat:</span>
                            @foreach($cat->solutions as $sol)
                                <div class="flex items-start gap-2 text-xs text-slate-800 font-semibold">
                                    <span class="w-4 h-4 rounded-full bg-slate-300 text-slate-900 text-xs font-black flex items-center justify-center shrink-0 mt-0.5">
                                        {{ $sol->step_no }}
                                    </span>
                                    <span>{{ $sol->action_text }}</span>
                                </div>
                            @endforeach
                        </div>
                    @endif
                </div>
            @endforeach
        </div>
    </section>

</div>

<!-- Modal: Laporkan Masalah Baru -->
<div id="modal-lapor-masalah" class="hidden fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-end sm:items-center justify-center z-50 p-0 sm:p-4">
    <div class="w-full max-w-lg bg-white rounded-t-3xl sm:rounded-3xl p-6 space-y-4 max-h-[90vh] overflow-y-auto hide-scrollbar shadow-2xl">
        <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
            <div>
                <h3 class="text-base font-black text-slate-900">Laporkan Masalah Tanaman</h3>
                <p class="text-xs text-slate-600 font-bold">Catat gejala hama atau penyakit untuk tindakan penanganan</p>
            </div>
            <button onclick="document.getElementById('modal-lapor-masalah').classList.add('hidden')" class="text-slate-500 hover:text-slate-800 text-xl font-black">
                &times;
            </button>
        </div>

        <form action="{{ route('plants.problems.store', $project) }}" method="POST" class="space-y-4 text-xs font-bold text-slate-800">
            @csrf
            <div>
                <label class="block font-black text-slate-900 mb-1">Pilih dari Kamus Gejala (Opsional)</label>
                <select name="problem_catalog_id" class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600">
                    <option value="">-- Pilih Masalah / Gejala Umum --</option>
                    @foreach($problemCatalog as $cat)
                        <option value="{{ $cat->id }}">{{ $cat->name }} ({{ $cat->symptom_label }})</option>
                    @endforeach
                </select>
            </div>

            <div>
                <label class="block font-black text-slate-900 mb-1">Judul Gejala / Keluhan</label>
                <input type="text" name="title" placeholder="Misal: Daun bawah menguning dan layu" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
            </div>

            <div>
                <label class="block font-black text-slate-900 mb-1">Deskripsi Tambahan</label>
                <textarea name="description" rows="3" placeholder="Jelaskan berapa tanaman yang terkena, gejala yang tampak..." class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"></textarea>
            </div>

            <button type="submit" class="w-full py-3.5 bg-rose-700 hover:bg-rose-800 text-white rounded-xl font-black shadow-md transition text-xs">
                Kirim Laporan Masalah
            </button>
        </form>
    </div>
</div>
@endsection
