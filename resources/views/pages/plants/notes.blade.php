@extends('layouts.app')

@section('title', "TanamYuk - {$project->name} (Catatan & Galeri)")

@section('content')
@include('pages.plants._header')

<div class="space-y-6">
    
    <!-- Header with Tambah Catatan Button -->
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-2 border-b border-slate-200">
        <div>
            <h2 class="text-xl sm:text-2xl font-black text-slate-900 tracking-tight">Catatan & Dokumentasi</h2>
            <p class="text-xs text-slate-600 font-bold mt-0.5">Jurnal harian perkembangan budidaya dan kondisi tanaman</p>
        </div>
        <button onclick="document.getElementById('modal-tambah-catatan').classList.remove('hidden')" class="px-4 py-2.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl text-xs font-black shadow-sm transition flex items-center gap-1.5 self-start sm:self-auto">
            <span>+</span>
            <span>Buat Catatan Baru</span>
        </button>
    </div>

    <!-- Foto Perkembangan Terbaru Grid -->
    @if($project->photos->count() > 0)
        <section class="space-y-3">
            <span class="text-xs font-black text-slate-600 uppercase tracking-wider block">Galeri Foto Tanaman</span>
            <div class="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-6 gap-3">
                @foreach($project->photos as $ph)
                    <div class="aspect-square rounded-2xl overflow-hidden bg-slate-100 border border-slate-300 relative group shadow-2xs">
                        <img src="{{ $ph->file_url }}" alt="{{ $ph->caption }}" class="w-full h-full object-cover group-hover:scale-105 transition duration-300"/>
                        <div class="absolute inset-x-0 bottom-0 p-1.5 bg-gradient-to-t from-black/80 to-transparent text-xs text-white font-bold truncate">
                            {{ \Carbon\Carbon::parse($ph->photo_date)->translatedFormat('d M') }}
                        </div>
                    </div>
                @endforeach
            </div>
        </section>
    @endif

    <!-- Timeline Catatan Harian -->
    <section class="space-y-4 pt-1">
        <span class="text-xs font-black text-slate-600 uppercase tracking-wider block">Riwayat Jurnal Harian</span>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            @forelse($project->projectNotes as $note)
                <article class="bg-white rounded-3xl p-5 border border-slate-200 shadow-xs space-y-3">
                    <div class="flex justify-between items-center gap-2">
                        <div class="flex items-center gap-2">
                            <span class="text-sm font-black text-slate-900">
                                {{ \Carbon\Carbon::parse($note->note_date)->translatedFormat('d F Y') }}
                            </span>
                            <span class="text-xs text-slate-600 font-bold">• {{ $note->author->name ?? 'User' }}</span>
                        </div>

                        <!-- Status Badge -->
                        <span class="text-xs font-black uppercase tracking-wider px-3 py-1 rounded-full border shrink-0 
                            {{ $note->condition_status === 'good' ? 'bg-emerald-100 text-emerald-950 border-emerald-300' : '' }}
                            {{ $note->condition_status === 'normal' ? 'bg-slate-100 text-slate-900 border-slate-300' : '' }}
                            {{ $note->condition_status === 'attention' ? 'bg-amber-100 text-amber-950 border-amber-300' : '' }}
                        ">
                            {{ $note->condition_status === 'good' ? 'Kondisi Bagus' : ($note->condition_status === 'attention' ? 'Perhatian' : 'Normal') }}
                        </span>
                    </div>

                    <p class="text-xs text-slate-800 font-semibold leading-relaxed bg-slate-100 p-3.5 rounded-2xl border border-slate-200">
                        {{ $note->note_text }}
                    </p>

                    @if($note->photos->count() > 0)
                        <div class="flex gap-2.5 pt-1">
                            @foreach($note->photos as $p)
                                <div class="w-16 h-16 rounded-xl overflow-hidden bg-slate-100 border border-slate-300">
                                    <img src="{{ $p->file_url }}" alt="{{ $p->caption }}" class="w-full h-full object-cover"/>
                                </div>
                            @endforeach
                        </div>
                    @endif
                </article>
            @empty
                <div class="col-span-full p-8 text-center bg-white rounded-3xl border-2 border-dashed border-slate-200">
                    <span class="text-3xl">📝</span>
                    <p class="text-sm font-black text-slate-900 mt-2">Belum ada catatan harian untuk budidaya ini.</p>
                    <button onclick="document.getElementById('modal-tambah-catatan').classList.remove('hidden')" class="mt-3 px-4 py-2 bg-emerald-700 text-white rounded-xl text-xs font-black shadow-xs hover:bg-emerald-800 transition">
                        + Buat Catatan Pertama
                    </button>
                </div>
            @endforelse
        </div>
    </section>

