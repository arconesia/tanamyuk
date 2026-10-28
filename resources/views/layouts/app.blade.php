<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0, viewport-fit=cover" name="viewport"/>
    <meta name="theme-color" content="#ecfdf5"/>
    <title>@yield('title', 'TanamYuk - SaaS Budidaya Pintar')</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['"Plus Jakarta Sans"', '-apple-system', 'BlinkMacSystemFont', '"Segoe UI"', 'Roboto', 'sans-serif']
                    }
                }
            }
        }
    </script>
    <style>
        * { -webkit-tap-highlight-color: transparent; }
        html { scroll-behavior: smooth; }
        body {
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            font-weight: 500;
            color: #1e293b;
            background: linear-gradient(180deg, #ecfdf5 0%, #f6fbf8 260px, #f8fafc 100%) no-repeat;
            background-color: #f8fafc;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            text-rendering: optimizeLegibility;
            -webkit-text-size-adjust: 100%;
        }

        /* Skala font seimbang: tegas tapi tidak terlalu berat, tetap terbaca di HP */
        .font-black { font-weight: 800 !important; }
        .font-extrabold { font-weight: 700 !important; }
        .text-xs { font-size: 0.8125rem !important; line-height: 1.25rem !important; }
        h1, h2, h3, h4 { letter-spacing: -0.02em; color: #0f172a; }
        h1 { font-size: clamp(1.375rem, 5.2vw, 1.875rem) !important; line-height: 1.2 !important; }

        /* Kartu lebih lembut & segar */
        .rounded-3xl { border-radius: 1.5rem; }
        .shadow-xs { box-shadow: 0 1px 2px rgba(16, 185, 129, .06), 0 4px 14px rgba(15, 23, 42, .04) !important; }
        .border-slate-200 { border-color: #e6efe9 !important; }

        /* Bottom nav */
        .bn-wrap {
            left: .75rem; right: .75rem;
            bottom: calc(.75rem + env(safe-area-inset-bottom));
        }
        .bn-item { transition: color .2s ease; }
        .bn-pill { transition: background-color .25s ease, transform .25s ease; }
        .bn-item:active .bn-pill { transform: scale(.92); }

        .hide-scrollbar::-webkit-scrollbar, .no-scrollbar::-webkit-scrollbar { display: none; }
        .hide-scrollbar, .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }

        @media (max-width: 767px) {
            main { padding-bottom: calc(7.5rem + env(safe-area-inset-bottom)) !important; }
            input, select, textarea { font-size: 16px !important; } /* cegah zoom otomatis iOS */
        }
    </style>
</head>
<body class="min-h-screen flex flex-col antialiased selection:bg-emerald-600 selection:text-white">

    <!-- Header -->
    <header class="sticky top-0 z-40 bg-white/85 backdrop-blur-xl border-b border-emerald-100/70">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 h-14 md:h-16 flex items-center justify-between gap-3">

            <div class="flex items-center gap-2.5 sm:gap-5 min-w-0">
                <a href="{{ route('dashboard') }}" class="flex items-center gap-2 shrink-0">
                    <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-emerald-400 to-teal-600 flex items-center justify-center text-white shadow-md shadow-emerald-500/25">
                        <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24"><path d="M17 8C8 10 5.9 16.17 3.82 21.34L5.71 22l1-2.3A9.49 9.49 0 0 0 12 21c7 0 11-8 11-14a5 5 0 0 0-5-5c-3 0-5 2-6 5 2-1 4-1 5 1z"></path></svg>
                    </div>
                    <span class="text-lg font-extrabold tracking-tight text-slate-900 leading-none">Tanam<span class="text-emerald-600">Yuk</span></span>
                </a>

                @if(isset($currentWorkspace))
                    <div class="relative min-w-0" id="workspace-dropdown-container">
                        <button onclick="toggleWorkspaceMenu()" class="flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-emerald-50 hover:bg-emerald-100 border border-emerald-200 text-xs font-semibold text-emerald-900 transition max-w-[160px] sm:max-w-[220px]">
                            <span class="w-2 h-2 rounded-full bg-emerald-500 shrink-0"></span>
                            <span class="truncate">{{ $currentWorkspace->name }}</span>
                            <svg class="w-3.5 h-3.5 shrink-0 stroke-[2.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 9l-7 7-7-7" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                        </button>

                        <div id="workspace-menu" class="hidden absolute left-0 mt-2 w-72 max-w-[85vw] bg-white rounded-2xl shadow-2xl border border-emerald-100 p-2.5 z-50">
                            <div class="px-3 py-2 border-b border-slate-100">
                                <p class="text-xs font-bold text-slate-500 uppercase tracking-wider">Ruang Kerja</p>
                                <p class="text-sm font-bold text-slate-900 truncate">{{ $currentWorkspace->name }}</p>
                            </div>
                            <div class="py-1.5 space-y-1">
                                @foreach($userWorkspaces as $ws)
                                    <form action="{{ route('workspaces.switch', $ws) }}" method="POST" class="m-0">
                                        @csrf
                                        <button type="submit" class="w-full text-left px-3.5 py-2.5 rounded-xl text-xs flex items-center justify-between {{ $ws->id === $currentWorkspace->id ? 'bg-emerald-100 text-emerald-900 font-bold' : 'text-slate-700 hover:bg-slate-50 font-semibold' }} transition">
                                            <span class="truncate">{{ $ws->name }}</span>
                                            @if($ws->id === $currentWorkspace->id)<span class="text-emerald-700 font-bold">✓</span>@endif
                                        </button>
                                    </form>
                                @endforeach
                            </div>
                            <div class="pt-2 border-t border-slate-100">
                                <a href="{{ route('profile.index') }}" class="block text-center text-xs font-bold text-emerald-700 py-1.5">Kelola Ruang Kerja →</a>
                            </div>
                        </div>
                    </div>
                @endif
            </div>

            <!-- Desktop nav -->
            <nav class="hidden md:flex items-center gap-1">
                @php
                    $links = [
                        ['dashboard', 'dashboard', 'Beranda'],
                        ['plants.index', 'plants.*', 'Tanaman Saya'],
                        ['challenges.index', 'challenges.*', 'Tantangan'],
                        ['profile.index', 'profile.*', 'Profil & Tim'],
                    ];
                @endphp
                @foreach($links as [$r, $pattern, $label])
                    <a href="{{ route($r) }}" class="px-3.5 py-2 rounded-full text-xs font-bold transition {{ request()->routeIs($pattern) ? 'bg-emerald-100 text-emerald-900' : 'text-slate-600 hover:text-slate-900 hover:bg-emerald-50' }}">{{ $label }}</a>
                @endforeach
            </nav>

            <div class="flex items-center gap-2 shrink-0">
                <div class="hidden lg:flex items-center gap-1 bg-slate-100 p-1 rounded-full border border-slate-200">
                    @foreach($allDemoUsers as $u)
                        <form action="{{ route('auth.switch-user', $u) }}" method="POST" class="m-0">
                            @csrf
                            <button type="submit" title="Beralih ke {{ $u->name }}" class="px-2.5 py-1 rounded-full text-xs font-bold transition {{ $currentUser->id === $u->id ? 'bg-emerald-600 text-white' : 'text-slate-600 hover:bg-slate-200' }}">{{ explode(' ', $u->name)[0] }}</button>
                        </form>
                    @endforeach
                </div>

                <a href="{{ route('profile.index') }}" class="flex items-center gap-2 rounded-full border border-emerald-200 bg-white p-0.5 sm:pr-3 transition hover:bg-emerald-50">
                    <div class="w-8 h-8 rounded-full overflow-hidden bg-emerald-100 shrink-0">
                        @if($currentUser->avatar_url)
                            <img alt="{{ $currentUser->name }}" class="w-full h-full object-cover" src="{{ $currentUser->avatar_url }}"/>
                        @else
                            <div class="w-full h-full text-emerald-900 font-bold flex items-center justify-center text-xs">{{ strtoupper(substr($currentUser->name, 0, 2)) }}</div>
                        @endif
                    </div>
                    <span class="hidden sm:block text-xs font-bold text-slate-800">{{ explode(' ', $currentUser->name)[0] }}</span>
                </a>
            </div>
        </div>
    </header>

    <!-- Toast -->
    @if(session('success'))
        <div id="flash-toast" class="fixed top-16 left-3 right-3 sm:left-auto sm:right-8 sm:max-w-sm p-3.5 bg-emerald-600 text-white rounded-2xl text-xs font-semibold flex items-center justify-between shadow-xl z-50">
            <div class="flex items-center gap-2"><span>✨</span><span>{{ session('success') }}</span></div>
            <button onclick="document.getElementById('flash-toast').remove()" class="text-emerald-100 hover:text-white text-lg font-bold ml-3">&times;</button>
        </div>
    @endif
    @if($errors->any())
        <div class="fixed top-16 left-3 right-3 sm:left-auto sm:right-8 sm:max-w-sm p-3.5 bg-rose-600 text-white rounded-2xl text-xs font-semibold shadow-xl z-50">
            <div class="flex items-center justify-between mb-1">
                <span class="font-bold">Perhatian:</span>
                <button onclick="this.parentElement.parentElement.remove()" class="text-rose-100 hover:text-white font-bold">&times;</button>
            </div>
            <ul class="list-disc list-inside space-y-0.5">@foreach($errors->all() as $err)<li>{{ $err }}</li>@endforeach</ul>
        </div>
    @endif

    <main class="flex-1 w-full max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-5 md:py-6 md:pb-12">
        @yield('content')
    </main>

    <!-- Footer desktop -->
    <footer class="hidden md:block bg-white border-t border-emerald-100 mt-12 py-10 text-slate-600">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid md:grid-cols-4 gap-8 mb-8">
                <div class="space-y-3">
                    <div class="flex items-center gap-2">
                        <div class="w-7 h-7 rounded-lg bg-gradient-to-br from-emerald-400 to-teal-600 flex items-center justify-center text-white">
                            <svg class="w-4 h-4 fill-current" viewBox="0 0 24 24"><path d="M17 8C8 10 5.9 16.17 3.82 21.34L5.71 22l1-2.3A9.49 9.49 0 0 0 12 21c7 0 11-8 11-14a5 5 0 0 0-5-5c-3 0-5 2-6 5 2-1 4-1 5 1z"></path></svg>
                        </div>
                        <span class="text-base font-extrabold text-slate-900">Tanam<span class="text-emerald-600">Yuk</span></span>
                    </div>
                    <p class="text-xs leading-relaxed">Platform SaaS manajemen budidaya multi-komoditas dan multi-siklus untuk tim tani modern.</p>
                </div>
                <div class="space-y-3">
                    <h3 class="text-xs font-bold uppercase tracking-wider text-slate-900">Navigasi</h3>
                    <ul class="space-y-2 text-xs font-semibold">
                        <li><a href="{{ route('dashboard') }}" class="hover:text-emerald-700">Beranda</a></li>
                        <li><a href="{{ route('plants.index') }}" class="hover:text-emerald-700">Tanaman Saya</a></li>
                        <li><a href="{{ route('challenges.index') }}" class="hover:text-emerald-700">Tantangan</a></li>
                        <li><a href="{{ route('profile.index') }}" class="hover:text-emerald-700">Profil & Tim</a></li>
                    </ul>
                </div>
                <div class="space-y-3">
                    <h3 class="text-xs font-bold uppercase tracking-wider text-slate-900">Modul</h3>
                    <ul class="space-y-2 text-xs font-medium">
                        <li>🌱 Multi-Komoditas</li><li>📅 Tugas Harian Berbasis Fase</li><li>🐛 Hama & Solusi</li><li>💰 Biaya, Panen & Penjualan</li>
                    </ul>
                </div>
                <div class="space-y-3">
                    <h3 class="text-xs font-bold uppercase tracking-wider text-slate-900">Ruang Kerja Aktif</h3>
                    <div class="p-3.5 bg-emerald-50 rounded-2xl border border-emerald-100 space-y-1">
                        <p class="text-xs font-bold text-slate-900">{{ $currentWorkspace->name ?? 'TanamYuk' }}</p>
                        <p class="text-xs text-slate-500">Pengguna: {{ $currentUser->name ?? '-' }}</p>
                    </div>
                </div>
            </div>
            <div class="pt-6 border-t border-slate-100 text-xs text-slate-500">© 2026 TanamYuk SaaS</div>
        </div>
    </footer>

    <!-- Bottom navigation (mobile) -->
    @hasSection('hide_bottom_nav')
    @else
        @php
            $tab = fn (string $pattern) => request()->routeIs($pattern);
        @endphp
        <nav aria-label="Menu utama" class="md:hidden fixed bn-wrap z-40 bg-white/90 backdrop-blur-xl rounded-[1.75rem] border border-emerald-100 shadow-[0_10px_30px_-8px_rgba(5,150,105,.35)] px-2 pt-2 pb-1.5 grid grid-cols-5 items-end">

            <a href="{{ route('dashboard') }}" class="bn-item flex flex-col items-center gap-0.5 {{ $tab('dashboard') ? 'text-emerald-700' : 'text-slate-500' }}">
                <span class="bn-pill w-12 h-8 rounded-full flex items-center justify-center {{ $tab('dashboard') ? 'bg-emerald-100' : '' }}">
                    <svg class="w-5 h-5 {{ $tab('dashboard') ? 'fill-current' : 'fill-none stroke-current stroke-2' }}" viewBox="0 0 24 24"><path d="M3 11.5 12 4l9 7.5V20a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z" stroke-linejoin="round"></path></svg>
                </span>
                <span class="text-[11px] leading-none {{ $tab('dashboard') ? 'font-bold' : 'font-semibold' }}">Beranda</span>
            </a>

            <a href="{{ route('plants.index') }}" class="bn-item flex flex-col items-center gap-0.5 {{ $tab('plants.*') ? 'text-emerald-700' : 'text-slate-500' }}">
                <span class="bn-pill w-12 h-8 rounded-full flex items-center justify-center {{ $tab('plants.*') ? 'bg-emerald-100' : '' }}">
                    <svg class="w-5 h-5 {{ $tab('plants.*') ? 'fill-current' : 'fill-none stroke-current stroke-2' }}" viewBox="0 0 24 24"><path d="M12 21v-8m0 0c0-4 3-7 8-7 0 5-3 7-8 7Zm0 0c0-3-2-6-7-6 0 4 2 6 7 6Z" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                </span>
                <span class="text-[11px] leading-none {{ $tab('plants.*') ? 'font-bold' : 'font-semibold' }}">Tanaman</span>
            </a>

            <!-- Aksi cepat: tambah budidaya -->
            <a href="{{ route('plants.index') }}#tambah" aria-label="Tambah budidaya" class="flex flex-col items-center -mt-7">
                <span class="w-14 h-14 rounded-full bg-gradient-to-br from-emerald-400 to-teal-600 text-white flex items-center justify-center shadow-lg shadow-emerald-500/40 ring-4 ring-white active:scale-95 transition">
                    <svg class="w-7 h-7 stroke-[2.75]" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M12 5v14M5 12h14" stroke-linecap="round"></path></svg>
                </span>
                <span class="text-[11px] leading-none font-bold text-emerald-700 mt-1">Tanam</span>
            </a>

            <a href="{{ route('challenges.index') }}" class="bn-item flex flex-col items-center gap-0.5 {{ $tab('challenges.*') ? 'text-emerald-700' : 'text-slate-500' }}">
                <span class="bn-pill w-12 h-8 rounded-full flex items-center justify-center {{ $tab('challenges.*') ? 'bg-emerald-100' : '' }}">
                    <svg class="w-5 h-5 stroke-current fill-none stroke-2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round"><path d="M8 21h8M12 17v4M7 4h10v5a5 5 0 0 1-10 0zM17 5h3v2a3 3 0 0 1-3 3M7 5H4v2a3 3 0 0 0 3 3"></path></svg>
                </span>
                <span class="text-[11px] leading-none {{ $tab('challenges.*') ? 'font-bold' : 'font-semibold' }}">Tantangan</span>
            </a>

            <a href="{{ route('profile.index') }}" class="bn-item flex flex-col items-center gap-0.5 {{ $tab('profile.*') ? 'text-emerald-700' : 'text-slate-500' }}">
                <span class="bn-pill w-12 h-8 rounded-full flex items-center justify-center {{ $tab('profile.*') ? 'bg-emerald-100' : '' }}">
                    <svg class="w-5 h-5 {{ $tab('profile.*') ? 'fill-current' : 'fill-none stroke-current stroke-2' }}" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="4"></circle><path d="M4 21a8 8 0 0 1 16 0z"></path></svg>
                </span>
                <span class="text-[11px] leading-none {{ $tab('profile.*') ? 'font-bold' : 'font-semibold' }}">Profil</span>
            </a>
        </nav>
    @endif

    <script>
        function toggleWorkspaceMenu() {
            document.getElementById('workspace-menu')?.classList.toggle('hidden');
        }
        document.addEventListener('click', function (e) {
            const c = document.getElementById('workspace-dropdown-container');
            const m = document.getElementById('workspace-menu');
            if (c && m && !c.contains(e.target)) m.classList.add('hidden');
        });
        // Tombol (+) di bottom nav membuka modal tambah budidaya
        if (location.hash === '#tambah') {
            document.getElementById('modal-tambah-tanaman')?.classList.remove('hidden');
        }
        setTimeout(() => {
            const t = document.getElementById('flash-toast');
            if (t) { t.style.transition = 'opacity .5s'; t.style.opacity = '0'; setTimeout(() => t.remove(), 500); }
        }, 4000);
    </script>
    @stack('scripts')
</body>
</html>
