# Panduan Deploy ke Dokploy

## File yang Dibutuhkan

Sudah tersedia:
- ✅ `Dockerfile` - Konfigurasi Docker dengan nginx
- ✅ `nginx.conf` - Konfigurasi nginx server
- ✅ `.dockerignore` - File yang diabaikan saat build
- ✅ `docker-compose.yml` - Untuk testing lokal
- ✅ `index.html` - Website undangan pernikahan

## Testing Lokal

Sebelum deploy ke Dokploy, test dulu di lokal:

### Menggunakan Docker Compose (Recommended)
```bash
# Build dan jalankan
docker-compose up -d

# Akses website di browser
http://localhost:8080

# Lihat logs
docker-compose logs -f

# Stop container
docker-compose down
```

### Menggunakan Docker Manual
```bash
# Build image
docker build -t wedding-invitation .

# Run container
docker run -d -p 8080:80 --name wedding wedding-invitation

# Akses website
http://localhost:8080

# Stop container
docker stop wedding
docker rm wedding
```

## Deploy ke Dokploy

### Metode 1: Deploy dari GitHub (Recommended)

1. **Push ke GitHub**
   ```bash
   git add .
   git commit -m "Add Docker configuration"
   git push origin main
   ```

2. **Di Dokploy Dashboard:**
   - Klik "New Application"
   - Pilih "Docker" atau "Dockerfile"
   - Connect ke repository GitHub Anda
   - Pilih branch `main`
   - Set port: `80`
   - Klik "Deploy"

3. **Environment Variables (jika perlu):**
   Tidak ada environment variable yang dibutuhkan untuk static website ini.

### Metode 2: Deploy dari Docker Registry

1. **Build dan Push ke Docker Hub**
   ```bash
   # Login ke Docker Hub
   docker login

   # Build image dengan tag
   docker build -t username/wedding-invitation:latest .

   # Push ke Docker Hub
   docker push username/wedding-invitation:latest
   ```

2. **Di Dokploy:**
   - Pilih "Deploy from Registry"
   - Masukkan image: `username/wedding-invitation:latest`
   - Set port: `80`
   - Deploy

### Metode 3: Deploy Manual Upload

1. Zip semua file project (termasuk Dockerfile)
2. Upload di Dokploy
3. Set build command: `docker build -t wedding .`
4. Set start command: `docker run -p 80:80 wedding`

## Konfigurasi di Dokploy

### Port Configuration
- **Container Port:** `80`
- **Public Port:** Akan di-assign otomatis oleh Dokploy (biasanya 80/443)

### Health Check (Optional)
```yaml
healthcheck:
  test: ["CMD", "wget", "--quiet", "--tries=1", "--spider", "http://localhost/"]
  interval: 30s
  timeout: 10s
  retries: 3
```

### Resource Limits (Recommended)
```yaml
resources:
  limits:
    memory: 128M
    cpus: '0.5'
  reservations:
    memory: 64M
    cpus: '0.25'
```

## Custom Domain

1. Di Dokploy Dashboard, buka aplikasi Anda
2. Klik "Settings" → "Domains"
3. Tambahkan domain custom (misal: `erza-prili.wedding`)
4. Update DNS record di domain provider:
   - Type: `A` atau `CNAME`
   - Value: IP/hostname dari Dokploy
5. Enable SSL (Dokploy biasanya auto-generate Let's Encrypt)

## Troubleshooting

### Container tidak start
```bash
# Check logs
docker logs wedding

# Masuk ke container
docker exec -it wedding sh
```

### Port sudah digunakan
```bash
# Ganti port di docker-compose.yml
ports:
  - "3000:80"  # Ganti 8080 jadi 3000
```

### Website tidak muncul
1. Pastikan index.html ada di root directory
2. Check nginx logs: `docker logs wedding`
3. Verify port mapping: `docker ps`

### Asset tidak muncul (Foto/Video)
Website ini menggunakan asset eksternal dari `diundang.org`. Pastikan:
- Server punya akses internet
- URL asset masih aktif

## Performance Tips

1. **Enable Caching**: Sudah dikonfigurasi di `nginx.conf`
2. **Gzip Compression**: Sudah aktif untuk text files
3. **CDN**: Pertimbangkan menggunakan Cloudflare untuk performa lebih baik

## Security

- ✅ Security headers sudah dikonfigurasi di nginx.conf
- ✅ Container berjalan dengan user non-root (nginx alpine default)
- ✅ Minimal image size (~50MB)

## Monitoring

Di Dokploy dashboard Anda bisa monitor:
- CPU Usage
- Memory Usage
- Network Traffic
- Container Logs

## Update Website

Untuk update konten website:

1. Edit `index.html`
2. Commit dan push:
   ```bash
   git add index.html
   git commit -m "Update content"
   git push
   ```
3. Dokploy akan auto-rebuild dan redeploy (jika auto-deploy enabled)

Atau manual:
```bash
# Rebuild image
docker-compose build

# Restart container
docker-compose up -d
```

## URLs

Setelah deploy, website bisa diakses di:
- URL Dokploy: `https://your-app.dokploy.domain`
- Custom domain (jika sudah setup): `https://erza-prili.wedding`

## Support

- Dokploy Docs: https://dokploy.com/docs
- Docker Docs: https://docs.docker.com
- Nginx Docs: https://nginx.org/en/docs/

---

**Happy Deployment!** 🎉
