# Mobile - Fauzan Hadi
## Task 4: Flutter Fundamental - UI Katalog Produk

Proyek ini dibuat untuk memenuhi tugas individu **Task 4: Flutter Fundamental** dalam membangun antarmuka pengguna (User Interface) katalog produk menggunakan framework Flutter.

---

## 👤 Informasi Mahasiswa
* **Nama**: Fauzan Hadi
* **Kelas/Fokus**: Mobile
* **Tugas**: Task 4: Flutter Fundamental (Implementasi UI Katalog Produk)

---

## ⚙️ Widget Fundamental yang Diimplementasikan

Proyek ini telah berhasil menerapkan empat widget dasar utama dalam Flutter sesuai dengan standar industri:

1. **`Column`** (Vertikal):
   * Digunakan pada `CategoryItem` untuk menyusun ikon kategori dan nama teks secara vertikal.
   * Digunakan pada `ProductCard` untuk menyusun gambar produk dan informasi harga/diskon secara vertikal.
   * Digunakan pada layout utama `ProductCatalogScreen` untuk menumpuk search bar, kategori horizontal, dan grid produk secara teratur.
2. **`Row`** (Horizontal):
   * Digunakan pada baris harga produk untuk menyusun harga jual, harga asli (coret), dan badge diskon secara horizontal.
   * Digunakan pada header produk untuk menyusun jumlah produk yang aktif serta tombol toggle layout (grid/list).
   * Digunakan pada `ProductListTile` untuk menyusun gambar produk di sebelah kiri dan deskripsi/harga di sebelah kanan.
3. **`ListView`** (Scrolling):
   * **ListView Utama (Vertikal)**: Membungkus seluruh body halaman agar halaman katalog dapat di-scroll dari atas ke bawah dengan mulus.
   * **ListView Kategori (Horizontal)**: Menggunakan `ListView.separated(scrollDirection: Axis.horizontal)` sehingga daftar kategori di bagian atas dapat di-swipe ke kiri dan kanan.
   * **ListView Produk (Vertikal)**: Menggunakan `ListView.separated` untuk mode tampilan baris (List View) produk.
4. **`Image`** (Network Image):
   * Menggunakan `Image.network` untuk memuat foto produk berkualitas tinggi secara real-time dari internet (Unsplash) lengkap dengan loader dan error builder.

---

## 🎨 Fitur Tambahan & Kelebihan Desain
* 🔍 **Fitur Pencarian**: Dilengkapi dengan search bar interaktif yang memfilter daftar produk secara real-time berdasarkan query nama yang diketik.
* 🏷️ **Filter Kategori**: Mengklik salah satu kategori (misal: Shoes, Tshirt, Watch, dll) secara dinamis memfilter produk yang tampil di layar.
* ⊞ / ☰ **Toggle View Layout**: Pengguna dapat mengganti mode tampilan produk dengan satu tombol, beralih antara **Grid View (2 kolom)** dan **List View (baris lebar)** yang responsif.
* 🔴 **Premium UI/UX**: Dilengkapi dengan badge diskon merah yang menarik, bayangan kartu lembut (*shadows*), warna latar belakang yang sejuk (`0xFFF8F9FA`), serta warna merah premium aksen Material.
* 📱 **Kompatibilitas Penuh**: Menggunakan ikon Material bawaan luring (offline) yang menjamin **100% bebas dari CORS issues** dan dapat dimuat sempurna baik di Flutter Web, Android, iOS, maupun macOS.

---

## 📁 Struktur Folder Project

```text
lib/
├── main.dart                          # Entry point aplikasi
├── models/
│   ├── product_model.dart             # Model data produk
│   └── category_model.dart            # Model data kategori
├── data/
│   └── product_data.dart              # Dummy data produk & kategori
├── widgets/
│   ├── category_item.dart             # Card kategori horizontal
│   └── product_card.dart              # Card produk mode grid
└── screens/
    └── product_catalog_screen.dart    # Screen utama katalog produk
```

---

## 🚀 Cara Menjalankan Project

1. Pastikan Flutter SDK telah terpasang di komputer Anda.
2. Clone repositori ini ke komputer lokal Anda.
3. Buka terminal di direktori proyek dan jalankan:
   ```bash
   flutter pub get
   ```
4. Hubungkan emulator atau perangkat Anda, lalu jalankan:
   ```bash
   flutter run
   ```
