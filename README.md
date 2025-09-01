<div align="center">

# 🏨 Hotel Management System (StayEase)

<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?size=22&duration=3000&color=0F766E&center=true&vCenter=true&width=750&lines=Full-Stack+Hotel+Booking+System;Built+with+Laravel+%2B+MySQL;User+%26+Admin+Dashboard+Management;Real-World+Hospitality+Application" alt="Typing Animation"/>
</p>

![Repo Stars](https://img.shields.io/github/stars/Washim-8?style=for-the-badge)
![Repo Forks](https://img.shields.io/github/forks/Washim-8?style=for-the-badge)
![Laravel](https://img.shields.io/badge/Laravel-10.x-red?style=for-the-badge&logo=laravel)
![PHP](https://img.shields.io/badge/PHP-8.1+-blue?style=for-the-badge&logo=php)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql)
![Bootstrap](https://img.shields.io/badge/Bootstrap-UI-purple?style=for-the-badge&logo=bootstrap)

<p align="center">
  <em>A modern, scalable, and intuitive hospitality platform designed to bridge the gap between seamless customer experience and robust back-office management.</em>
</p>

</div>

---

## 📌 Overview

Managing a hotel efficiently requires more than just tracking available rooms—it demands a synchronized system that handles customer reservations, administrative oversight, and room inventory in real time. **StayEase** is a comprehensive, full-stack Hotel Booking Management System designed to address these exact challenges. 

By delivering a frictionless booking experience for guests and providing a powerful, data-driven dashboard for administrators, this project mimics the architecture of real-world hospitality platforms. It moves beyond simple CRUD operations to incorporate smart availability checks, secure user authentication, and dynamic pricing models suitable for regional markets.

---

## ✨ Features

### 👤 Guest Experience
- **Frictionless Room Discovery:** Users can seamlessly search for and filter rooms based on targeted check-in/checkout dates to find exact availability.
- **Secure Authentication & Profiles:** Personalized dashboards for users to manage their active bookings, track history, and update personal details.
- **Dynamic Room Insights:** Detailed listing pages that break down room amenities, capacity limits, and real-time regional pricing (INR ₹).
- **Instant Booking Engine:** Easy, conflict-free reservation workflow ensuring no double-booking occurs for the same dates.

### 🛠 Administrative Control
- **Intelligent Dashboard:** A centralized, high-level overview of hotel occupancy, recent reservations, and platform statistics.
- **Inventory Management:** Total control over adding, categorizing, and modifying room types (Standard, Suite, Deluxe) along with rich image uploads.
- **Reservation Oversight:** Complete visibility into every booking, empowering staff to track, approve, or adjust reservations on the fly.
- **Dynamic Visibility:** Instantly bring rooms on or offline for maintenance without deleting records.

---

## 🛠 Tech Stack

**Backend & Architecture**
- Laravel 10.x (PHP Framework)
- Eloquent ORM 
- MySQL Database

**Frontend & UI**
- Blade Templating Engine
- HTML5, CSS3, Vanilla JavaScript
- Bootstrap 5 (Responsive UI)
- FontAwesome 6 & Bootstrap Icons

**Libraries & Tooling**
- Composer & npm
- WOW.js & Animate.css for smooth scroll animations
- Tempus Dominus (Date Picker)
- Owl Carousel 2

---

## 📂 Project Structure

Key directories driving the system:

- `app/` → The brain of the app, containing Controllers, Eloquent Models, and core Middleware logic.
- `resources/views/` → All Blade templates separating the Admin components from the public frontend.
- `routes/web.php` → The central routing registry mapping URLs to specific controller actions.
- `database/` → Houses crucial Migrations and Seeders, ensuring instant database recreation across environments.
- `public/` → The public-facing entry point, serving compiled CSS, JS, and user-uploaded assets.
- `storage/` → Secure locale for session data, application logs, and uploaded room imagery.

---

## ⚙️ How It Works

1. **Onboarding:** A user registers or logs in, instantly gaining access to personalized portals and active room data.
2. **Browsing & Filtering:** The user enters their desired dates; the backend cross-references current records in real-time to return only non-overlapping, available inventory.
3. **Reservation:** A booking request is submitted. The system automatically calculates total duration, validates input, and locks the room for the specified dates.
4. **Administration:** Simultaneously, the admin dashboard updates. Administrators can view the new user, analyze the booking, and manage room statuses without touching a single line of code.

---

## ▶️ Installation & Setup

Want to run this locally? Follow these steps:

### 1. Clone & Install Dependencies
```bash
git clone https://github.com/Washim-8/Hotel-Management-System.git
cd "Booking Management System"

composer install
npm install
npm run build
```

### 2. Environment Configuration
Duplicate the `.env.example` file to create your own `.env`, then update your database credentials:
```bash
cp .env.example .env

# Edit .env file:
DB_CONNECTION=mysql
DB_DATABASE=hotel_management
DB_USERNAME=root
DB_PASSWORD=your_password
```

### 3. Generate Keys & Migrate Data
```bash
php artisan key:generate
php artisan migrate --seed
php artisan storage:link
```
*(Note: Seeding generates default user (`user@gmail.com`) and admin (`admin@gmail.com`) accounts with the password `Password@1`)*

### 4. Serve the Application
```bash
php artisan serve
```
Visit **http://localhost:8000** in your browser.

---

## 📸 Screenshots & Demo

*(👉 **Developer Note:** Insert images/GIFs here once captured)* 

- `[Homepage with Date Range Search]`
- `[Dynamic Room Listing Page]`
- `[Customer Booking Confirmation]`
- `[Admin Analytics Dashboard]`

### 🎥 Recommended Demo GIFs:
- **Search & Book Flow:** A smooth GIF showing date selection leading to available rooms.
- **Admin Capability:** Adding a new room type and instantly seeing it reflected on the frontend.

---

## 🚀 Future Improvements

- **Payment Gateway Integration:** Integrating Razorpay or Stripe to handle instant, secure online transactions.
- **Automated Alerts:** SMS (Twilio) and Email notifications to confirm bookings or send pre-arrival instructions.
- **Interactive Calendar View:** A visual calendar board for the admin panel to track room occupancy at a glance.
- **Review & Rating Engine:** Permitting past guests to leave verified ratings to boost conversion rates.

---

## 👨‍💻 About the Developer

I’m **Washim Shaikh**, an aspiring Software Engineer driven by a curiosity for how complex systems operate under the hood. Currently pursuing my degree in Computer Science Engineering, my focus lies squarely at the intersection of Full-Stack Web Development, Artificial Intelligence, and logic-driven problem-solving.

I don’t just write code; I engineer practical solutions. From engineering **AgriTrade**—an expansive E-auction platform giving farmers direct market access—to developing predictive AI systems for fraud detection and LLM-driven chatbots, my goal is always to build software that creates tangible real-world value. 

With foundational experiences spanning an AI internship at Coincent and Full-Stack development at 1Stop, I am continuously learning, building, and exploring how robust backend architectures can support highly intelligent machine learning systems.

---

## 📬 Contact

I am actively exploring new horizons, whether it’s an impactful internship, collaborative open-source work, or software engineering roles. Let's connect and build something great.

- **Email:** [washimshaikh33@gmail.com](mailto:washimshaikh33@gmail.com)
- **Phone:** +91 8884958185
- **GitHub:** [github.com/Washim-8](https://github.com/Washim-8)
- **LinkedIn:** [Washim Shaikh](https://www.linkedin.com/in/washim-shaikh-349868281/)

<div align="center">

📊 **GitHub Stats**

<img src="https://github-readme-stats.vercel.app/api?username=Washim-8&show_icons=true&theme=transparent" alt="Washim-8's GitHub Stats" /> 
<img src="https://github-readme-streak-stats.herokuapp.com/?user=Washim-8&theme=transparent" alt="Washim-8's GitHub Streak" />

*Feel free to reach out for collaborations or opportunities!*

</div>
