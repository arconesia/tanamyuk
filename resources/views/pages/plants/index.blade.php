@extends('layouts.app')

@section('title', 'TanamYuk - Tanaman Saya')

@section('content')
<div class="space-y-6">
    
    <!-- Screen Header -->
    <header class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-2 border-b border-slate-200">
        <div>
            <h1 class="text-2xl font-black text-slate-900 tracking-tight">Tanaman Saya</h1>
            <p class="text-xs text-slate-600 font-bold mt-0.5">Kelola siklus dan komoditas aktif di {{ $currentWorkspace->name }}</p>
        </div>

        <!-- Tambah Tanaman Button (Opens Modal) -->
        <button onclick="document.getElementById('modal-tambah-tanaman').classList.remove('hidden')" class="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-emerald-700 hover:bg-emerald-800 text-white font-black text-xs shadow-sm transition transform active:scale-95 self-start sm:self-auto">
            <svg class="w-4 h-4 stroke-[3]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path d="M12 4.5v15m7.5-7.5h-15" stroke-linecap="round" stroke-linejoin="round"></path>
            </svg>
            <span>+ Tambah Budidaya Baru</span>
        </button>
    </header>

    <!-- Segmented Filter Tabs: Aktif vs Selesai -->
    <section class="bg-slate-200/80 p-1.5 rounded-2xl flex items-center max-w-md border border-slate-300">
        <a href="{{ route('plants.index', ['tab' => 'aktif']) }}" class="flex-1 text-center py-2 text-xs font-black rounded-xl transition {{ $statusTab === 'aktif' ? 'bg-emerald-800 text-white shadow-xs' : 'text-slate-700 hover:text-slate-950 hover:bg-white/50' }}">
            Aktif ({{ $activeCount }})
        </a>
        <a href="{{ route('plants.index', ['tab' => 'selesai']) }}" class="flex-1 text-center py-2 text-xs font-black rounded-xl transition {{ $statusTab === 'selesai' ? 'bg-emerald-800 text-white shadow-xs' : 'text-slate-700 hover:text-slate-950 hover:bg-white/50' }}">
            Selesai ({{ $completedCount }})
        </a>
    </section>

    <!-- Plant Cards List (Responsive Grid) -->
    <section class="grid grid-cols-1 md:grid-cols-2 gap-4">
        @forelse($projects as $project)
            <a href="{{ route('plants.show', $project) }}" class="block bg-white rounded-3xl p-4 border border-slate-200 shadow-xs hover:shadow-md hover:border-emerald-300 transition group relative">
                <div class="flex items-center gap-3.5">
                    <!-- Thumbnail -->
                    <div class="w-20 h-20 sm:w-22 sm:h-22 rounded-2xl overflow-hidden shrink-0 bg-slate-100 border border-slate-200">
                        <img alt="{{ $project->name }}" class="w-full h-full object-cover group-hover:scale-105 transition duration-300" src="{{ $project->program->commodity->image_url ?? 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=300&q=80' }}"/>
                    </div>

                    <!-- Info -->
                    <div class="flex-1 min-w-0 pr-2">
                        <div class="flex items-center gap-2">
                            <span class="text-xs font-black uppercase tracking-wider px-2 py-0.5 rounded-md bg-emerald-100 text-emerald-900 border border-emerald-200">
                                Siklus #{{ $project->cycle_no }}
                            </span>
                            <span class="text-xs text-slate-600 font-bold">• {{ $project->location_name ?? 'Lahan Utama' }}</span>
                        </div>
                        <h2 class="text-base font-black text-slate-900 truncate mt-1 group-hover:text-emerald-800 transition">{{ $project->name }}</h2>
                        <p class="text-xs text-slate-600 mt-0.5 font-bold">
                            Hari ke-{{ $project->days_elapsed }} <span class="text-slate-400 mx-1">•</span> Fase {{ $project->current_stage_name }}
                        </p>

                        <!-- Progress Bar & Percentage -->
                        <div class="flex items-center gap-2.5 mt-2">
                            <div class="flex-1 h-2 bg-slate-200 rounded-full overflow-hidden">
                                <div class="bg-gradient-to-r from-emerald-600 to-teal-700 h-full rounded-full transition-all duration-500" style="width: {{ $project->current_progress_percent }}%"></div>
                            </div>
                            <span class="text-xs font-black text-slate-900 shrink-0">{{ (int)$project->current_progress_percent }}%</span>
                        </div>

                        <!-- Meta: Count & Harvest -->
                        <div class="flex items-center gap-4 mt-2.5 text-xs text-slate-700 font-bold">
                            <div class="flex items-center gap-1.5">
                                <svg class="w-4 h-4 text-emerald-700 fill-current" viewBox="0 0 24 24">
                                    <path d="M12 6.042A8.967 8.967 0 0 0 6 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 0 1 6 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 0 1 6-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0 0 18 18a8.967 8.967 0 0 0-6 2.292m0-14.25v14.25" stroke-linecap="round" stroke-linejoin="round"></path>
                                </svg>
                                <span><strong class="font-black text-slate-900">{{ $project->current_plant_count }}</strong> tanaman</span>
                            </div>
                            <div class="flex items-center gap-1.5">
                                <svg class="w-4 h-4 text-emerald-700 stroke-current fill-none stroke-[2.5]" viewBox="0 0 24 24">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <polyline points="12 6 12 12 16 14"></polyline>
                                </svg>
                                <span>
                                    @if($project->status === 'completed')
                                        Siklus Selesai
                                    @elseif($project->days_until_harvest !== null)
                                        ± {{ $project->days_until_harvest }} hari menuju panen
                                    @else
                                        Aktif
                                    @endif
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Chevron Right -->
                    <div class="text-slate-400 group-hover:text-emerald-700 transition">
                        <svg class="w-5 h-5 stroke-[2.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path d="M8.25 4.5l7.5 7.5-7.5 7.5" stroke-linecap="round" stroke-linejoin="round"></path>
                        </svg>
                    </div>
                </div>
            </a>
        @empty
            <div class="col-span-full p-8 text-center bg-white rounded-3xl border-2 border-dashed border-slate-200">
                <span class="text-3xl">🌱</span>
                <p class="text-sm font-black text-slate-900 mt-2">Tidak ada tanaman pada filter ini.</p>
                <p class="text-xs text-slate-600 font-semibold mt-1">Mulai tanam komoditas pilihan Anda sekarang!</p>
                <button onclick="document.getElementById('modal-tambah-tanaman').classList.remove('hidden')" class="mt-4 px-5 py-2.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl text-xs font-black shadow-sm transition">
                    + Tambah Budidaya Baru
                </button>
            </div>
        @endforelse
    </section>

