-- StayEase Hotel Booking Management System
-- PostgreSQL Schema for Supabase
-- This schema is compatible with Laravel migrations
-- Run migrations instead of this file: php artisan migrate

-- Note: This file is for reference only
-- The actual schema will be created by Laravel migrations
-- To initialize the database:
-- 1. Set DATABASE_URL in Render environment variables
-- 2. Run: php artisan migrate --force
-- 3. Run: php artisan db:seed --force (optional, for demo data)

-- Tables that will be created by migrations:
-- 1. users - User authentication and profiles
-- 2. password_reset_tokens - Password reset functionality
-- 3. failed_jobs - Failed job tracking
-- 4. personal_access_tokens - API tokens (Laravel Sanctum)
-- 5. room_types - Room categories (Standard, Deluxe, Superior)
-- 6. rooms - Room inventory with pricing and images
-- 7. orders - Bookings/reservations
-- 8. sessions - Session storage (for persistence)
-- 9. cache - Cache storage
-- 10. cache_locks - Cache locking mechanism
-- 11. jobs - Queue jobs
-- 12. job_batches - Batched jobs

-- All tables use BIGSERIAL for auto-incrementing primary keys (PostgreSQL equivalent of AUTO_INCREMENT)
-- Foreign keys use CASCADE delete to maintain referential integrity
-- Timestamps use TIMESTAMP type for created_at and updated_at columns
