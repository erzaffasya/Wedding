# Website Undangan Pernikahan - Erza & Prili

Website ini adalah duplikat dari: **https://diundang.org/erzaprili/**

## Struktur Folder

```
Wedding/
├── assets/
│   ├── css/
│   │   └── wedding-custom.css    # Custom CSS untuk override
│   └── images/
│       └── foto1.jpeg             # Foto Prilita Amalia
├── index.html                      # File HTML utama
├── Dockerfile                      # Docker configuration
├── docker-compose.yml              # Docker Compose setup
├── nginx.conf                      # Nginx server config
├── .dockerignore                   # Docker ignore file
├── DEPLOY.md                       # Panduan deployment
├── BUKA-WEBSITE.bat                # Windows shortcut
└── README.md                       # Dokumentasi ini
```

## Cara Menggunakan

### Buka Website
1. Double-click **BUKA-WEBSITE.bat**, atau
2. Double-click **index.html**

### Buka Website Lokal (Development)
```bash
# Menggunakan Docker Compose
docker-compose up -d

# Akses di browser
http://localhost:8081
```

### Asset (Foto, Video, Musik)
Sebagian besar asset menggunakan referensi langsung ke URL asli:
- Foto Gallery: `https://diundang.org/wp-content/uploads/2025/11/...`
- Video: `https://diundang.org/wp-content/uploads/2025/11/...`
- Musik: `https://diundang.org/wp-content/uploads/2025/11/...`
- CSS Library: `https://diundang.org/wp-content/plugins/...`
- JavaScript: `https://diundang.org/wp-includes/js/...`

**Custom Asset Lokal:**
- ✅ Foto Prilita (The Bride): `assets/images/foto1.jpeg`
- ✅ Custom CSS Override: `assets/css/wedding-custom.css`

**Catatan:** Butuh koneksi internet untuk menampilkan foto gallery, video, dan memutar musik.

## Fitur Website

✅ Cover page dengan tombol "Let's Open"
✅ Background music (auto-play)
✅ Ayat Al-Quran (Ar-Rum 30:21)
✅ Info Pengantin (Bride & Groom)
✅ Detail Acara (Akad Nikah & Resepsi)
✅ Countdown Timer
✅ Google Maps link
✅ Save to Google Calendar
✅ RSVP / Guestbook
✅ Wedding Gift (Nomor Rekening)
✅ Photo Gallery Slideshow
✅ Pre-wedding Video
✅ Responsive Design (Mobile & Desktop)

## Info Pernikahan

**Pengantin:**
- Prilita Amalia (Putri dari Sudaryono & S.Yuniati)
- Erza Fahmi Fasya (Putra dari Zainal Fatoni Arif & Erna Mufidatul Husna)

**Tanggal:** Minggu, 14 Desember 2025

**Acara:**
- Akad Nikah: 08:00 - 09:00 WITA
- Resepsi: 11:00 - 15:00 WITA

**Lokasi:** Gedung Grha Bintang

**Wedding Gift:**
- Prili: Mandiri 1490015852959
- Erza: BSI 7251926225

## Teknologi

Website ini dibuat menggunakan:
- WordPress
- Elementor Page Builder
- WeddingPress Plugin
- jQuery

## Browser Support

✅ Chrome
✅ Firefox
✅ Safari
✅ Edge
✅ Mobile Browsers

## Deploy ke Production

### Deploy ke Dokploy

```bash
# 1. Push ke GitHub
git add .
git commit -m "Update wedding website"
git push origin main

# 2. Di Dokploy Dashboard:
# - Klik "New Application" → "Docker"
# - Connect ke GitHub repository
# - Set port: 80
# - Deploy
```

Lihat **DEPLOY.md** untuk panduan lengkap deployment.

## Kustomisasi

### Mengganti Foto
1. Letakkan foto di folder `assets/images/`
2. Update path di `assets/css/wedding-custom.css`
3. Rebuild Docker: `docker-compose up --build -d`

### Menambah Custom CSS
Edit file `assets/css/wedding-custom.css` untuk menambah styling custom.

## Catatan

- Website ini adalah duplikat untuk keperluan production deployment
- Sebagian besar asset (foto, CSS, JS) menggunakan URL dari website asli
- Custom foto dan styling disimpan di folder `assets/`
- Diperlukan koneksi internet untuk menampilkan asset eksternal

---

**Sumber:** https://diundang.org/erzaprili/

**Duplikat dibuat:** November 2025
