# TanamYuk - Platform SaaS Budidaya Pintar

**TanamYuk** adalah platform SaaS manajemen budidaya pertanian & perkebunan pintar (*smart farming lifecycle management*) multi-tenant / multi-user, multi-komoditas, dan multi-siklus proyek budidaya.

---

## 🌟 Fitur Utama

- **Multi-Tenant / Multi-Workspace & Multi-User**: Mendukung kolaborasi tim dalam workspace dengan role pemilik, manajer, dan anggota kebun.
- **Multi-Komoditas**: Katalog komoditas lengkap (Cabai Rawit Merah, Melon Hidroponik, Selada Keriting, Jagung Manis, dsb).
- **Multi-Siklus / Multi-Project**: Manajemen siklus budidaya dari fase persemaian, vegetatif, generatif hingga panen.
- **Checklist Tugas Tahapan & Reminder**: Penjadwalan tugas harian, panduan teknis, dan pengingat aktivitas kebun.
- **Pencatatan Kondisi & Galeri Foto**: Dokumentasi visual perkembangan tanaman berbasis tanggal.
- **Deteksi & Penanganan Masalah**: Katalog hama/penyakit terintegrasi dengan aksi kuratif dan rekomendasi penanganan.
- **Biaya & Hasil Panen (Finance & Yield)**: Pencatatan operasional, kuantitas panen, dan penjualan hasil kebun.
- **Gamifikasi & Streak**: Sistem XP, level petani, badge pencapaian, dan streak aktivitas harian.
- **Responsif Desktop & Mobile**: Tampilan modern dengan UI segar, clean, tanpa frame statis, nyaman diakses di smartphone maupun desktop.

---

## 🛠️ Tech Stack

- **Framework**: Laravel 12 / PHP 8.3+
- **Database**: MySQL 8+ / MariaDB 10.4+ (juga kompatibel dengan SQLite)
- **Frontend / Styling**: Tailwind CSS, Blade Templates, Google Fonts (Plus Jakarta Sans & Outfit)
- **Build Tool**: Vite

---

## 🗄️ Database & Schema

Project ini menyertakan skema dan data database lengkap yang dapat diimpor langsung atau dijalankan via migration/seeder:

1. **Dump Database Lengkap (Struktur + Data)**:
   - File: `database/tanamyuk_dump.sql` (Full dump MySQL/MariaDB dengan struktur tabel, relasi foreign key, views, dan seluruh data sample).
   - File: `tanamyuk_simple_schema_mysql.sql` (DDL dan DML terstruktur untuk MySQL 8+).
2. **Laravel Migrations & Seeders**:
   - `database/migrations/`: Seluruh skema database termigrasi.
   - `database/seeders/DatabaseSeeder.php`: Seeder lengkap untuk user, workspace, komoditas, proyek, tahapan, tugas, catatan, masalah, biaya, panen, dan gamifikasi.

---

## 🚀 Panduan Instalasi & Menjalankan Project

### 1. Clone Repository
```bash
git clone https://github.com/arconesia/tanamyuk.git
cd tanamyuk
```

### 2. Install Dependency PHP & JavaScript
```bash
composer install
npm install
```

### 3. Konfigurasi Environment (`.env`)
Salin file `.env.example` ke `.env`:
```bash
cp .env.example .env
php artisan key:generate
```

Sesuaikan koneksi database di `.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=tanamyuk
DB_USERNAME=root
DB_PASSWORD=
```

### 4. Setup Database

Pilih salah satu cara berikut:

#### Opsi A: Menggunakan Laravel Migration & Seeder (Direkomendasikan)
Buat database `tanamyuk` di MySQL Anda, lalu jalankan:
```bash
php artisan migrate --seed
```

#### Opsi B: Import Langsung dari SQL Dump
```bash
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS tanamyuk CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root -p tanamyuk < database/tanamyuk_dump.sql
```

### 5. Build Asset & Jalankan Server

Jalankan Vite untuk kompilasi asset:
```bash
npm run build
# atau untuk development: npm run dev
```

Jalankan Laravel development server:
```bash
php artisan serve
```

Buka browser di: [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

## 👥 Akun Demo / Uji Coba

Gunakan kredensial berikut untuk masuk:

| Nama Pengguna | Email | Password | Role / Workspace |
|---------------|-------|----------|-------------------|
| **Robbi** | `robbi@tanamyuk.test` | `password` | Owner (Kebun Berkah Mandiri) |
| **Sari** | `sari@tanamyuk.test` | `password` | Member (Kebun Berkah Mandiri) & Owner (Kebun Hidroponik Sari) |
| **Budi** | `budi@tanamyuk.test` | `password` | Agronomist / Member |

---

## 📄 Lisensi

Project ini dirilis di bawah lisensi [MIT License](LICENSE).
