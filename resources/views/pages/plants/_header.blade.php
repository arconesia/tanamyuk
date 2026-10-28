<!-- Project Navigation & Breadcrumb Banner -->
<div class="bg-white rounded-3xl border border-slate-200 p-4 sm:p-5 shadow-xs mb-6 space-y-4">
    
    <!-- Top Row: Back button, Title & Status -->
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-3 border-b border-slate-200">
        <div class="flex items-center gap-3">
            <a href="{{ route('plants.index') }}" aria-label="Kembali" class="w-10 h-10 rounded-2xl bg-slate-100 hover:bg-slate-200 text-slate-800 flex items-center justify-center transition shadow-2xs shrink-0 border border-slate-300">
                <svg class="w-5 h-5 stroke-[2.5]" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                    <path d="M15 19l-7-7 7-7"></path>
                </svg>
            </a>
            <div>
                <div class="flex items-center gap-2">
                    <span class="text-xs font-black uppercase tracking-wider px-2.5 py-0.5 rounded-md bg-emerald-100 text-emerald-900 border border-emerald-300">
                        {{ $project->program->commodity->name ?? 'Komoditas' }}
                    </span>
                    <span class="text-xs text-slate-600 font-bold">• Siklus #{{ $project->cycle_no }} • {{ $project->location_name ?? 'Lahan Utama' }}</span>
                </div>
                <h1 class="text-xl sm:text-2xl font-black text-slate-900 tracking-tight leading-tight mt-1">
                    {{ $project->name }}
                </h1>
            </div>
        </div>

        <div class="flex items-center gap-2 self-start sm:self-auto">
            <span class="text-xs px-3.5 py-1.5 rounded-full {{ $project->status === 'active' ? 'bg-emerald-100 text-emerald-900 border border-emerald-300' : 'bg-slate-200 text-slate-800 border border-slate-300' }} font-black uppercase tracking-wider">
                Status: {{ $project->status === 'active' ? 'Siklus Aktif' : 'Selesai' }}
            </span>
        </div>
    </div>

    <!-- 5 Horizontal Sub-Navigation Tabs -->
    <nav class="flex items-center gap-2 overflow-x-auto no-scrollbar pt-1 text-xs font-bold">
        <!-- Tab 1: Hari Ini -->
        <a href="{{ route('plants.show', $project) }}" class="{{ $activeTab === 'hari-ini' ? 'bg-emerald-800 text-white shadow-xs font-black' : 'bg-slate-100 text-slate-700 hover:bg-slate-200 hover:text-slate-950' }} px-4 py-2.5 rounded-xl transition flex items-center gap-1.5 shrink-0 border border-slate-200">
            <span>📅</span>
            <span>Hari Ini</span>
        </a>

        <!-- Tab 2: Perjalanan -->
        <a href="{{ route('plants.timeline', $project) }}" class="{{ $activeTab === 'perjalanan' ? 'bg-emerald-800 text-white shadow-xs font-black' : 'bg-slate-100 text-slate-700 hover:bg-slate-200 hover:text-slate-950' }} px-4 py-2.5 rounded-xl transition flex items-center gap-1.5 shrink-0 border border-slate-200">
            <span>🌿</span>
            <span>Perjalanan Siklus</span>
        </a>

        <!-- Tab 3: Masalah -->
        <a href="{{ route('plants.problems', $project) }}" class="{{ $activeTab === 'masalah' ? 'bg-emerald-800 text-white shadow-xs font-black' : 'bg-slate-100 text-slate-700 hover:bg-slate-200 hover:text-slate-950' }} px-4 py-2.5 rounded-xl transition flex items-center gap-1.5 shrink-0 border border-slate-200">
            <span>🐛</span>
            <span>Masalah & Solusi</span>
        </a>

        <!-- Tab 4: Catatan -->
        <a href="{{ route('plants.notes', $project) }}" class="{{ $activeTab === 'catatan' ? 'bg-emerald-800 text-white shadow-xs font-black' : 'bg-slate-100 text-slate-700 hover:bg-slate-200 hover:text-slate-950' }} px-4 py-2.5 rounded-xl transition flex items-center gap-1.5 shrink-0 border border-slate-200">
            <span>📝</span>
            <span>Catatan & Foto</span>
        </a>

        <!-- Tab 5: Hasil & Finansial -->
        <a href="{{ route('plants.results', $project) }}" class="{{ $activeTab === 'hasil' ? 'bg-emerald-800 text-white shadow-xs font-black' : 'bg-slate-100 text-slate-700 hover:bg-slate-200 hover:text-slate-950' }} px-4 py-2.5 rounded-xl transition flex items-center gap-1.5 shrink-0 border border-slate-200">
            <span>💰</span>
            <span>Hasil & Keuangan</span>
        </a>
    </nav>

</div>
