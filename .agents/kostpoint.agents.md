# Kost Point Mobile - AI Agent Instructions

## Project Context

- Nama: Kost Point Mobile (Sistem Pencarian Kos Berbasis Kalkulasi Jarak Otomatis dan Ketersediaan Kamar Real-Time)
- Framework: Flutter (Dart)
- Target: Android
- UI: Material Design 3 (Modern, Minimalis, Soft)
- State Management: Provider

## Agent Rules

1. ARSITEKTUR: Gunakan pola Feature-First di dalam `lib/` (`core`, `shared`, `features/auth`, `features/mahasiswa`, `features/pemilik`). Jangan campur UI, Model, dan Logic dalam satu file.
2. WIDGET: Pecah widget yang lebih dari 80 baris menjadi sub-widget/komponen terpisah. Wajib gunakan `const` untuk widget statis.
3. STATE & LOGIC: Pisahkan logika bisnis dari UI. Jangan menaruh operasi perhitungan jarak atau manipulasi data langsung di dalam `onPressed`.
4. STYLING: Wajib memanggil warna dan tipografi dari `ThemeData` (`lib/core/theme/app_theme.dart`). Dilarang _hardcode_ warna di widget.
5. FITUR PREMIUM: Data kos dengan `isPremium == true` wajib selalu diurutkan paling atas (sebelum diurutkan berdasarkan jarak terdekat) dan diberi aksen visual Emas (#FFC107).
6. WORKFLOW: Analisis struktur proyek sebelum mengubah kode. Jangan menghapus fitur yang sudah berjalan. Jangan menyimpan API key secara _hardcoded_.

## Project Context Files

Baca dokumen berikut sebelum mengeksekusi fitur:

- docs/project_context.md
- docs/features.md
- docs/ui_guidelines.md

## Workflow Eksekusi

1. Pahami kebutuhan fitur yang diminta pengguna.
2. Periksa kode yang sudah tersedia di direktori `lib/`.
3. Buat rencana perubahan singkat.
4. Implementasikan fitur dengan kode yang modular.
5. Jalankan `flutter analyze` untuk memastikan 0 warning/error.
