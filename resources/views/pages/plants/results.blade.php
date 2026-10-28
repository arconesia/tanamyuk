@extends('layouts.app')

@section('title', "TanamYuk - {$project->name} (Hasil & Finansial)")

@section('content')
@include('pages.plants._header')

<div class="space-y-6">
    
    <!-- Ringkasan Siklus Section (Screen 9 2x2 Grid) -->
    <section class="space-y-4">
        <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 pb-2 border-b border-slate-200">
            <div>
                <h2 class="text-xl sm:text-2xl font-black text-slate-900 tracking-tight">Ringkasan Finansial & Panen</h2>
                <p class="text-xs text-slate-600 font-bold mt-0.5">Analisis biaya modal, hasil timbangan, dan pendapatan penjualan</p>
            </div>
            <div class="flex flex-wrap items-center gap-2">
                <button onclick="document.getElementById('modal-tambah-biaya').classList.remove('hidden')" class="px-3.5 py-2 bg-slate-100 hover:bg-slate-200 text-slate-800 text-xs font-black rounded-xl border border-slate-300 shadow-2xs transition">
                    + Biaya
                </button>
                <button onclick="document.getElementById('modal-tambah-panen').classList.remove('hidden')" class="px-3.5 py-2 bg-emerald-100 hover:bg-emerald-200 text-emerald-900 text-xs font-black rounded-xl border border-emerald-300 shadow-2xs transition">
                    + Panen
                </button>
                <button onclick="document.getElementById('modal-tambah-penjualan').classList.remove('hidden')" class="px-3.5 py-2 bg-emerald-700 hover:bg-emerald-800 text-white text-xs font-black rounded-xl shadow-xs transition">
                    + Penjualan
                </button>
            </div>
        </div>

        <!-- 4 Metric Cards Grid -->
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
            <!-- Card 1: Total Modal -->
            <div class="bg-white rounded-3xl p-5 shadow-xs border border-slate-200 flex items-start gap-3.5">
                <div class="w-11 h-11 rounded-2xl bg-slate-100 border border-slate-200 flex items-center justify-center shrink-0 text-slate-700">
                    <svg class="w-6 h-6 text-slate-700 stroke-[2.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                </div>
                <div class="flex flex-col min-w-0">
                    <span class="text-xs text-slate-600 font-bold leading-none mb-1.5">Total Modal</span>
                    <span class="text-base sm:text-lg font-black text-slate-900 leading-tight truncate">Rp {{ number_format($project->total_expense, 0, ',', '.') }}</span>
                </div>
            </div>

            <!-- Card 2: Total Panen -->
            <div class="bg-white rounded-3xl p-5 shadow-xs border border-slate-200 flex items-start gap-3.5">
                <div class="w-11 h-11 rounded-2xl bg-emerald-100 border border-emerald-200 flex items-center justify-center shrink-0">
                    <svg class="w-6 h-6 text-emerald-800 stroke-[2.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path d="M12 19V6m0 0a6 6 0 016 6c0 4-6 7-6 7s-6-3-6-7a6 6 0 016-6z" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                </div>
                <div class="flex flex-col min-w-0">
                    <span class="text-xs text-slate-600 font-bold leading-none mb-1.5">Total Panen</span>
                    <span class="text-base sm:text-lg font-black text-slate-900 leading-tight truncate">{{ number_format($project->total_harvest_kg, 1, ',', '.') }} kg</span>
                </div>
            </div>

            <!-- Card 3: Penjualan -->
            <div class="bg-white rounded-3xl p-5 shadow-xs border border-slate-200 flex items-start gap-3.5">
                <div class="w-11 h-11 rounded-2xl bg-emerald-100 border border-emerald-200 flex items-center justify-center shrink-0">
                    <svg class="w-6 h-6 text-emerald-800 stroke-[2.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path d="M9 14l6-6m-5.5.5h.01m4.99 5h.01M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16l3.5-2 3.5 2 3.5-2 3.5 2zM10 3v4a1 1 0 001 1h4" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                </div>
                <div class="flex flex-col min-w-0">
                    <span class="text-xs text-slate-600 font-bold leading-none mb-1.5">Penjualan</span>
                    <span class="text-base sm:text-lg font-black text-slate-900 leading-tight truncate">Rp {{ number_format($project->total_sales, 0, ',', '.') }}</span>
                </div>
            </div>

            <!-- Card 4: Hasil Sementara (Profit/Loss) -->
            @php $net = $project->net_profit_loss; @endphp
            <div class="bg-white rounded-3xl p-5 shadow-xs border border-slate-200 flex items-start gap-3.5">
                <div class="w-11 h-11 rounded-2xl {{ $net >= 0 ? 'bg-emerald-100 border-emerald-200 text-emerald-800' : 'bg-rose-100 border-rose-200 text-rose-700' }} border flex items-center justify-center shrink-0">
                    <svg class="w-6 h-6 stroke-current fill-none stroke-[2.5]" viewBox="0 0 24 24">
                        @if($net >= 0)
                            <path d="M7 17l10-10M17 17V7H7" stroke-linecap="round" stroke-linejoin="round"></path>
                        @else
                            <path d="M7 17l10-10M9 9h.01M15 15h.01" stroke-linecap="round" stroke-linejoin="round"></path>
                        @endif
                    </svg>
                </div>
                <div class="flex flex-col min-w-0">
                    <span class="text-xs text-slate-600 font-bold leading-none mb-1.5">Hasil Laba/Rugi</span>
                    <span class="text-base sm:text-lg font-black {{ $net >= 0 ? 'text-emerald-800' : 'text-rose-700' }} leading-tight truncate">
                        {{ $net < 0 ? '- ' : '+ ' }}Rp {{ number_format(abs($net), 0, ',', '.') }}
                    </span>
                </div>
            </div>
        </div>
    </section>

    <!-- Detail Sections: 3 Columns on LG -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 items-start">
        
        <!-- 1. Catatan Pengeluaran Modal -->
        <section class="bg-white rounded-3xl p-5 sm:p-6 border border-slate-200 shadow-xs space-y-4">
            <div class="flex justify-between items-center pb-2.5 border-b border-slate-100">
                <h3 class="text-xs font-black text-slate-900 uppercase tracking-wider flex items-center gap-2">
                    <span>🛒</span> Biaya Modal ({{ $project->expenses->count() }})
                </h3>
                <button onclick="document.getElementById('modal-tambah-biaya').classList.remove('hidden')" class="text-xs font-black text-emerald-900 bg-emerald-100 px-3 py-1 rounded-xl border border-emerald-300 hover:bg-emerald-200 transition">
                    + Biaya
                </button>
            </div>

            <div class="divide-y divide-slate-100 space-y-1">
                @forelse($project->expenses as $exp)
                    <div class="pt-2.5 pb-1 flex justify-between items-start text-xs gap-2">
                        <div>
                            <span class="font-black text-slate-900 block text-sm">{{ $exp->description }}</span>
                            <span class="text-xs text-slate-500 font-bold">{{ $exp->category->name ?? 'Kategori' }} • {{ \Carbon\Carbon::parse($exp->expense_date)->translatedFormat('d M Y') }}</span>
                        </div>
                        <span class="font-black text-slate-900 text-sm whitespace-nowrap">Rp {{ number_format($exp->amount, 0, ',', '.') }}</span>
                    </div>
                @empty
                    <p class="text-xs text-slate-500 font-bold py-4 text-center">Belum ada pengeluaran dicatat.</p>
                @endforelse
            </div>
        </section>

        <!-- 2. Catatan Hasil Panen -->
        <section class="bg-white rounded-3xl p-5 sm:p-6 border border-slate-200 shadow-xs space-y-4">
            <div class="flex justify-between items-center pb-2.5 border-b border-slate-100">
                <h3 class="text-xs font-black text-slate-900 uppercase tracking-wider flex items-center gap-2">
                    <span>🧺</span> Hasil Panen ({{ $project->harvests->count() }})
                </h3>
                <button onclick="document.getElementById('modal-tambah-panen').classList.remove('hidden')" class="text-xs font-black text-emerald-900 bg-emerald-100 px-3 py-1 rounded-xl border border-emerald-300 hover:bg-emerald-200 transition">
                    + Panen
                </button>
            </div>

            <div class="divide-y divide-slate-100 space-y-1">
                @forelse($project->harvests as $harv)
                    <div class="pt-2.5 pb-1 flex justify-between items-start text-xs gap-2">
                        <div>
                            <span class="font-black text-slate-900 block text-sm">Panen ke-{{ $harv->harvest_no }}</span>
                            <span class="text-xs text-slate-500 font-bold">{{ \Carbon\Carbon::parse($harv->harvest_date)->translatedFormat('d M Y') }} • {{ $harv->note ?? 'Kualitas baik' }}</span>
                        </div>
                        <span class="font-black text-emerald-950 bg-emerald-100 px-3 py-1 rounded-full border border-emerald-300 text-xs whitespace-nowrap">
                            {{ $harv->weight_kg }} kg
                        </span>
                    </div>
                @empty
                    <p class="text-xs text-slate-500 font-bold py-4 text-center">Belum ada panen dicatat untuk siklus ini.</p>
                @endforelse
            </div>
        </section>

        <!-- 3. Catatan Penjualan Panen -->
        <section class="bg-white rounded-3xl p-5 sm:p-6 border border-slate-200 shadow-xs space-y-4">
            <div class="flex justify-between items-center pb-2.5 border-b border-slate-100">
                <h3 class="text-xs font-black text-slate-900 uppercase tracking-wider flex items-center gap-2">
                    <span>💰</span> Penjualan Panen ({{ $project->sales->count() }})
                </h3>
                <button onclick="document.getElementById('modal-tambah-penjualan').classList.remove('hidden')" class="text-xs font-black text-emerald-900 bg-emerald-100 px-3 py-1 rounded-xl border border-emerald-300 hover:bg-emerald-200 transition">
                    + Penjualan
                </button>
            </div>

            <div class="divide-y divide-slate-100 space-y-1">
                @forelse($project->sales as $sale)
                    <div class="pt-2.5 pb-1 flex justify-between items-start text-xs gap-2">
                        <div>
                            <span class="font-black text-slate-900 block text-sm">{{ $sale->buyer_name ?? 'Pelanggan' }}</span>
                            <span class="text-xs text-slate-500 font-bold">{{ $sale->qty_kg }} kg @ Rp {{ number_format($sale->price_per_kg, 0, ',', '.') }}</span>
                            <span class="text-[11px] text-slate-500 font-bold block mt-0.5">{{ \Carbon\Carbon::parse($sale->sale_date)->translatedFormat('d M Y') }} • Status: {{ strtoupper($sale->payment_status) }}</span>
                        </div>
                        <span class="font-black text-emerald-900 text-sm whitespace-nowrap">
                            Rp {{ number_format($sale->total_amount, 0, ',', '.') }}
                        </span>
                    </div>
                @empty
                    <p class="text-xs text-slate-500 font-bold py-4 text-center">Belum ada penjualan hasil panen.</p>
                @endforelse
            </div>
        </section>

    </div>

