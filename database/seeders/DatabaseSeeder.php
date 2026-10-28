<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Users
        DB::table('users')->insert([
            [
                'id' => 1,
                'name' => 'Robbi',
                'email' => 'robbi@tanamyuk.test',
                'phone' => '081234567890',
                'password' => Hash::make('password'),
                'avatar_url' => 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=250&q=80',
                'status' => 'active',
                'email_verified_at' => '2026-09-01 08:00:00',
                'last_login_at' => '2026-10-27 22:00:00',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 2,
                'name' => 'Sari',
                'email' => 'sari@tanamyuk.test',
                'phone' => '081234567891',
                'password' => Hash::make('password'),
                'avatar_url' => 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=250&q=80',
                'status' => 'active',
                'email_verified_at' => '2026-09-02 08:00:00',
                'last_login_at' => '2026-10-27 20:00:00',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 3,
                'name' => 'Budi',
                'email' => 'budi@tanamyuk.test',
                'phone' => '081234567892',
                'password' => Hash::make('password'),
                'avatar_url' => null,
                'status' => 'active',
                'email_verified_at' => '2026-09-03 08:00:00',
                'last_login_at' => '2026-10-26 17:00:00',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 2. Workspaces
        DB::table('workspaces')->insert([
            [
                'id' => 1,
                'owner_user_id' => 1,
                'name' => 'Kebun Robbi',
                'slug' => 'kebun-robbi',
                'type' => 'personal',
                'timezone' => 'Asia/Jakarta',
                'currency' => 'IDR',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 2,
                'owner_user_id' => 2,
                'name' => 'Kebun Keluarga Sari',
                'slug' => 'kebun-sari',
                'type' => 'family',
                'timezone' => 'Asia/Jakarta',
                'currency' => 'IDR',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 3. Workspace Members
        DB::table('workspace_members')->insert([
            ['id' => 1, 'workspace_id' => 1, 'user_id' => 1, 'role' => 'owner', 'status' => 'active', 'joined_at' => '2026-09-01 08:00:00', 'created_at' => now()],
            ['id' => 2, 'workspace_id' => 1, 'user_id' => 3, 'role' => 'member', 'status' => 'active', 'joined_at' => '2026-09-05 08:00:00', 'created_at' => now()],
            ['id' => 3, 'workspace_id' => 2, 'user_id' => 2, 'role' => 'owner', 'status' => 'active', 'joined_at' => '2026-09-02 08:00:00', 'created_at' => now()],
        ]);

        // 4. User Preferences
        DB::table('user_preferences')->insert([
            ['id' => 1, 'user_id' => 1, 'language' => 'id', 'theme' => 'light', 'push_enabled' => 1, 'email_enabled' => 1, 'whatsapp_enabled' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 2, 'user_id' => 2, 'language' => 'id', 'theme' => 'system', 'push_enabled' => 1, 'email_enabled' => 1, 'whatsapp_enabled' => 0, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 3, 'user_id' => 3, 'language' => 'id', 'theme' => 'dark', 'push_enabled' => 1, 'email_enabled' => 0, 'whatsapp_enabled' => 0, 'created_at' => now(), 'updated_at' => now()],
        ]);

        // 5. Commodities
        DB::table('commodities')->insert([
            [
                'id' => 1,
                'code' => 'CABAI',
                'name' => 'Cabai',
                'category' => 'Sayur Buah',
                'description' => 'Budidaya cabai dari mulai sampai panen.',
                'image_url' => 'https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80',
                'default_duration_days' => 90,
                'is_active' => 1,
                'sort_order' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 2,
                'code' => 'TOMAT',
                'name' => 'Tomat',
                'category' => 'Sayur Buah',
                'description' => 'Budidaya tomat untuk lahan terbatas.',
                'image_url' => 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80',
                'default_duration_days' => 90,
                'is_active' => 1,
                'sort_order' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 3,
                'code' => 'PAKCOY',
                'name' => 'Pakcoy',
                'category' => 'Sayur Daun',
                'description' => 'Budidaya pakcoy sederhana.',
                'image_url' => 'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80',
                'default_duration_days' => 45,
                'is_active' => 1,
                'sort_order' => 3,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 6. Commodity Products
        DB::table('commodity_products')->insert([
            ['id' => 1, 'commodity_id' => 1, 'code' => 'CABAI-149', 'name' => 'Program Budidaya Cabai', 'price' => 149000, 'access_type' => 'lifetime', 'description' => 'Akses Cabai selamanya dan banyak siklus.', 'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 2, 'commodity_id' => 2, 'code' => 'TOMAT-149', 'name' => 'Program Budidaya Tomat', 'price' => 149000, 'access_type' => 'lifetime', 'description' => 'Akses Tomat selamanya.', 'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 3, 'commodity_id' => 3, 'code' => 'PAKCOY-99', 'name' => 'Program Budidaya Pakcoy', 'price' => 99000, 'access_type' => 'lifetime', 'description' => 'Akses Pakcoy selamanya.', 'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
        ]);

        // 7. Orders & Items
        DB::table('orders')->insert([
            ['id' => 1, 'workspace_id' => 1, 'user_id' => 1, 'order_no' => 'TY-20261001-0001', 'subtotal' => 149000, 'discount_amount' => 0, 'total_amount' => 149000, 'status' => 'paid', 'ordered_at' => '2026-10-01 09:00:00', 'paid_at' => '2026-10-01 09:02:00', 'created_at' => now()],
            ['id' => 2, 'workspace_id' => 2, 'user_id' => 2, 'order_no' => 'TY-20261002-0002', 'subtotal' => 149000, 'discount_amount' => 0, 'total_amount' => 149000, 'status' => 'paid', 'ordered_at' => '2026-10-02 10:00:00', 'paid_at' => '2026-10-02 10:04:00', 'created_at' => now()],
            ['id' => 3, 'workspace_id' => 1, 'user_id' => 1, 'order_no' => 'TY-20261020-0003', 'subtotal' => 99000, 'discount_amount' => 0, 'total_amount' => 99000, 'status' => 'pending', 'ordered_at' => '2026-10-20 10:00:00', 'paid_at' => null, 'created_at' => now()],
        ]);

        DB::table('order_items')->insert([
            ['id' => 1, 'order_id' => 1, 'commodity_product_id' => 1, 'product_name' => 'Program Budidaya Cabai', 'qty' => 1, 'unit_price' => 149000, 'total_price' => 149000, 'created_at' => now()],
            ['id' => 2, 'order_id' => 2, 'commodity_product_id' => 2, 'product_name' => 'Program Budidaya Tomat', 'qty' => 1, 'unit_price' => 149000, 'total_price' => 149000, 'created_at' => now()],
            ['id' => 3, 'order_id' => 3, 'commodity_product_id' => 3, 'product_name' => 'Program Budidaya Pakcoy', 'qty' => 1, 'unit_price' => 99000, 'total_price' => 99000, 'created_at' => now()],
        ]);

        DB::table('payments')->insert([
            ['id' => 1, 'order_id' => 1, 'provider' => 'midtrans', 'provider_reference' => 'MID-TY-001', 'payment_method' => 'QRIS', 'amount' => 149000, 'status' => 'paid', 'paid_at' => '2026-10-01 09:02:00', 'raw_response' => json_encode(['transaction_status' => 'settlement']), 'created_at' => now()],
            ['id' => 2, 'order_id' => 2, 'provider' => 'midtrans', 'provider_reference' => 'MID-TY-002', 'payment_method' => 'VA_BCA', 'amount' => 149000, 'status' => 'paid', 'paid_at' => '2026-10-02 10:04:00', 'raw_response' => json_encode(['transaction_status' => 'settlement']), 'created_at' => now()],
            ['id' => 3, 'order_id' => 3, 'provider' => 'midtrans', 'provider_reference' => 'MID-TY-003', 'payment_method' => 'QRIS', 'amount' => 99000, 'status' => 'pending', 'paid_at' => null, 'raw_response' => json_encode(['transaction_status' => 'pending']), 'created_at' => now()],
        ]);

        DB::table('workspace_commodity_access')->insert([
            ['id' => 1, 'workspace_id' => 1, 'commodity_id' => 1, 'commodity_product_id' => 1, 'source_order_item_id' => 1, 'access_type' => 'lifetime', 'starts_at' => '2026-10-01 09:02:00', 'ends_at' => null, 'status' => 'active', 'created_at' => now()],
            ['id' => 2, 'workspace_id' => 2, 'commodity_id' => 2, 'commodity_product_id' => 2, 'source_order_item_id' => 2, 'access_type' => 'lifetime', 'starts_at' => '2026-10-02 10:04:00', 'ends_at' => null, 'status' => 'active', 'created_at' => now()],
            ['id' => 3, 'workspace_id' => 1, 'commodity_id' => 3, 'commodity_product_id' => 3, 'source_order_item_id' => null, 'access_type' => 'trial', 'starts_at' => '2026-10-20 10:00:00', 'ends_at' => '2026-10-27 23:59:59', 'status' => 'active', 'created_at' => now()],
        ]);

        // 8. Cultivation Programs
        DB::table('cultivation_programs')->insert([
            ['id' => 1, 'commodity_id' => 1, 'code' => 'CABAI-SIMPLE-V1', 'name' => 'Budidaya Cabai', 'duration_days' => 90, 'description' => 'Mulai, Tanam, Rawat, Berbuah, Panen.', 'cover_image_url' => 'https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80', 'is_published' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 2, 'commodity_id' => 2, 'code' => 'TOMAT-SIMPLE-V1', 'name' => 'Budidaya Tomat', 'duration_days' => 90, 'description' => 'Program sederhana Tomat.', 'cover_image_url' => 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80', 'is_published' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 3, 'commodity_id' => 3, 'code' => 'PAKCOY-SIMPLE-V1', 'name' => 'Budidaya Pakcoy', 'duration_days' => 45, 'description' => 'Program sederhana Pakcoy.', 'cover_image_url' => 'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80', 'is_published' => 1, 'created_at' => now(), 'updated_at' => now()],
        ]);

        // 9. Program Stages
        DB::table('program_stages')->insert([
            ['id' => 1, 'cultivation_program_id' => 1, 'stage_no' => 1, 'code' => 'MULAI', 'name' => 'Mulai', 'start_day' => 1, 'end_day' => 7, 'description' => 'Persiapan dan persemaian benih.', 'xp_reward' => 100, 'created_at' => now()],
            ['id' => 2, 'cultivation_program_id' => 1, 'stage_no' => 2, 'code' => 'TANAM', 'name' => 'Tanam', 'start_day' => 8, 'end_day' => 14, 'description' => 'Pindah tanam bibit ke polybag/lahan.', 'xp_reward' => 100, 'created_at' => now()],
            ['id' => 3, 'cultivation_program_id' => 1, 'stage_no' => 3, 'code' => 'RAWAT', 'name' => 'Rawat', 'start_day' => 15, 'end_day' => 45, 'description' => 'Perawatan rutin, penyiraman & pemupukan vegetatif.', 'xp_reward' => 250, 'created_at' => now()],
            ['id' => 4, 'cultivation_program_id' => 1, 'stage_no' => 4, 'code' => 'BERBUAH', 'name' => 'Berbuah', 'start_day' => 46, 'end_day' => 70, 'description' => 'Pembungaan dan pembesaran buah cabai.', 'xp_reward' => 250, 'created_at' => now()],
            ['id' => 5, 'cultivation_program_id' => 1, 'stage_no' => 5, 'code' => 'PANEN', 'name' => 'Panen', 'start_day' => 71, 'end_day' => 90, 'description' => 'Pemetikan panen bertahap dan pasca panen.', 'xp_reward' => 500, 'created_at' => now()],
            ['id' => 6, 'cultivation_program_id' => 2, 'stage_no' => 1, 'code' => 'MULAI', 'name' => 'Mulai', 'start_day' => 1, 'end_day' => 7, 'description' => 'Persiapan tomat.', 'xp_reward' => 100, 'created_at' => now()],
            ['id' => 7, 'cultivation_program_id' => 3, 'stage_no' => 1, 'code' => 'MULAI', 'name' => 'Mulai', 'start_day' => 1, 'end_day' => 5, 'description' => 'Persiapan pakcoy.', 'xp_reward' => 80, 'created_at' => now()],
        ]);

        // 10. Stage Tasks
        DB::table('stage_tasks')->insert([
            ['id' => 1, 'program_stage_id' => 1, 'code' => 'SIAPKAN_MEDIA', 'title' => 'Siapkan media tanam', 'short_instruction' => 'Campurkan tanah, kompos dan sekam.', 'task_type' => 'other', 'recurrence_type' => 'once', 'recurrence_interval' => null, 'default_time' => '08:00:00', 'xp_reward' => 20, 'is_required' => 1, 'sort_order' => 1, 'created_at' => now()],
            ['id' => 2, 'program_stage_id' => 2, 'code' => 'PINDAH_TANAM', 'title' => 'Pindah tanam', 'short_instruction' => 'Pindahkan bibit sehat ke wadah tanam permanen.', 'task_type' => 'planting', 'recurrence_type' => 'once', 'recurrence_interval' => null, 'default_time' => '16:00:00', 'xp_reward' => 50, 'is_required' => 1, 'sort_order' => 1, 'created_at' => now()],
            ['id' => 3, 'program_stage_id' => 3, 'code' => 'SIRAM', 'title' => 'Siram tanaman', 'short_instruction' => 'Jaga kelembapan media tanam.', 'task_type' => 'watering', 'recurrence_type' => 'daily', 'recurrence_interval' => 1, 'default_time' => '07:00:00', 'xp_reward' => 10, 'is_required' => 1, 'sort_order' => 1, 'created_at' => now()],
            ['id' => 4, 'program_stage_id' => 3, 'code' => 'CEK_DAUN', 'title' => 'Periksa kondisi daun', 'short_instruction' => 'Cek warna daun dan deteksi dini hama.', 'task_type' => 'inspection', 'recurrence_type' => 'daily', 'recurrence_interval' => 1, 'default_time' => '16:00:00', 'xp_reward' => 10, 'is_required' => 1, 'sort_order' => 2, 'created_at' => now()],
            ['id' => 5, 'program_stage_id' => 3, 'code' => 'PUPUK', 'title' => 'Berikan pupuk NPK', 'short_instruction' => 'Gunakan pupuk sesuai dosis yang dianjurkan.', 'task_type' => 'fertilizing', 'recurrence_type' => 'interval', 'recurrence_interval' => 7, 'default_time' => '07:00:00', 'xp_reward' => 20, 'is_required' => 1, 'sort_order' => 3, 'created_at' => now()],
            ['id' => 6, 'program_stage_id' => 3, 'code' => 'FOTO', 'title' => 'Catat perkembangan', 'short_instruction' => 'Ambil foto tanaman untuk jurnal mingguan.', 'task_type' => 'photo', 'recurrence_type' => 'weekly', 'recurrence_interval' => 1, 'default_time' => '09:00:00', 'xp_reward' => 20, 'is_required' => 0, 'sort_order' => 4, 'created_at' => now()],
            ['id' => 7, 'program_stage_id' => 4, 'code' => 'CEK_BUNGA', 'title' => 'Periksa bunga dan buah', 'short_instruction' => 'Pantau calon buah dan rontok bunga.', 'task_type' => 'inspection', 'recurrence_type' => 'interval', 'recurrence_interval' => 3, 'default_time' => '07:00:00', 'xp_reward' => 15, 'is_required' => 1, 'sort_order' => 1, 'created_at' => now()],
            ['id' => 8, 'program_stage_id' => 5, 'code' => 'CATAT_PANEN', 'title' => 'Catat panen', 'short_instruction' => 'Timbang dan catat hasil panen hari ini.', 'task_type' => 'harvest', 'recurrence_type' => 'once', 'recurrence_interval' => null, 'default_time' => '08:00:00', 'xp_reward' => 100, 'is_required' => 1, 'sort_order' => 1, 'created_at' => now()],
            ['id' => 9, 'program_stage_id' => 6, 'code' => 'TOMAT_MEDIA', 'title' => 'Siapkan media tomat', 'short_instruction' => 'Siapkan media tanam tomat bernutrisi.', 'task_type' => 'other', 'recurrence_type' => 'once', 'recurrence_interval' => null, 'default_time' => '08:00:00', 'xp_reward' => 20, 'is_required' => 1, 'sort_order' => 1, 'created_at' => now()],
            ['id' => 10, 'program_stage_id' => 7, 'code' => 'PAKCOY_MEDIA', 'title' => 'Siapkan media pakcoy', 'short_instruction' => 'Siapkan media tanam hidroponik / tanah.', 'task_type' => 'other', 'recurrence_type' => 'once', 'recurrence_interval' => null, 'default_time' => '08:00:00', 'xp_reward' => 20, 'is_required' => 1, 'sort_order' => 1, 'created_at' => now()],
        ]);

        // 11. Cultivation Projects (Multi-Project, Multi-Cycle)
        DB::table('cultivation_projects')->insert([
            [
                'id' => 1,
                'workspace_id' => 1,
                'cultivation_program_id' => 1,
                'created_by' => 1,
                'project_code' => 'CABAI-001',
                'name' => 'Cabai Rawit #001',
                'cycle_no' => 1,
                'location_name' => 'Pekarangan Rumah',
                'initial_plant_count' => 50,
                'current_plant_count' => 47,
                'start_date' => '2026-09-20',
                'estimated_harvest_date' => '2026-12-18',
                'actual_end_date' => null,
                'status' => 'active',
                'target_yield_kg' => 25.00,
                'notes' => 'Siklus aktif utama di kebun Robbi.',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 2,
                'workspace_id' => 1,
                'cultivation_program_id' => 1,
                'created_by' => 1,
                'project_code' => 'CABAI-002',
                'name' => 'Cabai Rawit #002',
                'cycle_no' => 2,
                'location_name' => 'Samping Rumah',
                'initial_plant_count' => 30,
                'current_plant_count' => 30,
                'start_date' => '2026-10-20',
                'estimated_harvest_date' => '2027-01-17',
                'actual_end_date' => null,
                'status' => 'active',
                'target_yield_kg' => 15.00,
                'notes' => 'Siklus cabai kedua, ekspansi lahan samping.',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 3,
                'workspace_id' => 2,
                'cultivation_program_id' => 2,
                'created_by' => 2,
                'project_code' => 'TOMAT-001',
                'name' => 'Tomat #001',
                'cycle_no' => 1,
                'location_name' => 'Halaman Belakang',
                'initial_plant_count' => 20,
                'current_plant_count' => 20,
                'start_date' => '2026-10-10',
                'estimated_harvest_date' => '2027-01-07',
                'actual_end_date' => null,
                'status' => 'active',
                'target_yield_kg' => 30.00,
                'notes' => 'Siklus tomat pertama di kebun keluarga Sari.',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 4,
                'workspace_id' => 1,
                'cultivation_program_id' => 3,
                'created_by' => 1,
                'project_code' => 'PAKCOY-001',
                'name' => 'Pakcoy #001',
                'cycle_no' => 1,
                'location_name' => 'Teras Rumah',
                'initial_plant_count' => 24,
                'current_plant_count' => 24,
                'start_date' => '2026-10-21',
                'estimated_harvest_date' => '2026-12-04',
                'actual_end_date' => null,
                'status' => 'active',
                'target_yield_kg' => 6.00,
                'notes' => 'Trial pakcoy hidroponik modul vertikal.',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 5,
                'workspace_id' => 1,
                'cultivation_program_id' => 1,
                'created_by' => 1,
                'project_code' => 'CABAI-000',
                'name' => 'Cabai Rawit Percobaan',
                'cycle_no' => 0,
                'location_name' => 'Pekarangan Rumah',
                'initial_plant_count' => 40,
                'current_plant_count' => 35,
                'start_date' => '2026-04-01',
                'estimated_harvest_date' => '2026-06-29',
                'actual_end_date' => '2026-06-28',
                'status' => 'completed',
                'target_yield_kg' => 18.00,
                'notes' => 'Riwayat siklus selesai dan sukses panen.',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // 12. Project Members
        DB::table('project_members')->insert([
            ['id' => 1, 'cultivation_project_id' => 1, 'user_id' => 1, 'role' => 'manager', 'joined_at' => '2026-09-20 08:00:00'],
            ['id' => 2, 'cultivation_project_id' => 1, 'user_id' => 3, 'role' => 'member', 'joined_at' => '2026-09-20 08:10:00'],
            ['id' => 3, 'cultivation_project_id' => 2, 'user_id' => 1, 'role' => 'manager', 'joined_at' => '2026-10-20 08:00:00'],
            ['id' => 4, 'cultivation_project_id' => 3, 'user_id' => 2, 'role' => 'manager', 'joined_at' => '2026-10-10 08:00:00'],
            ['id' => 5, 'cultivation_project_id' => 4, 'user_id' => 1, 'role' => 'manager', 'joined_at' => '2026-10-21 08:00:00'],
            ['id' => 6, 'cultivation_project_id' => 5, 'user_id' => 1, 'role' => 'manager', 'joined_at' => '2026-04-01 08:00:00'],
        ]);

        // 13. Project Stage Progress
        DB::table('project_stage_progress')->insert([
            ['id' => 1, 'cultivation_project_id' => 1, 'program_stage_id' => 1, 'status' => 'completed', 'completion_percent' => 100, 'started_at' => '2026-09-20 08:00:00', 'completed_at' => '2026-09-26 18:00:00', 'xp_earned' => 100, 'created_at' => now()],
            ['id' => 2, 'cultivation_project_id' => 1, 'program_stage_id' => 2, 'status' => 'completed', 'completion_percent' => 100, 'started_at' => '2026-09-27 08:00:00', 'completed_at' => '2026-10-03 18:00:00', 'xp_earned' => 100, 'created_at' => now()],
            ['id' => 3, 'cultivation_project_id' => 1, 'program_stage_id' => 3, 'status' => 'active', 'completion_percent' => 38, 'started_at' => '2026-10-04 08:00:00', 'completed_at' => null, 'xp_earned' => 120, 'created_at' => now()],
            ['id' => 4, 'cultivation_project_id' => 1, 'program_stage_id' => 4, 'status' => 'locked', 'completion_percent' => 0, 'started_at' => null, 'completed_at' => null, 'xp_earned' => 0, 'created_at' => now()],
            ['id' => 5, 'cultivation_project_id' => 1, 'program_stage_id' => 5, 'status' => 'locked', 'completion_percent' => 0, 'started_at' => null, 'completed_at' => null, 'xp_earned' => 0, 'created_at' => now()],
            ['id' => 6, 'cultivation_project_id' => 2, 'program_stage_id' => 1, 'status' => 'completed', 'completion_percent' => 100, 'started_at' => '2026-10-20 08:00:00', 'completed_at' => '2026-10-26 18:00:00', 'xp_earned' => 100, 'created_at' => now()],
            ['id' => 7, 'cultivation_project_id' => 3, 'program_stage_id' => 6, 'status' => 'completed', 'completion_percent' => 100, 'started_at' => '2026-10-10 08:00:00', 'completed_at' => '2026-10-16 18:00:00', 'xp_earned' => 100, 'created_at' => now()],
            ['id' => 8, 'cultivation_project_id' => 4, 'program_stage_id' => 7, 'status' => 'active', 'completion_percent' => 75, 'started_at' => '2026-10-21 08:00:00', 'completed_at' => null, 'xp_earned' => 50, 'created_at' => now()],
            ['id' => 9, 'cultivation_project_id' => 5, 'program_stage_id' => 5, 'status' => 'completed', 'completion_percent' => 100, 'started_at' => '2026-06-10 08:00:00', 'completed_at' => '2026-06-28 18:00:00', 'xp_earned' => 500, 'created_at' => now()],
        ]);

        // 14. Project Tasks
        DB::table('project_tasks')->insert([
            ['id' => 1, 'cultivation_project_id' => 1, 'stage_task_id' => 3, 'assigned_to' => 1, 'title' => 'Siram tanaman', 'instruction' => 'Jaga kelembapan media.', 'task_type' => 'watering', 'due_at' => '2026-10-27 07:00:00', 'status' => 'done', 'xp_reward' => 10, 'completed_at' => '2026-10-27 07:05:00', 'completed_by' => 1, 'source' => 'system', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 2, 'cultivation_project_id' => 1, 'stage_task_id' => 4, 'assigned_to' => 1, 'title' => 'Periksa kondisi daun', 'instruction' => 'Cek warna daun dan hama.', 'task_type' => 'inspection', 'due_at' => '2026-10-27 16:00:00', 'status' => 'pending', 'xp_reward' => 10, 'completed_at' => null, 'completed_by' => null, 'source' => 'system', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 3, 'cultivation_project_id' => 1, 'stage_task_id' => 5, 'assigned_to' => 1, 'title' => 'Berikan pupuk NPK', 'instruction' => 'Gunakan pupuk sesuai dosis.', 'task_type' => 'fertilizing', 'due_at' => '2026-10-27 08:00:00', 'status' => 'pending', 'xp_reward' => 20, 'completed_at' => null, 'completed_by' => null, 'source' => 'system', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 4, 'cultivation_project_id' => 2, 'stage_task_id' => 3, 'assigned_to' => 1, 'title' => 'Siram bibit', 'instruction' => 'Jaga kelembapan media.', 'task_type' => 'watering', 'due_at' => '2026-10-27 07:00:00', 'status' => 'done', 'xp_reward' => 10, 'completed_at' => '2026-10-27 07:10:00', 'completed_by' => 1, 'source' => 'system', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 5, 'cultivation_project_id' => 3, 'stage_task_id' => 9, 'assigned_to' => 2, 'title' => 'Siapkan media tomat', 'instruction' => 'Siapkan media tanam.', 'task_type' => 'other', 'due_at' => '2026-10-10 08:00:00', 'status' => 'done', 'xp_reward' => 20, 'completed_at' => '2026-10-10 09:00:00', 'completed_by' => 2, 'source' => 'system', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 6, 'cultivation_project_id' => 4, 'stage_task_id' => 10, 'assigned_to' => 1, 'title' => 'Siapkan media pakcoy', 'instruction' => 'Siapkan media tanam.', 'task_type' => 'other', 'due_at' => '2026-10-21 08:00:00', 'status' => 'done', 'xp_reward' => 20, 'completed_at' => '2026-10-21 08:45:00', 'completed_by' => 1, 'source' => 'system', 'created_at' => now(), 'updated_at' => now()],
            ['id' => 7, 'cultivation_project_id' => 5, 'stage_task_id' => 8, 'assigned_to' => 1, 'title' => 'Catat panen terakhir', 'instruction' => 'Timbang hasil panen.', 'task_type' => 'harvest', 'due_at' => '2026-06-28 08:00:00', 'status' => 'done', 'xp_reward' => 100, 'completed_at' => '2026-06-28 08:30:00', 'completed_by' => 1, 'source' => 'system', 'created_at' => now(), 'updated_at' => now()],
        ]);

        // 15. Reminders
        DB::table('reminders')->insert([
            ['id' => 1, 'workspace_id' => 1, 'cultivation_project_id' => 1, 'project_task_id' => 2, 'user_id' => 1, 'title' => 'Periksa kondisi daun', 'remind_at' => '2026-10-27 15:55:00', 'channel' => 'push', 'is_enabled' => 1, 'sent_at' => null, 'created_at' => now()],
            ['id' => 2, 'workspace_id' => 1, 'cultivation_project_id' => 1, 'project_task_id' => 3, 'user_id' => 1, 'title' => 'Beri pupuk Cabai Rawit #001', 'remind_at' => '2026-10-27 07:55:00', 'channel' => 'push', 'is_enabled' => 1, 'sent_at' => '2026-10-27 07:55:00', 'created_at' => now()],
            ['id' => 3, 'workspace_id' => 2, 'cultivation_project_id' => 3, 'project_task_id' => null, 'user_id' => 2, 'title' => 'Foto perkembangan tomat', 'remind_at' => '2026-10-28 09:00:00', 'channel' => 'in_app', 'is_enabled' => 1, 'sent_at' => null, 'created_at' => now()],
        ]);

        // 16. Notes & Photos
        DB::table('project_notes')->insert([
            ['id' => 1, 'cultivation_project_id' => 1, 'user_id' => 1, 'note_date' => '2026-10-27', 'condition_status' => 'good', 'note_text' => 'Tanaman sehat, beberapa mulai menunjukkan calon bunga.', 'created_at' => now()],
            ['id' => 2, 'cultivation_project_id' => 2, 'user_id' => 1, 'note_date' => '2026-10-26', 'condition_status' => 'good', 'note_text' => 'Bibit cabai mulai tumbuh merata.', 'created_at' => now()],
            ['id' => 3, 'cultivation_project_id' => 3, 'user_id' => 2, 'note_date' => '2026-10-20', 'condition_status' => 'normal', 'note_text' => 'Tomat tumbuh baik.', 'created_at' => now()],
            ['id' => 4, 'cultivation_project_id' => 4, 'user_id' => 1, 'note_date' => '2026-10-26', 'condition_status' => 'good', 'note_text' => 'Pakcoy mulai membentuk daun baru.', 'created_at' => now()],
            ['id' => 5, 'cultivation_project_id' => 5, 'user_id' => 1, 'note_date' => '2026-06-28', 'condition_status' => 'good', 'note_text' => 'Siklus selesai dan panen dicatat.', 'created_at' => now()],
        ]);

        DB::table('project_photos')->insert([
            ['id' => 1, 'cultivation_project_id' => 1, 'project_note_id' => 1, 'user_id' => 1, 'photo_date' => '2026-10-27', 'file_url' => 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80', 'caption' => 'Cabai hari ke-38.', 'created_at' => now()],
            ['id' => 2, 'cultivation_project_id' => 2, 'project_note_id' => 2, 'user_id' => 1, 'photo_date' => '2026-10-26', 'file_url' => 'https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80', 'caption' => 'Cabai siklus kedua.', 'created_at' => now()],
            ['id' => 3, 'cultivation_project_id' => 3, 'project_note_id' => 3, 'user_id' => 2, 'photo_date' => '2026-10-20', 'file_url' => 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80', 'caption' => 'Tomat berkembang baik.', 'created_at' => now()],
            ['id' => 4, 'cultivation_project_id' => 4, 'project_note_id' => 4, 'user_id' => 1, 'photo_date' => '2026-10-26', 'file_url' => 'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80', 'caption' => 'Pakcoy hari ke-6.', 'created_at' => now()],
            ['id' => 5, 'cultivation_project_id' => 5, 'project_note_id' => 5, 'user_id' => 1, 'photo_date' => '2026-06-28', 'file_url' => 'https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80', 'caption' => 'Dokumentasi akhir.', 'created_at' => now()],
        ]);

        // 17. Problem Catalog & Solutions
        DB::table('problem_catalog')->insert([
            ['id' => 1, 'commodity_id' => 1, 'code' => 'DAUN_KUNING', 'name' => 'Daun Menguning', 'symptom_label' => 'Daun menguning', 'summary' => 'Terkait nutrisi, air atau akar.', 'image_url' => 'https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?auto=format&fit=crop&w=600&q=80', 'is_active' => 1, 'created_at' => now()],
            ['id' => 2, 'commodity_id' => 1, 'code' => 'DAUN_LUBANG', 'name' => 'Daun Berlubang', 'symptom_label' => 'Daun berlubang', 'summary' => 'Umumnya akibat hama ulat atau belalang.', 'image_url' => 'https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80', 'is_active' => 1, 'created_at' => now()],
            ['id' => 3, 'commodity_id' => 1, 'code' => 'DAUN_KERITING', 'name' => 'Daun Keriting', 'symptom_label' => 'Daun keriting', 'summary' => 'Bisa terkait hama kutu kebul atau thrips.', 'image_url' => 'https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?auto=format&fit=crop&w=600&q=80', 'is_active' => 1, 'created_at' => now()],
            ['id' => 4, 'commodity_id' => 1, 'code' => 'LAYU', 'name' => 'Tanaman Layu', 'symptom_label' => 'Tanaman layu', 'summary' => 'Periksa air, drainase dan penyakit layu fusarium.', 'image_url' => 'https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80', 'is_active' => 1, 'created_at' => now()],
            ['id' => 5, 'commodity_id' => 1, 'code' => 'BUNGA_RONTOK', 'name' => 'Bunga Rontok', 'symptom_label' => 'Bunga rontok', 'summary' => 'Bisa dipicu stres air atau kekurangan kalsium.', 'image_url' => 'https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?auto=format&fit=crop&w=600&q=80', 'is_active' => 1, 'created_at' => now()],
            ['id' => 6, 'commodity_id' => 2, 'code' => 'TOMAT_LAYU', 'name' => 'Tomat Layu', 'symptom_label' => 'Tomat layu', 'summary' => 'Periksa media dan akar.', 'image_url' => 'https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80', 'is_active' => 1, 'created_at' => now()],
        ]);

        DB::table('problem_solutions')->insert([
            ['id' => 1, 'problem_catalog_id' => 1, 'step_no' => 1, 'action_text' => 'Periksa kelembapan media tanam.', 'created_at' => now()],
            ['id' => 2, 'problem_catalog_id' => 1, 'step_no' => 2, 'action_text' => 'Periksa drainase dan kurangi penyiraman bila terlalu basah.', 'created_at' => now()],
            ['id' => 3, 'problem_catalog_id' => 2, 'step_no' => 1, 'action_text' => 'Periksa bagian bawah daun dan buang hama yang terlihat.', 'created_at' => now()],
            ['id' => 4, 'problem_catalog_id' => 3, 'step_no' => 1, 'action_text' => 'Periksa hama kutu dan semprotkan pestisida nabati.', 'created_at' => now()],
            ['id' => 5, 'problem_catalog_id' => 4, 'step_no' => 1, 'action_text' => 'Periksa kelembapan tanah dan busuk akar.', 'created_at' => now()],
            ['id' => 6, 'problem_catalog_id' => 5, 'step_no' => 1, 'action_text' => 'Jaga penyiraman stabil dan semprot kalsium boron.', 'created_at' => now()],
            ['id' => 7, 'problem_catalog_id' => 6, 'step_no' => 1, 'action_text' => 'Periksa media tomat dan drainase pot.', 'created_at' => now()],
        ]);

        DB::table('project_problems')->insert([
            ['id' => 1, 'cultivation_project_id' => 1, 'problem_catalog_id' => 1, 'reported_by' => 1, 'title' => 'Daun menguning', 'description' => 'Tiga tanaman bagian tepi menguning.', 'status' => 'monitoring', 'detected_at' => '2026-10-22 16:30:00', 'resolved_at' => null, 'photo_url' => 'https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?auto=format&fit=crop&w=600&q=80', 'created_at' => now()],
            ['id' => 2, 'cultivation_project_id' => 1, 'problem_catalog_id' => 2, 'reported_by' => 3, 'title' => 'Daun berlubang', 'description' => 'Beberapa daun berlubang karena ulat.', 'status' => 'resolved', 'detected_at' => '2026-10-15 08:00:00', 'resolved_at' => '2026-10-18 17:00:00', 'photo_url' => 'https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80', 'created_at' => now()],
            ['id' => 3, 'cultivation_project_id' => 3, 'problem_catalog_id' => 6, 'reported_by' => 2, 'title' => 'Tomat layu', 'description' => 'Beberapa tomat layu saat siang terik.', 'status' => 'open', 'detected_at' => '2026-10-26 13:00:00', 'resolved_at' => null, 'photo_url' => 'https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80', 'created_at' => now()],
        ]);

        DB::table('project_problem_actions')->insert([
            ['id' => 1, 'project_problem_id' => 1, 'user_id' => 1, 'action_date' => '2026-10-22 17:00:00', 'action_text' => 'Mengurangi penyiraman dan mengecek drainase lubang polybag.', 'result_status' => 'improved', 'created_at' => now()],
            ['id' => 2, 'project_problem_id' => 2, 'user_id' => 3, 'action_date' => '2026-10-15 09:00:00', 'action_text' => 'Membersihkan hama ulat secara manual dan menyemprot air tembakau.', 'result_status' => 'resolved', 'created_at' => now()],
            ['id' => 3, 'project_problem_id' => 3, 'user_id' => 2, 'action_date' => '2026-10-26 15:00:00', 'action_text' => 'Mengecek kelembapan media tomat dan memindahkan ke tempat sedikit teduh.', 'result_status' => 'done', 'created_at' => now()],
        ]);

        // 18. Expenses, Harvests, Sales
        DB::table('expense_categories')->insert([
            ['id' => 1, 'code' => 'BIBIT', 'name' => 'Bibit & Benih', 'created_at' => now()],
            ['id' => 2, 'code' => 'MEDIA', 'name' => 'Media Tanam', 'created_at' => now()],
            ['id' => 3, 'code' => 'WADAH', 'name' => 'Polybag/Wadah', 'created_at' => now()],
            ['id' => 4, 'code' => 'PUPUK', 'name' => 'Pupuk & Nutrisi', 'created_at' => now()],
            ['id' => 5, 'code' => 'PENGENDALIAN', 'name' => 'Pengendalian Hama', 'created_at' => now()],
            ['id' => 6, 'code' => 'LAINNYA', 'name' => 'Operasional Lainnya', 'created_at' => now()],
        ]);

        DB::table('project_expenses')->insert([
            ['id' => 1, 'cultivation_project_id' => 1, 'expense_category_id' => 1, 'user_id' => 1, 'expense_date' => '2026-09-20', 'description' => 'Benih cabai unggul', 'amount' => 75000, 'created_at' => now()],
            ['id' => 2, 'cultivation_project_id' => 1, 'expense_category_id' => 2, 'user_id' => 1, 'expense_date' => '2026-09-20', 'description' => 'Media tanam subur 5 karung', 'amount' => 150000, 'created_at' => now()],
            ['id' => 3, 'cultivation_project_id' => 1, 'expense_category_id' => 3, 'user_id' => 1, 'expense_date' => '2026-09-20', 'description' => 'Polybag tebal ukuran 40x40', 'amount' => 100000, 'created_at' => now()],
            ['id' => 4, 'cultivation_project_id' => 1, 'expense_category_id' => 4, 'user_id' => 1, 'expense_date' => '2026-10-05', 'description' => 'Pupuk NPK & Kalsium', 'amount' => 150000, 'created_at' => now()],
            ['id' => 5, 'cultivation_project_id' => 2, 'expense_category_id' => 1, 'user_id' => 1, 'expense_date' => '2026-10-20', 'description' => 'Benih cabai siklus kedua', 'amount' => 80000, 'created_at' => now()],
            ['id' => 6, 'cultivation_project_id' => 3, 'expense_category_id' => 1, 'user_id' => 2, 'expense_date' => '2026-10-10', 'description' => 'Benih tomat mawar', 'amount' => 70000, 'created_at' => now()],
            ['id' => 7, 'cultivation_project_id' => 4, 'expense_category_id' => 1, 'user_id' => 1, 'expense_date' => '2026-10-21', 'description' => 'Benih pakcoy nauli f1', 'amount' => 35000, 'created_at' => now()],
            ['id' => 8, 'cultivation_project_id' => 5, 'expense_category_id' => 1, 'user_id' => 1, 'expense_date' => '2026-04-01', 'description' => 'Benih cabai percobaan', 'amount' => 70000, 'created_at' => now()],
        ]);

        DB::table('harvests')->insert([
            ['id' => 1, 'cultivation_project_id' => 5, 'harvest_no' => 1, 'recorded_by' => 1, 'harvest_date' => '2026-06-10', 'weight_kg' => 7.50, 'note' => 'Panen pertama cabai merah segar.', 'photo_url' => 'https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80', 'created_at' => now()],
            ['id' => 2, 'cultivation_project_id' => 5, 'harvest_no' => 2, 'recorded_by' => 1, 'harvest_date' => '2026-06-20', 'weight_kg' => 6.00, 'note' => 'Panen kedua kualitas bagus.', 'photo_url' => 'https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80', 'created_at' => now()],
            ['id' => 3, 'cultivation_project_id' => 5, 'harvest_no' => 3, 'recorded_by' => 1, 'harvest_date' => '2026-06-28', 'weight_kg' => 4.00, 'note' => 'Panen terakhir penutup siklus.', 'photo_url' => 'https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80', 'created_at' => now()],
        ]);

        DB::table('harvest_sales')->insert([
            ['id' => 1, 'cultivation_project_id' => 5, 'harvest_id' => 1, 'sold_by' => 1, 'sale_date' => '2026-06-10', 'buyer_name' => 'Tetangga Komplek', 'qty_kg' => 7.50, 'price_per_kg' => 35000, 'total_amount' => 262500, 'payment_status' => 'paid', 'created_at' => now()],
            ['id' => 2, 'cultivation_project_id' => 5, 'harvest_id' => 2, 'sold_by' => 1, 'sale_date' => '2026-06-20', 'buyer_name' => 'Warung Sayur Bu Siti', 'qty_kg' => 6.00, 'price_per_kg' => 32000, 'total_amount' => 192000, 'payment_status' => 'paid', 'created_at' => now()],
            ['id' => 3, 'cultivation_project_id' => 5, 'harvest_id' => 3, 'sold_by' => 1, 'sale_date' => '2026-06-28', 'buyer_name' => 'Pelanggan Langganan', 'qty_kg' => 4.00, 'price_per_kg' => 30000, 'total_amount' => 120000, 'payment_status' => 'paid', 'created_at' => now()],
        ]);

        // 19. Gamification: Achievements, Streaks, XP
        DB::table('achievements')->insert([
            ['id' => 1, 'code' => 'TANAM_PERTAMA', 'name' => 'Tanam Pertama', 'description' => 'Memulai siklus budidaya pertama.', 'xp_bonus' => 50, 'icon' => 'seed', 'criteria_type' => 'first_project', 'criteria_value' => 1, 'is_active' => 1, 'created_at' => now()],
            ['id' => 2, 'code' => 'RAJIN_MERAWAT', 'name' => 'Rajin Merawat', 'description' => 'Menyelesaikan 10 tugas budidaya.', 'xp_bonus' => 100, 'icon' => 'leaf', 'criteria_type' => 'task_count', 'criteria_value' => 10, 'is_active' => 1, 'created_at' => now()],
            ['id' => 3, 'code' => 'KONSISTEN_7', 'name' => 'Konsisten 7 Hari', 'description' => 'Aktif merawat tanaman 7 hari berturut-turut.', 'xp_bonus' => 100, 'icon' => 'fire', 'criteria_type' => 'streak_days', 'criteria_value' => 7, 'is_active' => 1, 'created_at' => now()],
            ['id' => 4, 'code' => 'DOKTER_TANAMAN', 'name' => 'Dokter Tanaman', 'description' => 'Menyelesaikan masalah pada tanaman.', 'xp_bonus' => 100, 'icon' => 'health', 'criteria_type' => 'problem_resolved', 'criteria_value' => 1, 'is_active' => 1, 'created_at' => now()],
            ['id' => 5, 'code' => 'PANEN_PERTAMA', 'name' => 'Panen Pertama', 'description' => 'Mencatat hasil panen perdana.', 'xp_bonus' => 200, 'icon' => 'harvest', 'criteria_type' => 'first_harvest', 'criteria_value' => 1, 'is_active' => 1, 'created_at' => now()],
        ]);

        DB::table('user_xp_transactions')->insert([
            ['id' => 1, 'user_id' => 1, 'workspace_id' => 1, 'cultivation_project_id' => 1, 'source_type' => 'task', 'source_id' => 1, 'xp_amount' => 10, 'description' => 'Selesai menyiram tanaman', 'created_at' => now()],
            ['id' => 2, 'user_id' => 1, 'workspace_id' => 1, 'cultivation_project_id' => 1, 'source_type' => 'stage', 'source_id' => 1, 'xp_amount' => 100, 'description' => 'Selesai tahap Mulai', 'created_at' => now()],
            ['id' => 3, 'user_id' => 1, 'workspace_id' => 1, 'cultivation_project_id' => 5, 'source_type' => 'achievement', 'source_id' => 1, 'xp_amount' => 50, 'description' => 'Badge Tanam Pertama', 'created_at' => now()],
            ['id' => 4, 'user_id' => 1, 'workspace_id' => 1, 'cultivation_project_id' => 5, 'source_type' => 'harvest', 'source_id' => 1, 'xp_amount' => 200, 'description' => 'Panen pertama berhasil', 'created_at' => now()],
            ['id' => 5, 'user_id' => 2, 'workspace_id' => 2, 'cultivation_project_id' => 3, 'source_type' => 'achievement', 'source_id' => 1, 'xp_amount' => 50, 'description' => 'Badge Tanam Pertama', 'created_at' => now()],
            ['id' => 6, 'user_id' => 3, 'workspace_id' => 1, 'cultivation_project_id' => 1, 'source_type' => 'problem', 'source_id' => 2, 'xp_amount' => 50, 'description' => 'Membantu menyelesaikan masalah', 'created_at' => now()],
        ]);

        DB::table('user_achievements')->insert([
            ['id' => 1, 'user_id' => 1, 'workspace_id' => 1, 'achievement_id' => 1, 'cultivation_project_id' => 5, 'unlocked_at' => '2026-04-01 08:00:00'],
            ['id' => 2, 'user_id' => 1, 'workspace_id' => 1, 'achievement_id' => 5, 'cultivation_project_id' => 5, 'unlocked_at' => '2026-06-10 10:00:00'],
            ['id' => 3, 'user_id' => 1, 'workspace_id' => 1, 'achievement_id' => 3, 'cultivation_project_id' => 1, 'unlocked_at' => '2026-10-10 08:00:00'],
            ['id' => 4, 'user_id' => 2, 'workspace_id' => 2, 'achievement_id' => 1, 'cultivation_project_id' => 3, 'unlocked_at' => '2026-10-10 08:05:00'],
            ['id' => 5, 'user_id' => 3, 'workspace_id' => 1, 'achievement_id' => 4, 'cultivation_project_id' => 1, 'unlocked_at' => '2026-10-18 17:10:00'],
        ]);

        DB::table('user_streaks')->insert([
            ['id' => 1, 'user_id' => 1, 'workspace_id' => 1, 'current_streak_days' => 12, 'longest_streak_days' => 24, 'last_activity_date' => '2026-10-27', 'updated_at' => now()],
            ['id' => 2, 'user_id' => 2, 'workspace_id' => 2, 'current_streak_days' => 8, 'longest_streak_days' => 8, 'last_activity_date' => '2026-10-27', 'updated_at' => now()],
            ['id' => 3, 'user_id' => 3, 'workspace_id' => 1, 'current_streak_days' => 3, 'longest_streak_days' => 7, 'last_activity_date' => '2026-10-26', 'updated_at' => now()],
        ]);

        DB::table('notifications')->insert([
            ['id' => 1, 'user_id' => 1, 'workspace_id' => 1, 'title' => 'Waktunya cek daun', 'body' => 'Periksa kondisi daun Cabai Rawit #001 sore ini.', 'type' => 'task_reminder', 'data' => json_encode(['project_id' => 1, 'task_id' => 2]), 'status' => 'sent', 'created_at' => now(), 'sent_at' => '2026-10-27 15:50:00', 'read_at' => null],
            ['id' => 2, 'user_id' => 1, 'workspace_id' => 1, 'title' => 'Streak 12 hari', 'body' => 'Anda aktif merawat tanaman selama 12 hari berturut-turut! 🔥', 'type' => 'streak', 'data' => json_encode(['streak' => 12]), 'status' => 'read', 'created_at' => now(), 'sent_at' => '2026-10-27 08:00:00', 'read_at' => '2026-10-27 08:10:00'],
            ['id' => 3, 'user_id' => 2, 'workspace_id' => 2, 'title' => 'Foto perkembangan', 'body' => 'Jangan lupa catat perkembangan Tomat #001.', 'type' => 'reminder', 'data' => json_encode(['project_id' => 3]), 'status' => 'queued', 'created_at' => now(), 'sent_at' => null, 'read_at' => null],
        ]);
    }
}
