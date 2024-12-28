# Aplikasi Todo List Flutter

Aplikasi Todo List sederhana yang dibangun dengan framework Flutter.

## Fitur

- CRUD tugas
- Menandai tugas sebagai "completed"
- Menyimpan tugas secara lokal menggunakan SQLite
- Pengelolaan state menggunakan pola BLoC

## Teknologi yang Digunakan

- **Flutter**

## Prasyarat

Pastikan Anda telah menginstal hal-hal berikut:

- Flutter (versi 3.2.0 atau yang lebih tinggi)
- Dart (versi 2.17.0 atau yang lebih tinggi)
- Android Studio / VS Code dengan ekstensi Flutter
- Git

## Langkah-langkah Instalasi

1. Clone repository:
   ```bash
   git clone https://github.com/namaanda/flutter_todo_app.git
   cd flutter_todo_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate kode serialisasi JSON:
   ```bash
   flutter pub run build_runner build
   ```

4. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Struktur Proyek

```
lib/src/
├── common/                 # Konfigurasi umum pada projek
├── data/                   # File repository dan API
├── database/               # Manajemen storage menggunakan Drift
├── handler/                # Handler aplikasi seperti handler error/exception
├── injector/               # Dependency injector
├── models/                 # Model data
├── router/                 # Route pada aplikasi (GoRouter) --- FITUR TAMBAHAN
├── services/               # Penyimpanan sementara / cache menggunakan SharedPreferences
├── state/                  # File terkait BLoC state
├── ui/                     # User Interface
├── widgets/                # Widgets terpisah yang digunakan untuk UI pada halaman tertentu
└── app.dart                # Inisialisasi BLOC dan MaterialApp
└── main.dart               # Titik masuk aplikasi
```

## Skema Database

Database SQLite berisi satu tabel dengan struktur berikut:

```sql
CREATE TABLE task(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT,
  dueDate DATETIME,
  status TEXT
);
```

## Dependencies

Tambahkan dependencies berikut ke `pubspec.yaml` Anda:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_floating_bottom_bar: ^1.2.1+1
  flutter_bloc: ^8.1.6
  go_router: ^14.6.2
  drift: ^2.18.0
  drift_sqflite: ^2.0.1
  uuid: ^4.5.1
  shared_preferences: ^2.3.4
  get_it: ^8.0.3
  dio: ^5.7.0
  freezed_annotation: ^2.4.4
  path_provider: ^2.1.5
  json_annotation: ^4.0.0
  fluttermoji: ^1.0.2
  flutter_svg: ^2.0.16
  bottom_picker: ^2.9.0
  retrofit: ^4.4.1
  intl: ^0.20.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  freezed: ^2.5.2
  freezed_annotation:
  retrofit_generator: ^9.1.5
  drift_dev: ^2.18.0
  build_runner:
  build_runner_core:
  analyzer: ^6.4.1
```

## Cara Penggunaan

1. Buka aplikasi dan login dengan email (eve.holt@reqres.in) dan password (cityslicka)
2. Tekan tombol '+' untuk menambah tugas baru
3. Isi detail tugas dan simpan
4. Geser ke kiri untuk menghapus tugas
5. Tekan pada icon pensil untuk edit data dan menandainya sebagai selesai
6. Gunakan opsi filter untuk melihat semua tugas, tugas aktif, atau tugas yang sudah selesai
6. Tekan tombol search untuk mencari tugas

## Informasi

Todo App

Created by:
Ardith Lutfiawan
Copyright @2024