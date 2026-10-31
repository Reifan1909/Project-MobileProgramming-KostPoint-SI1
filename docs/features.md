# Spesifikasi Fitur Kost Point

## 1. Fitur Umum (Auth)

- Login & Register dengan pilihan Role: "Mahasiswa" atau "Pemilik Kos".

## 2. Fitur (Pencari Kos)

- Pilih Kampus, sekolah, atau kantor & Kalkulasi Jarak Otomatis: Memilih nama kampus tujuan (serta opsi lokasi GPS saat ini) untuk menghitung jarak (km) dan estimasi menit waktu tempuh (motor/jalan kaki) ke gerbang kampus.
- Katalog & Urutan Kos: Menampilkan daftar kos. Kos dengan status "Premium" (`isPremium: true`) selalu tampil di urutan teratas, diikuti urutan kos dengan jarak paling strategis/terdekat.
- Ketersediaan Kamar Real-Time: Menampilkan sisa kuota kamar secara live (misal: "Sisa 2 Kamar" atau "Penuh").
- Detail Kos & Tur Virtual: Menampilkan harga, fasilitas, foto, video tur, titik pin peta lokasi, dan ulasan/rating.
- Kontak Langsung via WhatsApp: Tombol yang langsung membuka aplikasi WhatsApp menuju nomor pemilik kos dengan teks template otomatis tanpa perantara.
- Fitur Rating & Ulasan: Mahasiswa dapat melihat dan memberikan rating bintang (1-5) pada kos.

## 3. Fitur Pemilik Kos (Admin)

- Manajemen Iklan & Kamar: Input harga, fasilitas, unggah foto & video tur, serta menandai satu titik koordinat lokasi di peta digital.
- Update Kuota Kamar Real-Time: Mengubah jumlah kamar kosong dan kamar terisi dengan cepat (tombol +/- sederhana).
- Upgrade Kos Pro / Premium: Fitur berlangganan/aktivasi status "Kos Pro" agar kos milik mereka muncul di beranda paling atas halaman mahasiswa dengan badge khusus.