</div>

<!-- Modal: Tambah Biaya Modal -->
<div id="modal-tambah-biaya" class="hidden fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-end sm:items-center justify-center z-50 p-0 sm:p-4">
    <div class="w-full max-w-lg bg-white rounded-t-3xl sm:rounded-3xl p-6 space-y-4 shadow-2xl">
        <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
            <div>
                <h3 class="text-base font-black text-slate-900">Catat Pengeluaran Modal</h3>
                <p class="text-xs text-slate-600 font-bold">Catat pembelian pupuk, bibit, media, atau alat</p>
            </div>
            <button onclick="document.getElementById('modal-tambah-biaya').classList.add('hidden')" class="text-slate-500 hover:text-slate-800 text-xl font-black">&times;</button>
        </div>
        <form action="{{ route('plants.expenses.store', $project) }}" method="POST" class="space-y-4 text-xs font-bold text-slate-800">
            @csrf
            <div>
                <label class="block font-black text-slate-900 mb-1.5">Kategori Biaya</label>
                <select name="expense_category_id" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600">
                    @foreach($categories as $cat)
                        <option value="{{ $cat->id }}">{{ $cat->name }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block font-black text-slate-900 mb-1.5">Keterangan Pengeluaran</label>
                <input type="text" name="description" placeholder="Misal: Pupuk NPK 1 kg" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
            </div>
            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="block font-black text-slate-900 mb-1.5">Jumlah (Rp)</label>
                    <input type="number" name="amount" placeholder="50000" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
                </div>
                <div>
                    <label class="block font-black text-slate-900 mb-1.5">Tanggal</label>
                    <input type="date" name="expense_date" value="{{ date('Y-m-d') }}" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
                </div>
            </div>
            <button type="submit" class="w-full py-3.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl font-black transition shadow-sm">Simpan Pengeluaran</button>
        </form>
    </div>
</div>

<!-- Modal: Tambah Panen -->
<div id="modal-tambah-panen" class="hidden fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-end sm:items-center justify-center z-50 p-0 sm:p-4">
    <div class="w-full max-w-lg bg-white rounded-t-3xl sm:rounded-3xl p-6 space-y-4 shadow-2xl">
        <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
            <div>
                <h3 class="text-base font-black text-slate-900">Catat Hasil Panen</h3>
                <p class="text-xs text-slate-600 font-bold">Timbang hasil panen siklus ini untuk hitung produktivitas</p>
            </div>
            <button onclick="document.getElementById('modal-tambah-panen').classList.add('hidden')" class="text-slate-500 hover:text-slate-800 text-xl font-black">&times;</button>
        </div>
        <form action="{{ route('plants.harvests.store', $project) }}" method="POST" class="space-y-4 text-xs font-bold text-slate-800">
            @csrf
            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="block font-black text-slate-900 mb-1.5">Berat Panen (Kg)</label>
                    <input type="number" step="0.1" name="weight_kg" placeholder="5.5" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
                </div>
                <div>
                    <label class="block font-black text-slate-900 mb-1.5">Tanggal Panen</label>
                    <input type="date" name="harvest_date" value="{{ date('Y-m-d') }}" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
                </div>
            </div>
            <div>
                <label class="block font-black text-slate-900 mb-1.5">Catatan Panen</label>
                <input type="text" name="note" placeholder="Misal: Panen tahap pertama kualitas segar" class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
            </div>
            <button type="submit" class="w-full py-3.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl font-black transition shadow-sm">Simpan Panen (+100 XP)</button>
        </form>
    </div>
</div>

<!-- Modal: Tambah Penjualan -->
<div id="modal-tambah-penjualan" class="hidden fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-end sm:items-center justify-center z-50 p-0 sm:p-4">
    <div class="w-full max-w-lg bg-white rounded-t-3xl sm:rounded-3xl p-6 space-y-4 shadow-2xl">
        <div class="flex justify-between items-center pb-2.5 border-b border-slate-200">
            <div>
                <h3 class="text-base font-black text-slate-900">Catat Penjualan Hasil</h3>
                <p class="text-xs text-slate-600 font-bold">Catat transaksi penjualan hasil panen dan pendapatan</p>
            </div>
            <button onclick="document.getElementById('modal-tambah-penjualan').classList.add('hidden')" class="text-slate-500 hover:text-slate-800 text-xl font-black">&times;</button>
        </div>
        <form action="{{ route('plants.sales.store', $project) }}" method="POST" class="space-y-4 text-xs font-bold text-slate-800">
            @csrf
            <div>
                <label class="block font-black text-slate-900 mb-1.5">Nama Pembeli</label>
                <input type="text" name="buyer_name" placeholder="Misal: Tetangga / Warung Sayur" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
            </div>
            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="block font-black text-slate-900 mb-1.5">Jumlah Terjual (Kg)</label>
                    <input type="number" step="0.1" name="qty_kg" placeholder="5.0" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
                </div>
                <div>
                    <label class="block font-black text-slate-900 mb-1.5">Harga per Kg (Rp)</label>
                    <input type="number" name="price_per_kg" placeholder="35000" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
                </div>
            </div>
            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="block font-black text-slate-900 mb-1.5">Tanggal</label>
                    <input type="date" name="sale_date" value="{{ date('Y-m-d') }}" required class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600"/>
                </div>
                <div>
                    <label class="block font-black text-slate-900 mb-1.5">Status Pembayaran</label>
                    <select name="payment_status" class="w-full rounded-xl border-slate-300 text-xs font-bold text-slate-900 focus:ring-emerald-600">
                        <option value="paid">Lunas</option>
                        <option value="partial">Sebagian</option>
                        <option value="unpaid">Belum Dibayar</option>
                    </select>
                </div>
            </div>
            <button type="submit" class="w-full py-3.5 bg-emerald-700 hover:bg-emerald-800 text-white rounded-xl font-black transition shadow-sm">Simpan Penjualan</button>
        </form>
    </div>
</div>
@endsection