</div>

<!-- Modal: Tambah Catatan & Foto -->
<div id="modal-tambah-catatan" class="hidden fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-end sm:items-center justify-center z-50 p-0 sm:p-4">
    <div class="w-full max-w-lg bg-white rounded-t-3xl sm:rounded-3xl p-6 space-y-4 max-h-[90vh] overflow-y-auto hide-scrollbar shadow-2xl">
        <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
            <div>
                <h3 class="text-base font-black text-slate-900">Catat Perkembangan Tanaman</h3>
                <p class="text-xs text-slate-600 font-bold">Dokumentasikan visual dan catatan perkembangan</p>
            </div>
            <button onclick="document.getElementById('modal-tambah-catatan').classList.add('hidden')" class="text-slate-500 hover:text-slate-800 text-xl font-black">
                &times;
            </button>
        </div>

        <form action="{{ route('plants.notes.store', $project) }}" method="POST" class="space-y-4 text-xs font-bold text-slate-800">
            @csrf
            <div>
                <label class="block font-black text-slate-900 mb-1.5">Kondisi Tanaman Hari Ini</label>
                <div class="grid grid-cols-3 gap-2">
                    <label class="p-2.5 border-2 border-slate-300 rounded-xl flex items-center justify-center gap-2 cursor-pointer has-checked:border-emerald-700 has-checked:bg-emerald-50">
                        <input type="radio" name="condition_status" value="good" checked class="text-emerald-700 focus:ring-0"/>
                        <span class="font-black text-emerald-900 text-xs">Bagus</span>
                    </label>
                    <label class="p-2.5 border-2 border-slate-300 rounded-xl flex items-center justify-center gap-2 cursor-pointer has-checked:border-slate-700 has-checked:bg-slate-50">
                        <input type="radio" name="condition_status" value="normal" class="text-slate-700 focus:ring-0"/>
                        <span class="font-black text-slate-900 text-xs">Normal</span>
                    </label>
                    <label class="p-2.5 border-2 border-slate-300 rounded-xl flex items-center justify-center gap-2 cursor-pointer has-checked:border-amber-700 has-checked:bg-amber-50">
                        <input type="radio" name="condition_status" value="attention" class="text-amber-700 focus:ring-0"/>
                        <span class="font-black text-amber-950 text-xs">Perhatian</span>
                    </label>
                </div>
            </div>

            <div>
                <label class="block font-black text-slate-900 mb-1">Isi Catatan / Jurnal</label>
                <textarea name="note_text" rows="3" placeholder="Tuliskan perkembangan tunas, warna daun, kelembapan..." required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"></textarea>
            </div>

            <div>
                <label class="block font-black text-slate-900 mb-1">URL Foto Dokumentasi (Opsional)</label>
                <input type="url" name="photo_url" placeholder="https://..." class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
            </div>

            <div>
                <label class="block font-black text-slate-900 mb-1">Keterangan Foto</label>
                <input type="text" name="caption" placeholder="Misal: Foto tanaman hari ke-38" class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
            </div>

            <button type="submit" class="w-full py-3.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl font-black shadow-md transition text-xs">
                Simpan Jurnal & Foto
            </button>
        </form>
    </div>
</div>
@endsection
