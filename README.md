# 🕌 RDM Docker Setup (PHP 7.2 + MySQL + ionCube Loader)

Proyek ini menjalankan aplikasi RDM Kemenag dalam kontainer Docker lengkap dengan dukungan `ionCube Loader` untuk PHP 7.2 dan MySQL 5.7.

## 📦 Struktur Proyek

```
rdm-docker/
├── docker-compose.yml               # Konfigurasi Docker
├── Dockerfile                       # Image PHP 7.2 + ionCube
├── ioncube/
│   └── ioncube_loader_lin_7.2.so    # Loader ionCube
└── rdm/
    └── (isi folder aplikasi RDM)
```

## ⚙️ Langkah Persiapan

### 1. Unduh ionCube Loader

- Kunjungi: https://www.ioncube.com/loaders.php
- Unduh versi **Linux x86-64**
- Salin file `ioncube_loader_lin_7.2.so` ke folder `ioncube/`

### 2. Salin Aplikasi RDM

Letakkan semua file RDM (index.php, application/, dll) ke dalam folder `rdm/`:

```bash
cp -r /path/ke/rdm/* ./rdm/
```

## 🚀 Menjalankan Proyek

### Build dan jalankan dengan Docker:

```bash
sudo docker-compose up -d --build
```

> Jika ingin tanpa `sudo`, jalankan:
> `sudo usermod -aG docker $USER` lalu logout-login.

### Akses via browser:

```
http://localhost:8080
```

## 🛠️ Konfigurasi Database (MySQL)

| Parameter   | Nilai     |
|-------------|-----------|
| Host        | db        |
| Port        | 3306      |
| Database    | rdm       |
| User        | rdmuser   |
| Password    | rdm123    |
| Root Pass   | root      |

## 🔧 Perintah Tambahan

- Lihat log:
  ```bash
  docker-compose logs -f
  ```

- Hentikan semua container:
  ```bash
  docker-compose down
  ```

## ❗ Troubleshooting

- **Permission denied Docker socket**
  ```bash
  sudo usermod -aG docker $USER
  ```

- **HTTP ERROR 500 / ionCube error**
  Pastikan file yang dipakai cocok dengan PHP 7.2:
  `ioncube_loader_lin_7.2.so`

## 📄 Lisensi

Proyek ini untuk keperluan lokal/internal. Gunakan sesuai kebijakan instansi.