</div>

<div id="modal-tambah-tanaman" class="hidden fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-end sm:items-center justify-center z-50 p-0 sm:p-4">
    <div class="w-full max-w-lg bg-white rounded-t-3xl sm:rounded-3xl p-6 space-y-4 max-h-[90vh] overflow-y-auto hide-scrollbar shadow-2xl">
        <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
            <div>
                <h3 class="text-base font-black text-slate-900">Tambah Budidaya Baru</h3>
                <p class="text-xs text-slate-600 font-bold">Multi-Komoditas & Multi-Siklus Tanam</p>
            </div>
            <button onclick="document.getElementById('modal-tambah-tanaman').classList.add('hidden')" class="text-slate-500 hover:text-slate-800 text-xl font-black">
                &times;
            </button>
        </div>

        <form action="{{ route('plants.store') }}" method="POST" class="space-y-4 text-xs font-bold text-slate-800">
            @csrf

            <!-- Pilih Komoditas -->
            <div>
                <label class="block font-black text-slate-900 mb-1">Pilih Komoditas Tanaman</label>
                <select name="commodity_id" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600">
                    @foreach($commodities as $c)
                        <option value="{{ $c->id }}">{{ $c->name }} ({{ $c->category }} - ±{{ $c->default_duration_days }} hari)</option>
                    @endforeach
                </select>
            </div>

            <!-- Nama Budidaya / Proyek -->
            <div>
                <label class="block font-black text-slate-900 mb-1">Nama Budidaya / Batch</label>
                <input type="text" name="name" placeholder="Misal: Cabai Rawit Merah #003" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600"/>
            </div>

            <!-- Siklus & Jumlah Tanaman Grid -->
            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="block font-black text-slate-900 mb-1">Nomor Siklus</label>
                    <input type="number" name="cycle_no" value="1" min="1" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600"/>
                </div>
                <div>
                    <label class="block font-black text-slate-900 mb-1">Jumlah Tanaman</label>
                    <input type="number" name="initial_plant_count" value="30" min="1" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600"/>
                </div>
            </div>

            <!-- Lokasi & Tanggal Mulai -->
            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="block font-black text-slate-900 mb-1">Lokasi Lahan</label>
                    <input type="text" name="location_name" placeholder="Pekarangan Rumah" class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600"/>
                </div>
                <div>
                    <label class="block font-black text-slate-900 mb-1">Tanggal Mulai</label>
                    <input type="date" name="start_date" value="{{ date('Y-m-d') }}" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600"/>
                </div>
            </div>

            <!-- Target Hasil Panen (Kg) -->
            <div>
                <label class="block font-black text-slate-900 mb-1">Target Panen (Kg)</label>
                <input type="number" step="0.5" name="target_yield_kg" placeholder="Misal: 25.0" class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600"/>
            </div>

            <!-- Catatan Awal -->
            <div>
                <label class="block font-black text-slate-900 mb-1">Catatan Tambahan (Opsional)</label>
                <textarea name="notes" rows="2" placeholder="Catatan media tanam, varietas benih, dll..." class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600 focus:border-emerald-600"></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="w-full py-3.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl font-black shadow-md transition transform active:scale-95 text-xs">
                Mulai Budidaya Sekarang 🌱
            </button>
        </form>
    </div>
</div>
@endsection
