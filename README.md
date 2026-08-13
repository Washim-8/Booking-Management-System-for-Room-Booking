<div align="center">

# 🏨 StayEase - Hotel Booking Management System

<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?size=22&duration=3000&color=0F766E&center=true&vCenter=true&width=750&lines=Full-Stack+Hotel+Booking+System;Laravel+%2B+PostgreSQL+%2B+Docker;Cloud-Ready+with+Supabase+%26+Render;Real-World+Hospitality+Application" alt="Typing Animation"/>
</p>

![Laravel](https://img.shields.io/badge/Laravel-10.x-red?style=for-the-badge&logo=laravel)
![PHP](https://img.shields.io/badge/PHP-8.2+-blue?style=for-the-badge&logo=php)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15+-336791?style=for-the-badge&logo=postgresql)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker)
![Supabase](https://img.shields.io/badge/Supabase-Database-3ECF8E?style=for-the-badge&logo=supabase)
![Render](https://img.shields.io/badge/Render-Deployed-46E3B7?style=for-the-badge&logo=render)

<p align="center">
  <em>A modern, cloud-native hotel booking platform designed for seamless customer experience and robust back-office management.</em>
</p>

</div>

---

## 📌 Overview

StayEase is a production-ready hotel booking management system built with Laravel, designed to handle the complete lifecycle of hotel operations—from room discovery and booking to administrative oversight. Unlike traditional monolithic hotel management software, StayEase is architected for the cloud, with complete containerization via Docker and persistent data storage in Supabase PostgreSQL.

The system emphasizes:
- **Data Persistence:** All bookings, users, and rooms survive deployments and container restarts
- **Real Availability:** Smart booking conflict detection prevents double-booking
- **Security First:** Bcrypt password hashing, CSRF protection, input validation, and authorization policies
- **Cloud Native:** Docker-ready with PostgreSQL, deployable to Render, AWS, Azure, or any container platform
- **Professional UI:** Clean, responsive design with Bootstrap 5

---

## ✨ Features

### 👤 Guest Experience
- **Smart Room Search:** Filter rooms by check-in/check-out dates with real-time availability checking
- **Secure Authentication:** User registration and login with strong password requirements (uppercase, lowercase, number, symbol)
- **Personal Dashboard:** View active bookings, booking history, and manage profile
- **Room Discovery:** Browse detailed room listings with amenities, capacity, and regional pricing (INR ₹)
- **Instant Booking:** Conflict-free reservation workflow with date validation and availability verification
- **Profile Management:** Update contact information and personal details

### 🛠 Administrative Control
- **Admin Dashboard:** Real-time overview of total rooms, current reservations, and system statistics
- **Room Type Management:** Create and manage room categories (Standard, Deluxe, Superior, etc.)
- **Room Inventory:** Full CRUD operations on rooms with image uploads, pricing, and availability toggle
- **Booking Oversight:** View all reservations across the system with guest and date details
- **Authorization:** Policy-based access control ensuring only admins can modify critical data
- **Availability Management:** Enable/disable rooms for maintenance without data deletion

### 🔒 Security Features
- **Password Security:** Bcrypt hashing with Laravel's built-in authentication
- **Strong Password Policy:** Enforced requirements (min 6 chars, mixed case, numbers, symbols)
- **CSRF Protection:** Laravel's automatic CSRF token validation on all forms
- **Input Validation:** Server-side validation on all user inputs
- **SQL Injection Protection:** Eloquent ORM with parameterized queries
- **Authorization Policies:** Route middleware and model policies for access control
- **Session Security:** Database-backed sessions with regeneration on login

---

## 🏗 Architecture

### Production Deployment Architecture

```
┌─────────────────────────────────────────────────┐
│              GitHub Repository                   │
│   (Washim-8/Booking-Management-System)          │
└───────────────────┬─────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────┐
│         Render Web Service (Docker)              │
│  ┌───────────────────────────────────────────┐  │
│  │   Apache 2.4 + PHP 8.2                   │  │
│  │   ┌───────────────────────────────────┐  │  │
│  │   │   Laravel 10.x Application        │  │  │
│  │   │   - Eloquent ORM (PDO PostgreSQL)│  │  │
│  │   │   - Blade Templates               │  │  │
│  │   │   - Authentication & Authorization│  │  │
│  │   └───────────────────────────────────┘  │  │
│  └───────────────────────────────────────────┘  │
└───────────────────┬─────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────┐
│         Supabase PostgreSQL Database             │
│  ┌─────────┬──────────┬───────────┬──────────┐ │
│  │  Users  │  Rooms   │  Bookings │ Sessions │ │
│  │ (Auth)  │ (Invntry)│ (Orders)  │ (State)  │ │
│  └─────────┴──────────┴───────────┴──────────┘ │
│         🔒 Persistent Storage Layer              │
└─────────────────────────────────────────────────┘
```

### Key Architectural Decisions

1. **PostgreSQL over MySQL:** Compatible with Supabase and modern cloud platforms
2. **Database Sessions:** Session data persists in PostgreSQL, not container filesystem
3. **Database Cache:** Cache stored in database for multi-instance compatibility
4. **Eloquent ORM:** Abstracts database layer with PDO underneath for security
5. **Container Stateless:** Render containers are ephemeral; all state in Supabase

---

## 🛠 Tech Stack

### Backend & Framework
- **Laravel 10.x** - Modern PHP framework with Eloquent ORM
- **PHP 8.2+** - Latest PHP with strong typing and performance improvements
- **PostgreSQL 15+** - ACID-compliant relational database via Supabase
- **Apache 2.4** - Web server with mod_rewrite for clean URLs

### Frontend & UI
- **Blade Templates** - Laravel's templating engine
- **Bootstrap 5** - Responsive CSS framework
- **Vanilla JavaScript** - Modern ES6+ JavaScript
- **WOW.js & Animate.css** - Smooth scroll animations
- **Tempus Dominus** - Date picker for booking forms
- **Owl Carousel 2** - Image carousels
- **Font Awesome 6 & Bootstrap Icons** - Icon libraries

### DevOps & Deployment
- **Docker** - Containerization for consistent environments
- **Render** - Cloud platform for deployment
- **Supabase** - Managed PostgreSQL database with built-in backups
- **Git & GitHub** - Version control and CI/CD source

### Security & Authentication
- **Laravel Sanctum** - API token authentication (if needed)
- **Bcrypt** - Password hashing algorithm
- **CSRF Middleware** - Cross-site request forgery protection
- **Policy Authorization** - Model-level access control

---

## 📂 Project Structure

```
Booking-Management-System-for-Room-Booking/
├── app/
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── Auth/
│   │   │   │   └── AuthController.php      # Login, register, logout
│   │   │   ├── Admin/
│   │   │   │   ├── AdminController.php     # Admin dashboard
│   │   │   │   ├── RoomController.php      # Room CRUD (admin)
│   │   │   │   ├── RoomTypeController.php  # Room type management
│   │   │   │   └── OrderController.php     # Booking management (admin)
│   │   │   ├── OrderController.php         # User bookings
│   │   │   └── PageController.php          # Public pages
│   │   └── Middleware/
│   │       └── IsAdmin.php                 # Admin authorization
│   ├── Models/
│   │   ├── User.php                        # User model with orders relationship
│   │   ├── Room.php                        # Room model with bookings
│   │   ├── RoomType.php                    # Room category model
│   │   └── Order.php                       # Booking model
│   ├── Policies/
│   │   ├── RoomPolicy.php                  # Room authorization
│   │   └── RoomTypePolicy.php              # Room type authorization
│   └── Rules/
│       └── AlphaSpace.php                  # Custom validation rule
├── config/
│   ├── database.php                        # Database configuration (PostgreSQL default)
│   └── session.php                         # Session configuration (database driver)
├── database/
│   ├── migrations/                         # Database schema migrations
│   │   ├── 2014_10_12_000000_create_users_table.php
│   │   ├── 2023_03_07_014731_create_room_types_table.php
│   │   ├── 2023_03_07_014753_create_rooms_table.php
│   │   ├── 2023_03_07_014808_create_orders_table.php
│   │   ├── 2024_01_01_000001_create_sessions_table.php
│   │   ├── 2024_01_01_000002_create_cache_table.php
│   │   └── 2024_01_01_000003_create_jobs_table.php
│   ├── seeders/
│   │   └── DatabaseSeeder.php              # Demo data seeder
│   └── schema/
│       └── postgresql-schema.sql           # Schema reference
├── public/
│   ├── img/                                # Room images (container filesystem)
│   ├── css/                                # Compiled CSS
│   ├── js/                                 # JavaScript files
│   └── index.php                           # Application entry point
├── resources/
│   └── views/                              # Blade templates
│       ├── auth/                           # Login/register views
│       ├── admin/                          # Admin dashboard views
│       └── pages/                          # Public views
├── routes/
│   └── web.php                             # Application routes
├── storage/
│   ├── app/                                # Application storage
│   ├── framework/                          # Framework cache/sessions
│   └── logs/                               # Application logs
├── Dockerfile                              # Docker image definition
├── docker-entrypoint.sh                    # Container startup script
├── .dockerignore                           # Docker build exclusions
├── .env.example                            # Environment variables template
├── composer.json                           # PHP dependencies
├── package.json                            # Frontend dependencies
└── README.md                               # This file
```

---

## ⚙️ Database Schema

### Tables & Relationships

**users**
- `id` (bigserial, PK)
- `name`, `last_name`, `email` (unique)
- `password` (bcrypt hashed)
- `phone`
- `is_admin` (boolean, default: false)
- `remember_token`, `email_verified_at`
- `created_at`, `updated_at`

**room_types**
- `id` (bigserial, PK)
- `name` (string, unique) - e.g., "Standard", "Deluxe"
- `created_at`, `updated_at`

**rooms**
- `id` (bigserial, PK)
- `room_type_id` (FK → room_types.id, CASCADE)
- `total_room` (integer) - Number of rooms of this type
- `no_beds` (integer) - Bed capacity
- `price` (double precision) - Price per night
- `image` (string, nullable) - Image path
- `desc` (text) - Room description
- `status` (boolean, default: true) - Availability toggle
- `created_at`, `updated_at`

**orders** (Bookings/Reservations)
- `id` (bigserial, PK)
- `user_id` (FK → users.id, CASCADE)
- `room_id` (FK → rooms.id, CASCADE)
- `check_in` (timestamp)
- `check_out` (timestamp)
- `created_at`, `updated_at`

**sessions** (Persistent Session Storage)
- `id` (string, PK)
- `user_id` (bigint, nullable, indexed)
- `ip_address`, `user_agent`
- `payload` (longtext)
- `last_activity` (integer, indexed)

**cache**, **cache_locks** (Application Cache)
**jobs**, **job_batches** (Queue System)

---

## 🚀 Installation & Setup

### Option 1: Deploy to Render (Production)

**See complete guide:** [DEPLOYMENT.md](./DEPLOYMENT.md)

**Quick Steps:**
1. Create Supabase project and get `DATABASE_URL`
2. Push code to GitHub
3. Create Render Web Service (Docker runtime)
4. Add environment variables (especially `DATABASE_URL`)
5. Deploy and access your live application

---

### Option 2: Local Development

#### Prerequisites
- PHP 8.2+ with extensions: `pdo_pgsql`, `mbstring`, `xml`, `bcmath`, `gd`
- Composer
- Node.js & npm
- PostgreSQL 15+ (or Docker)

#### 2.1 Clone Repository

```bash
git clone https://github.com/Washim-8/Booking-Management-System-for-Room-Booking.git
cd "Booking-Management-System-for-Room-Booking"
```

#### 2.2 Install Dependencies

```bash
# Install PHP dependencies
composer install

# Install frontend dependencies
npm install

# Build frontend assets
npm run build
```

#### 2.3 Environment Configuration

```bash
# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate
```

Edit `.env` and configure database:

```env
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=stayease_hotel
DB_USERNAME=your_postgres_user
DB_PASSWORD=your_postgres_password
```

#### 2.4 Database Setup

```bash
# Create PostgreSQL database
createdb stayease_hotel

# Run migrations
php artisan migrate

# Seed demo data (optional)
php artisan db:seed

# Create storage symlink
php artisan storage:link
```

**Demo Accounts After Seeding:**
- **Admin:** admin@gmail.com / Password@1
- **User:** user@gmail.com / Password@1

#### 2.5 Start Development Server

```bash
php artisan serve
```

Visit: **http://localhost:8000**

---

### Option 3: Docker Local Development

#### Prerequisites
- Docker Desktop
- Supabase project or local PostgreSQL

#### 3.1 Build Docker Image

```bash
docker build -t stayease-hotel .
```

#### 3.2 Run Container

```bash
docker run -d \
  --name stayease-hotel \
  -p 8080:80 \
  -e APP_NAME="StayEase Hotel" \
  -e APP_ENV=local \
  -e APP_KEY=base64:your-key-here \
  -e APP_DEBUG=true \
  -e DATABASE_URL="postgresql://user:pass@host:5432/db?sslmode=require" \
  -e DB_CONNECTION=pgsql \
  -e SESSION_DRIVER=database \
  -e CACHE_DRIVER=database \
  stayease-hotel
```

**Generate APP_KEY:**
```bash
php artisan key:generate --show
```

Visit: **http://localhost:8080**

#### 3.3 Access Container Shell

```bash
docker exec -it stayease-hotel bash

# Inside container
php artisan migrate
php artisan db:seed
```

---

## 📸 Application Flow

### User Journey

1. **Registration:**
   - User visits `/register`
   - Fills form with name, email, strong password
   - Password validated (min 6 chars, mixed case, number, symbol)
   - Account created and logged in automatically

2. **Room Search:**
   - User enters check-in and check-out dates
   - System queries database for rooms with availability
   - Filters out rooms with overlapping bookings at capacity
   - Displays available rooms with pricing

3. **Booking:**
   - User selects a room
   - System validates dates and checks availability again
   - If available, creates order record in database
   - Booking stored in Supabase (persists across deployments)

4. **Booking Management:**
   - User views bookings in `/orders`
   - Displays check-in/out dates, room details, stay duration
   - Historical bookings retained permanently

### Admin Journey

1. **Admin Login:**
   - Admin logs in with admin credentials
   - `IsAdmin` middleware checks `is_admin` flag
   - Redirected to `/admin` dashboard

2. **Room Type Management:**
   - Create new room categories (e.g., "Executive Suite")
   - Edit/delete existing categories
   - Authorization policy enforces admin-only access

3. **Room Management:**
   - Add new rooms with image upload, pricing, description
   - Edit room details and toggle availability
   - Images stored in `/public/img/` (note: container filesystem)
   - Delete rooms (cascade deletes associated bookings)

4. **Booking Oversight:**
   - View all reservations system-wide
   - See guest details, room assignments, dates
   - Monitor upcoming and past reservations

---

## 🔐 Security Measures Implemented

### Authentication & Authorization
✅ **Bcrypt Password Hashing:** Laravel's `Hash::make()` and `Hash::check()`  
✅ **Strong Password Policy:** Enforced via validation rules  
✅ **Session Regeneration:** On login to prevent session fixation  
✅ **Remember Token:** For "remember me" functionality  
✅ **Middleware Authorization:** `auth` and `admin` middleware on protected routes  
✅ **Policy Authorization:** `RoomPolicy` and `RoomTypePolicy` for fine-grained control

### Input Validation & Sanitization
✅ **Server-Side Validation:** All forms validated before processing  
✅ **Custom Validation Rules:** `AlphaSpace` rule for name fields  
✅ **Date Validation:** Check-in must be today or later, check-out after check-in  
✅ **Type Casting:** Models use `$casts` for boolean and datetime fields  
✅ **Mass Assignment Protection:** `$fillable` arrays on all models

### SQL Injection & XSS Protection
✅ **Eloquent ORM:** Parameterized queries, no raw SQL concatenation  
✅ **Blade Escaping:** `{{ }}` syntax auto-escapes output  
✅ **Prepared Statements:** PDO underneath Eloquent for database operations

### CSRF Protection
✅ **Laravel CSRF Middleware:** Automatic token validation on POST/PUT/DELETE  
✅ **Blade `@csrf` Directive:** Token included in all forms

### Production Security
✅ **APP_DEBUG=false:** Stack traces hidden in production  
✅ **Error Logging:** Errors logged to `/storage/logs/`, not displayed  
✅ **HTTPS:** Enforced by Render (automatic SSL certificates)  
✅ **Environment Variables:** Secrets in `.env`, never committed to Git  
✅ **Database Sessions:** Session hijacking mitigated by secure session storage

---

## 📊 Data Persistence Strategy

### What Persists Across Deployments ✅

All critical application data is stored in **Supabase PostgreSQL** and survives:
- Render container restarts
- New deployments
- Docker container replacement
- Application updates

**Persistent Data:**
- ✅ **Users** - All user accounts, profiles, passwords
- ✅ **Rooms** - Room inventory, pricing, descriptions, availability status
- ✅ **Room Types** - Categories (Standard, Deluxe, Superior)
- ✅ **Orders/Bookings** - All reservations with dates
- ✅ **Sessions** - User login sessions (database driver)
- ✅ **Cache** - Application cache (database driver)

### What Does NOT Persist ❌

Data stored in the **Render container filesystem** is ephemeral:
- ❌ **Uploaded Images** - Files in `/public/img/` are lost on redeployment
- ❌ **Logs** - Files in `/storage/logs/` are not retained
- ❌ **Compiled Views** - Blade cache regenerates automatically

**Recommendation for Production:**  
Implement cloud storage (AWS S3, Cloudinary, Supabase Storage) for user-uploaded images to achieve full persistence.

---

## 🧪 Testing Persistence

To verify data survives deployments:

1. **Create test data:**
   ```bash
   # Register a new user
   # Create a booking
   # Add a room (as admin)
   ```

2. **Trigger redeployment:**
   ```bash
   # In Render dashboard
   Manual Deploy → Clear build cache & deploy
   ```

3. **Verify after redeploy:**
   ```bash
   # Log back in
   # Check your booking still exists
   # Verify rooms are still present
   ```

✅ **Expected Result:** All users, rooms, and bookings remain intact.

---

## 🔧 Configuration

### Key Environment Variables

```env
# Application
APP_NAME="StayEase Hotel"
APP_ENV=production                    # local | production
APP_KEY=base64:xxx                    # Generate with: php artisan key:generate
APP_DEBUG=false                       # NEVER true in production
APP_URL=https://your-app.onrender.com

# Database (Supabase PostgreSQL)
DATABASE_URL=postgresql://user:pass@host:5432/db?sslmode=require
DB_CONNECTION=pgsql
DB_SSLMODE=require

# Session & Cache (Database for Persistence)
SESSION_DRIVER=database
CACHE_DRIVER=database
QUEUE_CONNECTION=database

# Logging
LOG_CHANNEL=stack
LOG_LEVEL=error                       # debug | info | error
```

### Database Configuration

**Default Connection:** PostgreSQL (`pgsql`)

**Supports DATABASE_URL:** The application reads `DATABASE_URL` for Supabase/Heroku-style connection strings.

**SSL Mode:** Set to `require` for Supabase.

---

## 🚨 Known Limitations

### 1. Image Upload Persistence

**Issue:** Room images uploaded via admin panel are stored in `/public/img/`, which is part of the container filesystem. These images are lost when Render redeploys or replaces the container.

**Workarounds:**
- **Short-term:** Re-upload images after each deployment
- **Production:** Integrate AWS S3, Cloudinary, or Supabase Storage for persistent image storage

### 2. Free Tier Cold Starts

Render's free tier spins down containers after 15 minutes of inactivity.

**Impact:** First request after inactivity takes 30-60 seconds to start the container.

**Solutions:**
- Upgrade to paid tier for always-on service
- Use a uptime monitoring service to keep the app awake
- Accept cold start delay for demo/portfolio purposes

### 3. No Payment Integration

The system currently does not include payment processing.

**Future Enhancement:** Integrate Stripe, Razorpay, or PayPal for booking payments.

---

## 🛣 Roadmap & Future Improvements

- [ ] **Cloud Image Storage:** AWS S3 or Supabase Storage integration
- [ ] **Payment Gateway:** Stripe/Razorpay for booking payments
- [ ] **Email Notifications:** Booking confirmations and reminders
- [ ] **SMS Alerts:** Twilio integration for pre-arrival messages
- [ ] **Admin Calendar View:** Visual occupancy calendar
- [ ] **Guest Reviews:** Rating and review system for rooms
- [ ] **Multi-language Support:** Internationalization (i18n)
- [ ] **Advanced Reporting:** Occupancy rates, revenue analytics
- [ ] **API Development:** RESTful API with Laravel Sanctum
- [ ] **Mobile App:** React Native or Flutter client

---

## 👨‍💻 About the Developer

**Washim Shaikh** - Aspiring Software Engineer

I'm passionate about building practical, production-ready software that solves real-world problems. My expertise spans:

- **Full-Stack Development:** Laravel, Node.js, React, Vue.js
- **Cloud & DevOps:** Docker, AWS, Azure, CI/CD pipelines
- **Databases:** PostgreSQL, MySQL, MongoDB, Redis
- **AI/ML:** TensorFlow, scikit-learn, NLP systems
- **Problem Solving:** Data structures, algorithms, system design

### Notable Projects

**AgriTrade** - E-auction platform connecting farmers directly to markets, eliminating middlemen and improving price transparency.

**AI Fraud Detection System** - Machine learning model for real-time transaction fraud detection with 94% accuracy.

**LLM-Powered Chatbot** - Customer service bot using fine-tuned large language models for contextual responses.

**StayEase (This Project)** - Cloud-native hotel booking system demonstrating full-stack expertise, database design, and deployment automation.

### Experience

- **Full-Stack Developer Intern** @ 1Stop Solutions
- **AI Research Intern** @ Coincent.ai
- **Computer Science Engineering Student** @ Bangalore Institute of Technology

---

## 📬 Contact & Links

I'm actively seeking opportunities in software engineering, full-stack development, and AI/ML roles.

- **Email:** [washimshaikh33@gmail.com](mailto:washimshaikh33@gmail.com)
- **Phone:** +91 8884958185
- **GitHub:** [@Washim-8](https://github.com/Washim-8)
- **LinkedIn:** [Washim Shaikh](https://www.linkedin.com/in/washim-shaikh-349868281/)
- **Portfolio:** [GitHub Profile](https://github.com/Washim-8)

<div align="center">

### 📊 GitHub Stats

<img src="https://github-readme-stats.vercel.app/api?username=Washim-8&show_icons=true&theme=transparent&count_private=true" alt="GitHub Stats" />

<img src="https://github-readme-streak-stats.herokuapp.com/?user=Washim-8&theme=transparent" alt="GitHub Streak" />

---

**⭐ If you found this project helpful, please consider giving it a star!**

*Feel free to reach out for collaborations, opportunities, or technical discussions.*

</div>

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

You are free to:
- ✅ Use this project for personal or commercial purposes
- ✅ Modify and distribute the code
- ✅ Use it as a reference for learning

Attribution is appreciated but not required.

---

## 🙏 Acknowledgments

- **Laravel Team** - For the exceptional PHP framework
- **Supabase** - For managed PostgreSQL and developer-friendly platform
- **Render** - For seamless Docker deployment
- **Bootstrap Team** - For responsive UI components
- **Open Source Community** - For countless libraries and tools

---

**Built with ❤️ by [Washim Shaikh](https://github.com/Washim-8)**  
**Last Updated:** January 2024

</div>
