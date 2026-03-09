# 🚀 Python API: Automated Self-Healing & CI/CD Pipeline

Proyek ini mendemonstrasikan transformasi dari manajemen server manual (IT Support) menuju otomasi infrastruktur modern (DevOps). Sistem ini mencakup pengembangan API sederhana, kontainerisasi dengan Docker, otomasi pemulihan server (Self-Healing), hingga pipeline CI/CD otomatis.

## 🛠️ Tech Stack & Tools
* **Programming:** Python (FastAPI)
* **Infrastructure:** Docker & Docker Hub
* **OS/Environment:** Ubuntu (WSL 2) on Windows 11
* **Automation:** Bash Scripting & Cronjob
* **CI/CD:** GitHub Actions

## 🌟 Fitur Utama

### 1. Monitoring & Self-Healing (Otomasi Server)
Saya mengimplementasikan skrip Bash (`watchdog.sh`) yang dipadukan dengan **Cronjob** untuk memantau kesehatan kontainer Docker setiap menit. Jika kontainer mati, sistem akan otomatis melakukan restart dan mencatat insiden tersebut ke dalam file log.
> **Manfaat:** Mengurangi intervensi manual dan meningkatkan ketersediaan layanan (High Availability).

### 2. Containerization (Docker)
Aplikasi dibungkus menggunakan Docker untuk memastikan konsistensi *environment* antara tahap pengembangan dan produksi. Tidak ada lagi kendala perbedaan versi library di server yang berbeda.

### 3. CI/CD Pipeline (GitHub Actions)
Setiap kali ada pembaruan kode yang di-*push* ke GitHub:
* **CI (Continuous Integration):** Robot otomatis menjalankan unit testing menggunakan `pytest` untuk memastikan kode tidak rusak.
* **CD (Continuous Delivery):** Jika tes lolos, robot akan merakit *Docker Image* terbaru dan mengirimkannya ke Docker Hub secara otomatis.

## 📁 Struktur Proyek
* `main.py`: Logika utama API menggunakan FastAPI.
* `watchdog.sh`: Skrip otomatisasi pemantauan server.
* `Dockerfile`: Instruksi pembuatan kontainer aplikasi.
* `.github/workflows/ci.yml`: Konfigurasi robot CI/CD GitHub Actions.
* `test_main.py`: Skrip pengujian otomatis (Unit Testing).

## 🚀 Cara Menjalankan Secara Lokal
Jika Anda memiliki Docker, Anda bisa langsung menjalankan aplikasi ini tanpa perlu menginstal Python:

```bash
docker run -d -p 8000:8000 --name api-server panji10969/devops-python-api:latest