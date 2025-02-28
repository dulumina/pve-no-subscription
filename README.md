# pve-no-subscription

## Deskripsi

Skrip `sources.sh` dirancang untuk mengonfigurasi repositori Proxmox VE pada sistem Debian. Skrip ini melakukan hal berikut:

- **Menonaktifkan repositori Proxmox VE Enterprise**: Mengomentari baris yang berisi `deb` dan `enterprise` dalam file `/etc/apt/sources.list.d/pve-enterprise.list` untuk menonaktifkan repositori tersebut.
- **Mengaktifkan repositori No-Subscription**: Menambahkan repositori `pve-no-subscription` ke dalam file `/etc/apt/sources.list.d/pve-no-subscription.list`.
- **Memperbarui daftar paket**: Menjalankan perintah `apt update` untuk memperbarui daftar paket dari repositori yang telah dikonfigurasi.

## Cara Penggunaan

Untuk menjalankan skrip ini langsung dari URL tanpa perlu mengunduhnya terlebih dahulu, Anda dapat menggunakan perintah berikut:

```bash
curl -s https://raw.githubusercontent.com/dulumina/pve-no-subscription/main/sources.sh | bash
```

### Penjelasan:

- `curl -s https://raw.githubusercontent.com/dulumina/pve-no-subscription/main/sources.sh`: Mengunduh skrip dari URL yang ditentukan.
- `| bash`: Menyalurkan (pipe) output dari perintah `curl` langsung ke interpreter `bash` untuk dieksekusi.

### Cara Penggunaan Alternatif

Untuk menggunakan skrip ini, ikuti langkah-langkah berikut:

1. **Unduh Skrip**:

	Unduh skrip `sources.sh` dari repositori GitHub:

	```bash
	wget https://raw.githubusercontent.com/dulumina/pve-no-subscription/refs/heads/main/sources.sh
	```

2. **Jalankan Skrip**:

	Berikan izin eksekusi pada skrip:

	```bash
	chmod +x sources.sh
	```

	Jalankan skrip dengan hak akses root:

	```bash
	sudo ./sources.sh
	```

3. **Verifikasi Konfigurasi**:

	Periksa file `/etc/apt/sources.list.d/` untuk memastikan repositori telah dikonfigurasi dengan benar.

	Jalankan perintah `apt update` untuk memastikan tidak ada kesalahan dalam pembaruan daftar paket.

### Catatan Penting:

- Skrip ini dirancang untuk digunakan pada sistem Proxmox VE yang tidak memiliki langganan.
- Pastikan untuk memverifikasi konfigurasi repositori setelah menjalankan skrip untuk memastikan sistem Anda dapat memperbarui paket dengan benar.
- Skrip ini akan menonaktifkan repositori Proxmox VE Enterprise dan mengaktifkan repositori No-Subscription. Pastikan Anda memahami perubahan ini sebelum menjalankan skrip.
- Skrip ini tidak akan menghapus repositori yang sudah dikomentari sebelumnya, sehingga tidak akan ada perubahan pada repositori yang telah dinonaktifkan sebelumnya.
- Pastikan Anda menjalankan perintah ini dengan hak akses yang sesuai (misalnya, sebagai pengguna root atau menggunakan `sudo`) untuk memastikan skrip dapat memodifikasi file sistem yang diperlukan.
- Setelah menjalankan skrip, disarankan untuk memeriksa file konfigurasi repositori di `/etc/apt/sources.list.d/` untuk memastikan perubahan telah diterapkan sesuai keinginan Anda.
- Jika Anda menemui pesan kesalahan seperti `N: Repository 'http://ftp.debian.org/debian bookworm InRelease' changed its 'Version' value from '12.5' to '12.9'
`, Anda dapat menyelesaikannya dengan menjalankan perintah berikut:

	```bash
	sudo apt-get update --allow-releaseinfo-change
	```
