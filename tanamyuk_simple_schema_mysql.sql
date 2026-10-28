-- TanamYuk Simple SaaS Schema - MySQL 8+
SET NAMES utf8mb4;
SET time_zone = '+07:00';
SET FOREIGN_KEY_CHECKS=0;
CREATE DATABASE IF NOT EXISTS tanamyuk CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tanamyuk;

DROP VIEW IF EXISTS v_dashboard_projects;
DROP VIEW IF EXISTS v_project_results;
DROP VIEW IF EXISTS v_user_gamification;

DROP TABLE IF EXISTS notifications;
DROP TABLE IF EXISTS reminders;
DROP TABLE IF EXISTS user_streaks;
DROP TABLE IF EXISTS user_achievements;
DROP TABLE IF EXISTS user_xp_transactions;
DROP TABLE IF EXISTS achievements;
DROP TABLE IF EXISTS harvest_sales;
DROP TABLE IF EXISTS harvests;
DROP TABLE IF EXISTS project_expenses;
DROP TABLE IF EXISTS expense_categories;
DROP TABLE IF EXISTS project_problem_actions;
DROP TABLE IF EXISTS project_problems;
DROP TABLE IF EXISTS problem_solutions;
DROP TABLE IF EXISTS problem_catalog;
DROP TABLE IF EXISTS project_photos;
DROP TABLE IF EXISTS project_notes;
DROP TABLE IF EXISTS project_tasks;
DROP TABLE IF EXISTS project_stage_progress;
DROP TABLE IF EXISTS project_members;
DROP TABLE IF EXISTS cultivation_projects;
DROP TABLE IF EXISTS stage_tasks;
DROP TABLE IF EXISTS program_stages;
DROP TABLE IF EXISTS cultivation_programs;
DROP TABLE IF EXISTS workspace_commodity_access;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS commodity_products;
DROP TABLE IF EXISTS commodities;
DROP TABLE IF EXISTS user_preferences;
DROP TABLE IF EXISTS workspace_members;
DROP TABLE IF EXISTS workspaces;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(120) NOT NULL,
 email VARCHAR(190) NOT NULL UNIQUE,
 phone VARCHAR(30),
 password VARCHAR(255) NOT NULL,
 avatar_url VARCHAR(500),
 status ENUM('active','inactive','suspended') NOT NULL DEFAULT 'active',
 email_verified_at DATETIME NULL,
 last_login_at DATETIME NULL,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE workspaces (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 owner_user_id BIGINT UNSIGNED NOT NULL,
 name VARCHAR(150) NOT NULL,
 slug VARCHAR(160) NOT NULL UNIQUE,
 type ENUM('personal','family','farmer_group','business') NOT NULL DEFAULT 'personal',
 timezone VARCHAR(50) NOT NULL DEFAULT 'Asia/Jakarta',
 currency CHAR(3) NOT NULL DEFAULT 'IDR',
 status ENUM('active','inactive','suspended') NOT NULL DEFAULT 'active',
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY(owner_user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE workspace_members (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 workspace_id BIGINT UNSIGNED NOT NULL,
 user_id BIGINT UNSIGNED NOT NULL,
 role ENUM('owner','admin','member','viewer') NOT NULL DEFAULT 'member',
 status ENUM('invited','active','inactive') NOT NULL DEFAULT 'active',
 joined_at DATETIME,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_workspace_user(workspace_id,user_id),
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE user_preferences (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL UNIQUE,
 language VARCHAR(10) NOT NULL DEFAULT 'id',
 theme ENUM('light','dark','system') NOT NULL DEFAULT 'light',
 push_enabled TINYINT(1) NOT NULL DEFAULT 1,
 email_enabled TINYINT(1) NOT NULL DEFAULT 1,
 whatsapp_enabled TINYINT(1) NOT NULL DEFAULT 0,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE commodities (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 code VARCHAR(30) NOT NULL UNIQUE,
 name VARCHAR(100) NOT NULL,
 category VARCHAR(100),
 description VARCHAR(500),
 image_url VARCHAR(500),
 default_duration_days INT UNSIGNED,
 is_active TINYINT(1) NOT NULL DEFAULT 1,
 sort_order INT NOT NULL DEFAULT 0,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE commodity_products (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 commodity_id BIGINT UNSIGNED NOT NULL,
 code VARCHAR(60) NOT NULL UNIQUE,
 name VARCHAR(180) NOT NULL,
 price DECIMAL(15,2) NOT NULL,
 access_type ENUM('lifetime','subscription') NOT NULL DEFAULT 'lifetime',
 description VARCHAR(700),
 is_active TINYINT(1) NOT NULL DEFAULT 1,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY(commodity_id) REFERENCES commodities(id)
) ENGINE=InnoDB;

CREATE TABLE orders (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 workspace_id BIGINT UNSIGNED NOT NULL,
 user_id BIGINT UNSIGNED NOT NULL,
 order_no VARCHAR(50) NOT NULL UNIQUE,
 subtotal DECIMAL(15,2) NOT NULL DEFAULT 0,
 discount_amount DECIMAL(15,2) NOT NULL DEFAULT 0,
 total_amount DECIMAL(15,2) NOT NULL DEFAULT 0,
 status ENUM('pending','paid','expired','cancelled','refunded') NOT NULL DEFAULT 'pending',
 ordered_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 paid_at DATETIME NULL,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE order_items (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 order_id BIGINT UNSIGNED NOT NULL,
 commodity_product_id BIGINT UNSIGNED NOT NULL,
 product_name VARCHAR(180) NOT NULL,
 qty INT UNSIGNED NOT NULL DEFAULT 1,
 unit_price DECIMAL(15,2) NOT NULL,
 total_price DECIMAL(15,2) NOT NULL,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(order_id) REFERENCES orders(id),
 FOREIGN KEY(commodity_product_id) REFERENCES commodity_products(id)
) ENGINE=InnoDB;

CREATE TABLE payments (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 order_id BIGINT UNSIGNED NOT NULL,
 provider VARCHAR(50) NOT NULL,
 provider_reference VARCHAR(120),
 payment_method VARCHAR(80),
 amount DECIMAL(15,2) NOT NULL,
 status ENUM('pending','paid','failed','expired','refunded') NOT NULL DEFAULT 'pending',
 paid_at DATETIME NULL,
 raw_response JSON,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(order_id) REFERENCES orders(id)
) ENGINE=InnoDB;

CREATE TABLE workspace_commodity_access (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 workspace_id BIGINT UNSIGNED NOT NULL,
 commodity_id BIGINT UNSIGNED NOT NULL,
 commodity_product_id BIGINT UNSIGNED NULL,
 source_order_item_id BIGINT UNSIGNED NULL,
 access_type ENUM('lifetime','subscription','trial','admin_grant') NOT NULL DEFAULT 'lifetime',
 starts_at DATETIME NOT NULL,
 ends_at DATETIME NULL,
 status ENUM('active','expired','revoked') NOT NULL DEFAULT 'active',
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_workspace_commodity(workspace_id,commodity_id),
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id),
 FOREIGN KEY(commodity_id) REFERENCES commodities(id),
 FOREIGN KEY(commodity_product_id) REFERENCES commodity_products(id),
 FOREIGN KEY(source_order_item_id) REFERENCES order_items(id)
) ENGINE=InnoDB;

CREATE TABLE cultivation_programs (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 commodity_id BIGINT UNSIGNED NOT NULL,
 code VARCHAR(70) NOT NULL UNIQUE,
 name VARCHAR(180) NOT NULL,
 duration_days INT UNSIGNED NOT NULL,
 description VARCHAR(700),
 cover_image_url VARCHAR(500),
 is_published TINYINT(1) NOT NULL DEFAULT 1,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY(commodity_id) REFERENCES commodities(id)
) ENGINE=InnoDB;

CREATE TABLE program_stages (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_program_id BIGINT UNSIGNED NOT NULL,
 stage_no INT UNSIGNED NOT NULL,
 code VARCHAR(50) NOT NULL,
 name VARCHAR(100) NOT NULL,
 start_day INT UNSIGNED NOT NULL,
 end_day INT UNSIGNED NOT NULL,
 description VARCHAR(700),
 xp_reward INT UNSIGNED NOT NULL DEFAULT 0,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_program_stage_no(cultivation_program_id,stage_no),
 FOREIGN KEY(cultivation_program_id) REFERENCES cultivation_programs(id)
) ENGINE=InnoDB;

CREATE TABLE stage_tasks (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 program_stage_id BIGINT UNSIGNED NOT NULL,
 code VARCHAR(70) NOT NULL,
 title VARCHAR(180) NOT NULL,
 short_instruction VARCHAR(500),
 task_type ENUM('watering','fertilizing','inspection','weeding','photo','planting','harvest','other') NOT NULL DEFAULT 'other',
 recurrence_type ENUM('once','daily','weekly','interval') NOT NULL DEFAULT 'once',
 recurrence_interval INT UNSIGNED NULL,
 default_time TIME NULL,
 xp_reward INT UNSIGNED NOT NULL DEFAULT 10,
 is_required TINYINT(1) NOT NULL DEFAULT 1,
 sort_order INT NOT NULL DEFAULT 0,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_stage_task_code(program_stage_id,code),
 FOREIGN KEY(program_stage_id) REFERENCES program_stages(id)
) ENGINE=InnoDB;

CREATE TABLE cultivation_projects (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 workspace_id BIGINT UNSIGNED NOT NULL,
 cultivation_program_id BIGINT UNSIGNED NOT NULL,
 created_by BIGINT UNSIGNED NOT NULL,
 project_code VARCHAR(60) NOT NULL UNIQUE,
 name VARCHAR(180) NOT NULL,
 cycle_no INT UNSIGNED NOT NULL DEFAULT 1,
 location_name VARCHAR(180),
 initial_plant_count INT UNSIGNED NOT NULL DEFAULT 0,
 current_plant_count INT UNSIGNED NOT NULL DEFAULT 0,
 start_date DATE NOT NULL,
 estimated_harvest_date DATE NULL,
 actual_end_date DATE NULL,
 status ENUM('draft','active','paused','completed','cancelled') NOT NULL DEFAULT 'active',
 target_yield_kg DECIMAL(12,2) NULL,
 notes VARCHAR(1000),
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY idx_projects_workspace_status(workspace_id,status),
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id),
 FOREIGN KEY(cultivation_program_id) REFERENCES cultivation_programs(id),
 FOREIGN KEY(created_by) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE project_members (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 user_id BIGINT UNSIGNED NOT NULL,
 role ENUM('manager','member','viewer') NOT NULL DEFAULT 'member',
 joined_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_project_member(cultivation_project_id,user_id),
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE project_stage_progress (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 program_stage_id BIGINT UNSIGNED NOT NULL,
 status ENUM('locked','active','completed','skipped') NOT NULL DEFAULT 'locked',
 completion_percent DECIMAL(5,2) NOT NULL DEFAULT 0,
 started_at DATETIME NULL,
 completed_at DATETIME NULL,
 xp_earned INT UNSIGNED NOT NULL DEFAULT 0,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_project_stage(cultivation_project_id,program_stage_id),
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(program_stage_id) REFERENCES program_stages(id)
) ENGINE=InnoDB;

CREATE TABLE project_tasks (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 stage_task_id BIGINT UNSIGNED NULL,
 assigned_to BIGINT UNSIGNED NULL,
 title VARCHAR(180) NOT NULL,
 instruction VARCHAR(500),
 task_type ENUM('watering','fertilizing','inspection','weeding','photo','planting','harvest','other') NOT NULL DEFAULT 'other',
 due_at DATETIME NULL,
 status ENUM('pending','done','skipped','overdue') NOT NULL DEFAULT 'pending',
 xp_reward INT UNSIGNED NOT NULL DEFAULT 0,
 completed_at DATETIME NULL,
 completed_by BIGINT UNSIGNED NULL,
 source ENUM('system','manual') NOT NULL DEFAULT 'system',
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 KEY idx_project_tasks_today(cultivation_project_id,status,due_at),
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(stage_task_id) REFERENCES stage_tasks(id),
 FOREIGN KEY(assigned_to) REFERENCES users(id),
 FOREIGN KEY(completed_by) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE reminders (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 workspace_id BIGINT UNSIGNED NOT NULL,
 cultivation_project_id BIGINT UNSIGNED NULL,
 project_task_id BIGINT UNSIGNED NULL,
 user_id BIGINT UNSIGNED NOT NULL,
 title VARCHAR(180) NOT NULL,
 remind_at DATETIME NOT NULL,
 channel ENUM('in_app','push','email','whatsapp') NOT NULL DEFAULT 'push',
 is_enabled TINYINT(1) NOT NULL DEFAULT 1,
 sent_at DATETIME NULL,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id),
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(project_task_id) REFERENCES project_tasks(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE project_notes (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 user_id BIGINT UNSIGNED NOT NULL,
 note_date DATE NOT NULL,
 condition_status ENUM('good','normal','attention') NOT NULL DEFAULT 'normal',
 note_text TEXT NULL,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE project_photos (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 project_note_id BIGINT UNSIGNED NULL,
 user_id BIGINT UNSIGNED NOT NULL,
 photo_date DATE NOT NULL,
 file_url VARCHAR(500) NOT NULL,
 caption VARCHAR(500),
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(project_note_id) REFERENCES project_notes(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE problem_catalog (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 commodity_id BIGINT UNSIGNED NOT NULL,
 code VARCHAR(60) NOT NULL,
 name VARCHAR(160) NOT NULL,
 symptom_label VARCHAR(180) NOT NULL,
 summary VARCHAR(700),
 image_url VARCHAR(500),
 is_active TINYINT(1) NOT NULL DEFAULT 1,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_problem_catalog_code(commodity_id,code),
 FOREIGN KEY(commodity_id) REFERENCES commodities(id)
) ENGINE=InnoDB;

CREATE TABLE problem_solutions (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 problem_catalog_id BIGINT UNSIGNED NOT NULL,
 step_no INT UNSIGNED NOT NULL,
 action_text VARCHAR(700) NOT NULL,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_problem_solution_step(problem_catalog_id,step_no),
 FOREIGN KEY(problem_catalog_id) REFERENCES problem_catalog(id)
) ENGINE=InnoDB;

CREATE TABLE project_problems (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 problem_catalog_id BIGINT UNSIGNED NULL,
 reported_by BIGINT UNSIGNED NOT NULL,
 title VARCHAR(180) NOT NULL,
 description VARCHAR(1000),
 status ENUM('open','monitoring','resolved') NOT NULL DEFAULT 'open',
 detected_at DATETIME NOT NULL,
 resolved_at DATETIME NULL,
 photo_url VARCHAR(500),
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(problem_catalog_id) REFERENCES problem_catalog(id),
 FOREIGN KEY(reported_by) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE project_problem_actions (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 project_problem_id BIGINT UNSIGNED NOT NULL,
 user_id BIGINT UNSIGNED NOT NULL,
 action_date DATETIME NOT NULL,
 action_text VARCHAR(700) NOT NULL,
 result_status ENUM('done','improved','no_change','resolved') NOT NULL DEFAULT 'done',
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(project_problem_id) REFERENCES project_problems(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE expense_categories (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 code VARCHAR(50) NOT NULL UNIQUE,
 name VARCHAR(120) NOT NULL,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE project_expenses (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 expense_category_id BIGINT UNSIGNED NOT NULL,
 user_id BIGINT UNSIGNED NOT NULL,
 expense_date DATE NOT NULL,
 description VARCHAR(250) NOT NULL,
 amount DECIMAL(15,2) NOT NULL,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(expense_category_id) REFERENCES expense_categories(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE harvests (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 harvest_no INT UNSIGNED NOT NULL,
 recorded_by BIGINT UNSIGNED NOT NULL,
 harvest_date DATE NOT NULL,
 weight_kg DECIMAL(12,2) NOT NULL DEFAULT 0,
 note VARCHAR(500),
 photo_url VARCHAR(500),
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_project_harvest(cultivation_project_id,harvest_no),
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(recorded_by) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE harvest_sales (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 cultivation_project_id BIGINT UNSIGNED NOT NULL,
 harvest_id BIGINT UNSIGNED NULL,
 sold_by BIGINT UNSIGNED NOT NULL,
 sale_date DATE NOT NULL,
 buyer_name VARCHAR(180),
 qty_kg DECIMAL(12,2) NOT NULL,
 price_per_kg DECIMAL(15,2) NOT NULL,
 total_amount DECIMAL(15,2) NOT NULL,
 payment_status ENUM('unpaid','partial','paid') NOT NULL DEFAULT 'paid',
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id),
 FOREIGN KEY(harvest_id) REFERENCES harvests(id),
 FOREIGN KEY(sold_by) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE achievements (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 code VARCHAR(60) NOT NULL UNIQUE,
 name VARCHAR(140) NOT NULL,
 description VARCHAR(500) NOT NULL,
 xp_bonus INT UNSIGNED NOT NULL DEFAULT 0,
 icon VARCHAR(150),
 criteria_type ENUM('first_project','task_count','streak_days','problem_resolved','first_harvest','cycle_complete','custom') NOT NULL,
 criteria_value DECIMAL(12,2),
 is_active TINYINT(1) NOT NULL DEFAULT 1,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE user_xp_transactions (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL,
 workspace_id BIGINT UNSIGNED NOT NULL,
 cultivation_project_id BIGINT UNSIGNED NULL,
 source_type ENUM('task','stage','achievement','problem','harvest','streak','manual') NOT NULL,
 source_id BIGINT UNSIGNED NULL,
 xp_amount INT NOT NULL,
 description VARCHAR(250),
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(user_id) REFERENCES users(id),
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id),
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id)
) ENGINE=InnoDB;

CREATE TABLE user_achievements (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL,
 workspace_id BIGINT UNSIGNED NOT NULL,
 achievement_id BIGINT UNSIGNED NOT NULL,
 cultivation_project_id BIGINT UNSIGNED NULL,
 unlocked_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY uq_user_achievement(user_id,workspace_id,achievement_id),
 FOREIGN KEY(user_id) REFERENCES users(id),
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id),
 FOREIGN KEY(achievement_id) REFERENCES achievements(id),
 FOREIGN KEY(cultivation_project_id) REFERENCES cultivation_projects(id)
) ENGINE=InnoDB;

CREATE TABLE user_streaks (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL,
 workspace_id BIGINT UNSIGNED NOT NULL,
 current_streak_days INT UNSIGNED NOT NULL DEFAULT 0,
 longest_streak_days INT UNSIGNED NOT NULL DEFAULT 0,
 last_activity_date DATE NULL,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 UNIQUE KEY uq_user_workspace_streak(user_id,workspace_id),
 FOREIGN KEY(user_id) REFERENCES users(id),
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id)
) ENGINE=InnoDB;

CREATE TABLE notifications (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NOT NULL,
 workspace_id BIGINT UNSIGNED NOT NULL,
 title VARCHAR(180) NOT NULL,
 body VARCHAR(700) NOT NULL,
 type VARCHAR(80) NOT NULL,
 data JSON NULL,
 status ENUM('queued','sent','read','failed') NOT NULL DEFAULT 'queued',
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 sent_at DATETIME NULL,
 read_at DATETIME NULL,
 FOREIGN KEY(user_id) REFERENCES users(id),
 FOREIGN KEY(workspace_id) REFERENCES workspaces(id)
) ENGINE=InnoDB;

-- DUMMY DATA
INSERT INTO users(id,name,email,phone,password,avatar_url,status,email_verified_at,last_login_at) VALUES
(1,'Robbi','robbi@tanamyuk.test','081234567890','$2y$12$dummy.robbi','https://cdn.tanamyuk.test/avatar/robbi.jpg','active','2026-09-01 08:00:00','2026-10-27 22:00:00'),
(2,'Sari','sari@tanamyuk.test','081234567891','$2y$12$dummy.sari','https://cdn.tanamyuk.test/avatar/sari.jpg','active','2026-09-02 08:00:00','2026-10-27 20:00:00'),
(3,'Budi','budi@tanamyuk.test','081234567892','$2y$12$dummy.budi',NULL,'active','2026-09-03 08:00:00','2026-10-26 17:00:00');

INSERT INTO workspaces(id,owner_user_id,name,slug,type,timezone,currency,status) VALUES
(1,1,'Kebun Robbi','kebun-robbi','personal','Asia/Jakarta','IDR','active'),
(2,2,'Kebun Keluarga Sari','kebun-sari','family','Asia/Jakarta','IDR','active');

INSERT INTO workspace_members(id,workspace_id,user_id,role,status,joined_at) VALUES
(1,1,1,'owner','active','2026-09-01 08:00:00'),
(2,1,3,'member','active','2026-09-05 08:00:00'),
(3,2,2,'owner','active','2026-09-02 08:00:00');

INSERT INTO user_preferences(id,user_id,language,theme,push_enabled,email_enabled,whatsapp_enabled) VALUES
(1,1,'id','light',1,1,1),(2,2,'id','system',1,1,0),(3,3,'id','dark',1,0,0);

INSERT INTO commodities(id,code,name,category,description,image_url,default_duration_days,is_active,sort_order) VALUES
(1,'CABAI','Cabai','Sayur Buah','Budidaya cabai dari mulai sampai panen.','https://cdn.tanamyuk.test/commodity/cabai.jpg',90,1,1),
(2,'TOMAT','Tomat','Sayur Buah','Budidaya tomat untuk lahan terbatas.','https://cdn.tanamyuk.test/commodity/tomat.jpg',90,1,2),
(3,'PAKCOY','Pakcoy','Sayur Daun','Budidaya pakcoy sederhana.','https://cdn.tanamyuk.test/commodity/pakcoy.jpg',45,1,3);

INSERT INTO commodity_products(id,commodity_id,code,name,price,access_type,description,is_active) VALUES
(1,1,'CABAI-149','Program Budidaya Cabai',149000,'lifetime','Akses Cabai selamanya dan banyak siklus.',1),
(2,2,'TOMAT-149','Program Budidaya Tomat',149000,'lifetime','Akses Tomat selamanya.',1),
(3,3,'PAKCOY-99','Program Budidaya Pakcoy',99000,'lifetime','Akses Pakcoy selamanya.',1);

INSERT INTO orders(id,workspace_id,user_id,order_no,subtotal,discount_amount,total_amount,status,ordered_at,paid_at) VALUES
(1,1,1,'TY-20261001-0001',149000,0,149000,'paid','2026-10-01 09:00:00','2026-10-01 09:02:00'),
(2,2,2,'TY-20261002-0002',149000,0,149000,'paid','2026-10-02 10:00:00','2026-10-02 10:04:00'),
(3,1,1,'TY-20261020-0003',99000,0,99000,'pending','2026-10-20 10:00:00',NULL);

INSERT INTO order_items(id,order_id,commodity_product_id,product_name,qty,unit_price,total_price) VALUES
(1,1,1,'Program Budidaya Cabai',1,149000,149000),(2,2,2,'Program Budidaya Tomat',1,149000,149000),(3,3,3,'Program Budidaya Pakcoy',1,99000,99000);

INSERT INTO payments(id,order_id,provider,provider_reference,payment_method,amount,status,paid_at,raw_response) VALUES
(1,1,'midtrans','MID-TY-001','QRIS',149000,'paid','2026-10-01 09:02:00','{"transaction_status":"settlement"}'),
(2,2,'midtrans','MID-TY-002','VA_BCA',149000,'paid','2026-10-02 10:04:00','{"transaction_status":"settlement"}'),
(3,3,'midtrans','MID-TY-003','QRIS',99000,'pending',NULL,'{"transaction_status":"pending"}');

INSERT INTO workspace_commodity_access(id,workspace_id,commodity_id,commodity_product_id,source_order_item_id,access_type,starts_at,ends_at,status) VALUES
(1,1,1,1,1,'lifetime','2026-10-01 09:02:00',NULL,'active'),
(2,2,2,2,2,'lifetime','2026-10-02 10:04:00',NULL,'active'),
(3,1,3,3,NULL,'trial','2026-10-20 10:00:00','2026-10-27 23:59:59','active');

INSERT INTO cultivation_programs(id,commodity_id,code,name,duration_days,description,cover_image_url,is_published) VALUES
(1,1,'CABAI-SIMPLE-V1','Budidaya Cabai',90,'Mulai, Tanam, Rawat, Berbuah, Panen.','https://cdn.tanamyuk.test/program/cabai.jpg',1),
(2,2,'TOMAT-SIMPLE-V1','Budidaya Tomat',90,'Program sederhana Tomat.','https://cdn.tanamyuk.test/program/tomat.jpg',1),
(3,3,'PAKCOY-SIMPLE-V1','Budidaya Pakcoy',45,'Program sederhana Pakcoy.','https://cdn.tanamyuk.test/program/pakcoy.jpg',1);

INSERT INTO program_stages(id,cultivation_program_id,stage_no,code,name,start_day,end_day,description,xp_reward) VALUES
(1,1,1,'MULAI','Mulai',1,7,'Persiapan dan persemaian.',100),
(2,1,2,'TANAM','Tanam',8,14,'Pindah tanam.',100),
(3,1,3,'RAWAT','Rawat',15,45,'Perawatan rutin.',250),
(4,1,4,'BERBUAH','Berbuah',46,70,'Pembungaan dan buah.',250),
(5,1,5,'PANEN','Panen',71,90,'Panen dan pasca panen.',500),
(6,2,1,'MULAI','Mulai',1,7,'Persiapan tomat.',100),
(7,3,1,'MULAI','Mulai',1,5,'Persiapan pakcoy.',80);

INSERT INTO stage_tasks(id,program_stage_id,code,title,short_instruction,task_type,recurrence_type,recurrence_interval,default_time,xp_reward,is_required,sort_order) VALUES
(1,1,'SIAPKAN_MEDIA','Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','once',NULL,'08:00:00',20,1,1),
(2,2,'PINDAH_TANAM','Pindah tanam','Pindahkan bibit sehat.','planting','once',NULL,'16:00:00',50,1,1),
(3,3,'SIRAM','Siram tanaman','Jaga kelembapan media.','watering','daily',1,'07:00:00',10,1,1),
(4,3,'CEK_DAUN','Periksa kondisi daun','Cek warna daun dan hama.','inspection','daily',1,'16:00:00',10,1,2),
(5,3,'PUPUK','Beri pupuk','Gunakan pupuk sesuai dosis.','fertilizing','interval',7,'07:00:00',20,1,3),
(6,3,'FOTO','Catat perkembangan','Ambil foto tanaman.','photo','weekly',1,'09:00:00',20,0,4),
(7,4,'CEK_BUNGA','Periksa bunga dan buah','Pantau bunga dan buah.','inspection','interval',3,'07:00:00',15,1,1),
(8,5,'CATAT_PANEN','Catat panen','Timbang hasil panen.','harvest','once',NULL,'08:00:00',100,1,1),
(9,6,'TOMAT_MEDIA','Siapkan media tomat','Siapkan media tanam.','other','once',NULL,'08:00:00',20,1,1),
(10,7,'PAKCOY_MEDIA','Siapkan media pakcoy','Siapkan media tanam.','other','once',NULL,'08:00:00',20,1,1);

INSERT INTO cultivation_projects(id,workspace_id,cultivation_program_id,created_by,project_code,name,cycle_no,location_name,initial_plant_count,current_plant_count,start_date,estimated_harvest_date,actual_end_date,status,target_yield_kg,notes) VALUES
(1,1,1,1,'CABAI-001','Cabai Rawit #001',1,'Pekarangan Rumah',50,47,'2026-09-20','2026-12-18',NULL,'active',25,'Siklus aktif utama.'),
(2,1,1,1,'CABAI-002','Cabai Rawit #002',2,'Samping Rumah',30,30,'2026-10-20','2027-01-17',NULL,'active',15,'Siklus cabai kedua.'),
(3,2,2,2,'TOMAT-001','Tomat #001',1,'Halaman Belakang',20,20,'2026-10-10','2027-01-07',NULL,'active',30,'Siklus tomat.'),
(4,1,3,1,'PAKCOY-001','Pakcoy #001',1,'Teras Rumah',24,24,'2026-10-21','2026-12-04',NULL,'active',6,'Trial pakcoy.'),
(5,1,1,1,'CABAI-000','Cabai Rawit Percobaan',0,'Pekarangan Rumah',40,35,'2026-04-01','2026-06-29','2026-06-28','completed',18,'Riwayat siklus selesai.');

INSERT INTO project_members(id,cultivation_project_id,user_id,role,joined_at) VALUES
(1,1,1,'manager','2026-09-20 08:00:00'),(2,1,3,'member','2026-09-20 08:10:00'),(3,2,1,'manager','2026-10-20 08:00:00'),
(4,3,2,'manager','2026-10-10 08:00:00'),(5,4,1,'manager','2026-10-21 08:00:00'),(6,5,1,'manager','2026-04-01 08:00:00');

INSERT INTO project_stage_progress(id,cultivation_project_id,program_stage_id,status,completion_percent,started_at,completed_at,xp_earned) VALUES
(1,1,1,'completed',100,'2026-09-20 08:00:00','2026-09-26 18:00:00',100),
(2,1,2,'completed',100,'2026-09-27 08:00:00','2026-10-03 18:00:00',100),
(3,1,3,'active',60,'2026-10-04 08:00:00',NULL,120),
(4,1,4,'locked',0,NULL,NULL,0),(5,1,5,'locked',0,NULL,NULL,0),
(6,2,1,'completed',100,'2026-10-20 08:00:00','2026-10-26 18:00:00',100),
(7,3,6,'completed',100,'2026-10-10 08:00:00','2026-10-16 18:00:00',100),
(8,4,7,'active',75,'2026-10-21 08:00:00',NULL,50),
(9,5,5,'completed',100,'2026-06-10 08:00:00','2026-06-28 18:00:00',500);

INSERT INTO project_tasks(id,cultivation_project_id,stage_task_id,assigned_to,title,instruction,task_type,due_at,status,xp_reward,completed_at,completed_by,source) VALUES
(1,1,3,1,'Siram tanaman','Jaga kelembapan media.','watering','2026-10-27 07:00:00','done',10,'2026-10-27 07:05:00',1,'system'),
(2,1,4,1,'Periksa kondisi daun','Cek warna daun dan hama.','inspection','2026-10-27 16:00:00','pending',10,NULL,NULL,'system'),
(3,1,5,1,'Beri pupuk','Gunakan pupuk sesuai dosis.','fertilizing','2026-10-27 08:00:00','pending',20,NULL,NULL,'system'),
(4,2,3,1,'Siram bibit','Jaga kelembapan media.','watering','2026-10-27 07:00:00','done',10,'2026-10-27 07:10:00',1,'system'),
(5,3,9,2,'Siapkan media tomat','Siapkan media tanam.','other','2026-10-10 08:00:00','done',20,'2026-10-10 09:00:00',2,'system'),
(6,4,10,1,'Siapkan media pakcoy','Siapkan media tanam.','other','2026-10-21 08:00:00','done',20,'2026-10-21 08:45:00',1,'system'),
(7,5,8,1,'Catat panen terakhir','Timbang hasil panen.','harvest','2026-06-28 08:00:00','done',100,'2026-06-28 08:30:00',1,'system');

INSERT INTO reminders(id,workspace_id,cultivation_project_id,project_task_id,user_id,title,remind_at,channel,is_enabled,sent_at) VALUES
(1,1,1,2,1,'Periksa kondisi daun','2026-10-27 15:55:00','push',1,NULL),
(2,1,1,3,1,'Beri pupuk Cabai Rawit #001','2026-10-27 07:55:00','push',1,'2026-10-27 07:55:00'),
(3,2,3,NULL,2,'Foto perkembangan tomat','2026-10-28 09:00:00','in_app',1,NULL);

INSERT INTO project_notes(id,cultivation_project_id,user_id,note_date,condition_status,note_text) VALUES
(1,1,1,'2026-10-27','good','Tanaman sehat, beberapa mulai menunjukkan calon bunga.'),
(2,2,1,'2026-10-26','good','Bibit cabai mulai tumbuh merata.'),
(3,3,2,'2026-10-20','normal','Tomat tumbuh baik.'),
(4,4,1,'2026-10-26','good','Pakcoy mulai membentuk daun baru.'),
(5,5,1,'2026-06-28','good','Siklus selesai dan panen dicatat.');

INSERT INTO project_photos(id,cultivation_project_id,project_note_id,user_id,photo_date,file_url,caption) VALUES
(1,1,1,1,'2026-10-27','https://cdn.tanamyuk.test/project/1/day38.jpg','Cabai hari ke-38.'),
(2,2,2,1,'2026-10-26','https://cdn.tanamyuk.test/project/2/day7.jpg','Cabai siklus kedua.'),
(3,3,3,2,'2026-10-20','https://cdn.tanamyuk.test/project/3/day11.jpg','Tomat berkembang baik.'),
(4,4,4,1,'2026-10-26','https://cdn.tanamyuk.test/project/4/day6.jpg','Pakcoy hari ke-6.'),
(5,5,5,1,'2026-06-28','https://cdn.tanamyuk.test/project/5/final.jpg','Dokumentasi akhir.');

INSERT INTO problem_catalog(id,commodity_id,code,name,symptom_label,summary,image_url,is_active) VALUES
(1,1,'DAUN_KUNING','Daun Menguning','Daun menguning','Terkait nutrisi, air atau akar.','https://cdn.tanamyuk.test/problem/daun-kuning.jpg',1),
(2,1,'DAUN_LUBANG','Daun Berlubang','Daun berlubang','Umumnya akibat hama.','https://cdn.tanamyuk.test/problem/daun-lubang.jpg',1),
(3,1,'DAUN_KERITING','Daun Keriting','Daun keriting','Bisa terkait hama atau cuaca.','https://cdn.tanamyuk.test/problem/daun-keriting.jpg',1),
(4,1,'LAYU','Tanaman Layu','Tanaman layu','Periksa air, drainase dan akar.','https://cdn.tanamyuk.test/problem/layu.jpg',1),
(5,1,'BUNGA_RONTOK','Bunga Rontok','Bunga rontok','Bisa dipicu stres air atau nutrisi.','https://cdn.tanamyuk.test/problem/bunga-rontok.jpg',1),
(6,2,'TOMAT_LAYU','Tomat Layu','Tomat layu','Periksa media dan akar.','https://cdn.tanamyuk.test/problem/tomat-layu.jpg',1);

INSERT INTO problem_solutions(id,problem_catalog_id,step_no,action_text) VALUES
(1,1,1,'Periksa kelembapan media.'),(2,1,2,'Periksa drainase dan kurangi penyiraman bila terlalu basah.'),
(3,2,1,'Periksa bagian bawah daun dan buang hama yang terlihat.'),(4,3,1,'Periksa hama dan kondisi pucuk.'),
(5,4,1,'Periksa kelembapan tanah dan akar.'),(6,5,1,'Jaga penyiraman stabil dan evaluasi nutrisi.'),
(7,6,1,'Periksa media tomat dan drainase.');

INSERT INTO project_problems(id,cultivation_project_id,problem_catalog_id,reported_by,title,description,status,detected_at,resolved_at,photo_url) VALUES
(1,1,1,1,'Daun menguning','Tiga tanaman menguning.','monitoring','2026-10-22 16:30:00',NULL,'https://cdn.tanamyuk.test/problem/user-yellow.jpg'),
(2,1,2,3,'Daun berlubang','Beberapa daun berlubang.','resolved','2026-10-15 08:00:00','2026-10-18 17:00:00','https://cdn.tanamyuk.test/problem/user-hole.jpg'),
(3,3,6,2,'Tomat layu','Beberapa tomat layu saat siang.','open','2026-10-26 13:00:00',NULL,'https://cdn.tanamyuk.test/problem/user-tomato.jpg');

INSERT INTO project_problem_actions(id,project_problem_id,user_id,action_date,action_text,result_status) VALUES
(1,1,1,'2026-10-22 17:00:00','Mengurangi penyiraman dan mengecek drainase.','improved'),
(2,2,3,'2026-10-15 09:00:00','Membersihkan hama yang ditemukan.','resolved'),
(3,3,2,'2026-10-26 15:00:00','Mengecek kelembapan media tomat.','done');

INSERT INTO expense_categories(id,code,name) VALUES
(1,'BIBIT','Bibit'),(2,'MEDIA','Media Tanam'),(3,'WADAH','Polybag/Wadah'),(4,'PUPUK','Pupuk'),(5,'PENGENDALIAN','Pengendalian Hama'),(6,'LAINNYA','Lainnya');

INSERT INTO project_expenses(id,cultivation_project_id,expense_category_id,user_id,expense_date,description,amount) VALUES
(1,1,1,1,'2026-09-20','Benih cabai',75000),(2,1,2,1,'2026-09-20','Media tanam',150000),(3,1,3,1,'2026-09-20','Polybag',100000),
(4,1,4,1,'2026-10-05','Pupuk',150000),(5,2,1,1,'2026-10-20','Benih cabai siklus kedua',80000),
(6,3,1,2,'2026-10-10','Benih tomat',70000),(7,4,1,1,'2026-10-21','Benih pakcoy',35000),(8,5,1,1,'2026-04-01','Benih cabai percobaan',70000);

INSERT INTO harvests(id,cultivation_project_id,harvest_no,recorded_by,harvest_date,weight_kg,note,photo_url) VALUES
(1,5,1,1,'2026-06-10',7.50,'Panen pertama.','https://cdn.tanamyuk.test/harvest/1.jpg'),
(2,5,2,1,'2026-06-20',6.00,'Panen kedua.','https://cdn.tanamyuk.test/harvest/2.jpg'),
(3,5,3,1,'2026-06-28',4.00,'Panen terakhir.','https://cdn.tanamyuk.test/harvest/3.jpg');

INSERT INTO harvest_sales(id,cultivation_project_id,harvest_id,sold_by,sale_date,buyer_name,qty_kg,price_per_kg,total_amount,payment_status) VALUES
(1,5,1,1,'2026-06-10','Tetangga',7.50,35000,262500,'paid'),
(2,5,2,1,'2026-06-20','Warung sekitar',6.00,32000,192000,'paid'),
(3,5,3,1,'2026-06-28','Pelanggan lokal',4.00,30000,120000,'paid');

INSERT INTO achievements(id,code,name,description,xp_bonus,icon,criteria_type,criteria_value,is_active) VALUES
(1,'TANAM_PERTAMA','Tanam Pertama','Memulai budidaya pertama.',50,'seed','first_project',1,1),
(2,'RAJIN_MERAWAT','Rajin Merawat','Menyelesaikan 10 tugas.',100,'leaf','task_count',10,1),
(3,'KONSISTEN_7','Konsisten 7 Hari','Aktif 7 hari berturut-turut.',100,'fire','streak_days',7,1),
(4,'DOKTER_TANAMAN','Dokter Tanaman','Menyelesaikan masalah tanaman.',100,'health','problem_resolved',1,1),
(5,'PANEN_PERTAMA','Panen Pertama','Mencatat panen pertama.',200,'harvest','first_harvest',1,1);

INSERT INTO user_xp_transactions(id,user_id,workspace_id,cultivation_project_id,source_type,source_id,xp_amount,description) VALUES
(1,1,1,1,'task',1,10,'Selesai menyiram'),(2,1,1,1,'stage',1,100,'Selesai tahap Mulai'),
(3,1,1,5,'achievement',1,50,'Badge Tanam Pertama'),(4,1,1,5,'harvest',1,200,'Panen pertama'),
(5,2,2,3,'achievement',1,50,'Badge Tanam Pertama'),(6,3,1,1,'problem',2,50,'Membantu menyelesaikan masalah');

INSERT INTO user_achievements(id,user_id,workspace_id,achievement_id,cultivation_project_id,unlocked_at) VALUES
(1,1,1,1,5,'2026-04-01 08:00:00'),(2,1,1,5,5,'2026-06-10 10:00:00'),
(3,1,1,3,1,'2026-10-10 08:00:00'),(4,2,2,1,3,'2026-10-10 08:05:00'),(5,3,1,4,1,'2026-10-18 17:10:00');

INSERT INTO user_streaks(id,user_id,workspace_id,current_streak_days,longest_streak_days,last_activity_date) VALUES
(1,1,1,12,24,'2026-10-27'),(2,2,2,8,8,'2026-10-27'),(3,3,1,3,7,'2026-10-26');

INSERT INTO notifications(id,user_id,workspace_id,title,body,type,data,status,created_at,sent_at,read_at) VALUES
(1,1,1,'Waktunya cek daun','Periksa kondisi daun Cabai Rawit #001 sore ini.','task_reminder','{"project_id":1,"task_id":2}','sent','2026-10-27 15:50:00','2026-10-27 15:50:00',NULL),
(2,1,1,'Streak 12 hari','Anda aktif merawat tanaman selama 12 hari.','streak','{"streak":12}','read','2026-10-27 08:00:00','2026-10-27 08:00:00','2026-10-27 08:10:00'),
(3,2,2,'Foto perkembangan','Jangan lupa catat perkembangan Tomat #001.','reminder','{"project_id":3}','queued','2026-10-27 20:00:00',NULL,NULL);

CREATE VIEW v_dashboard_projects AS
SELECT p.id project_id,p.workspace_id,p.name project_name,c.name commodity_name,p.current_plant_count,p.start_date,p.estimated_harvest_date,p.status,
       COALESCE(MAX(CASE WHEN ps.status='active' THEN ps.completion_percent END),100) current_stage_progress
FROM cultivation_projects p
JOIN cultivation_programs cp ON cp.id=p.cultivation_program_id
JOIN commodities c ON c.id=cp.commodity_id
LEFT JOIN project_stage_progress ps ON ps.cultivation_project_id=p.id
GROUP BY p.id,p.workspace_id,p.name,c.name,p.current_plant_count,p.start_date,p.estimated_harvest_date,p.status;

CREATE VIEW v_project_results AS
SELECT p.id project_id,p.workspace_id,p.name project_name,
       COALESCE(e.total_expense,0) total_expense,
       COALESCE(h.total_harvest_kg,0) total_harvest_kg,
       COALESCE(s.total_sales,0) total_sales,
       COALESCE(s.total_sales,0)-COALESCE(e.total_expense,0) profit_loss
FROM cultivation_projects p
LEFT JOIN (SELECT cultivation_project_id,SUM(amount) total_expense FROM project_expenses GROUP BY cultivation_project_id) e ON e.cultivation_project_id=p.id
LEFT JOIN (SELECT cultivation_project_id,SUM(weight_kg) total_harvest_kg FROM harvests GROUP BY cultivation_project_id) h ON h.cultivation_project_id=p.id
LEFT JOIN (SELECT cultivation_project_id,SUM(total_amount) total_sales FROM harvest_sales GROUP BY cultivation_project_id) s ON s.cultivation_project_id=p.id;

CREATE VIEW v_user_gamification AS
SELECT u.id user_id,u.name,
       COALESCE(x.total_xp,0) total_xp,
       COALESCE(a.total_badges,0) total_badges,
       COALESCE(st.current_streak_days,0) current_streak_days,
       COALESCE(st.longest_streak_days,0) longest_streak_days
FROM users u
LEFT JOIN (SELECT user_id,SUM(xp_amount) total_xp FROM user_xp_transactions GROUP BY user_id) x ON x.user_id=u.id
LEFT JOIN (SELECT user_id,COUNT(*) total_badges FROM user_achievements GROUP BY user_id) a ON a.user_id=u.id
LEFT JOIN user_streaks st ON st.user_id=u.id;

SET FOREIGN_KEY_CHECKS=1;
