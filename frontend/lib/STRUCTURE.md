# Struktur Direktori & Halaman (lib/)

Dokumentasi ini menjelaskan isi direktori `frontend/lib/`, termasuk halaman
apa saja yang ada di Bottom Navigation Bar, agar mudah dipahami tanpa harus
membaca seluruh kode.

## Daftar File

| File | Peran | Route awal |
|---|---|---|
| [main.dart](main.dart) | Entry point aplikasi (`main()` + `MyApp`). Membungkus app dengan `KeyboardVisibilityProvider` dan membuka `loginScreen` sebagai halaman pertama. | Root |
| [loginscreen.dart](loginscreen.dart) | Halaman login (NIM + Password). Setelah tap tombol LOGIN, navigasi `pushReplacement` ke `HomeScreen`. | `/` (home screen app) |
| [home.dart](home.dart) | Shell utama aplikasi setelah login. Berisi `IndexedStack` + memanggil widget **`NavBottom`** sebagai bottom navigation bar kustom (bukan `BottomNavigationBar` bawaan Flutter). | Setelah login |
| [navigation/nav_bottom.dart](navigation/nav_bottom.dart) | Widget `NavBottom` — bottom navigation bar kustom yang reusable, dipakai oleh `home.dart`. | — |
| [todayscreen.dart](todayscreen.dart) | Tab 1 (Beranda) — Dashboard akademik mahasiswa: `AcademicInformationCard` (jadwal kuliah hari ini), quick menu akademik 4x2 (8 menu), dan Pengumuman. | Tab index `0` |
| [pembayaranscreen.dart](pembayaranscreen.dart) | Tab 2 (Pembayaran) — Daftar tagihan pembayaran mahasiswa/pegawai. Saat ini empty state ("Belum Ada Tagihan"). | Tab index `1` |
| [menuscreen.dart](menuscreen.dart) | Tab 3 (Menu) — Grid menu ke fitur sekunder: Riwayat Absensi, Wisuda, Skripsi, Kuesioner. Masing-masing dibuka lewat `Navigator.push` (bukan tab). | Tab index `2` |
| [profilescreen.dart](profilescreen.dart) | Tab 4 (Akun) — Daftar profil/anggota tim (list card nama, jabatan, foto). | Tab index `3` |
| [calendarscreen.dart](calendarscreen.dart) | Riwayat/kalender absensi ("Riwayat Absensi" / "Daftar Kehadiran"), list tanggal + status kehadiran. Dibuka dari grid di `menuscreen.dart` dan dari quick menu akademik di `todayscreen.dart`. | Diakses dari Menu & Beranda |
| [wisudascreen.dart](wisudascreen.dart) | Halaman info wisuda (placeholder/empty state). Dibuka dari grid di `menuscreen.dart`. | Diakses dari Menu |
| [skripsiscreen.dart](skripsiscreen.dart) | Halaman pengajuan skripsi (placeholder/empty state). Dibuka dari grid di `menuscreen.dart`. | Diakses dari Menu |
| [kuesionerscreen.dart](kuesionerscreen.dart) | Halaman kuesioner (placeholder/empty state). Dibuka dari grid di `menuscreen.dart` dan dari quick menu akademik di `todayscreen.dart`. | Diakses dari Menu & Beranda |
| [krsscreen.dart](krsscreen.dart) | Halaman Kartu Rencana Studi (placeholder/empty state). Dibuka dari quick menu akademik di `todayscreen.dart`. | Diakses dari Beranda |
| [jadwalkuliahscreen.dart](jadwalkuliahscreen.dart) | Halaman Jadwal Kuliah (placeholder/empty state). Dibuka dari quick menu akademik di `todayscreen.dart`. | Diakses dari Beranda |
| [khsscreen.dart](khsscreen.dart) | Halaman Kartu Hasil Studi (placeholder/empty state). Dibuka dari quick menu akademik di `todayscreen.dart`. | Diakses dari Beranda |
| [transkripnilaiscreen.dart](transkripnilaiscreen.dart) | Halaman Transkrip Nilai (placeholder/empty state). Dibuka dari quick menu akademik di `todayscreen.dart`. | Diakses dari Beranda |
| [kartuujianscreen.dart](kartuujianscreen.dart) | Halaman Kartu Ujian (placeholder/empty state). Dibuka dari quick menu akademik di `todayscreen.dart`. | Diakses dari Beranda |
| [komponennilaiscreen.dart](komponennilaiscreen.dart) | Halaman Komponen Nilai (placeholder/empty state). Dibuka dari quick menu akademik di `todayscreen.dart`. | Diakses dari Beranda |
| [widgets/empty_state.dart](widgets/empty_state.dart) | Widget `EmptyState` reusable (icon + title + message) dipakai oleh halaman yang belum punya data nyata (Pembayaran, Wisuda, Skripsi, Kuesioner, KRS, Jadwal Kuliah, KHS, Transkrip Nilai, Kartu Ujian, Komponen Nilai). | — |
| [widgets/academic_information_card.dart](widgets/academic_information_card.dart) | Widget `AcademicInformationCard` reusable — kartu info jadwal kuliah hari ini (mata kuliah, jam, dosen, ruangan, badge status) dipakai di `todayscreen.dart`. | — |
| [widgets/academic_menu_item.dart](widgets/academic_menu_item.dart) | Widget `AcademicMenuItem`/`AcademicMenuItemData` reusable — satu tile shortcut menu akademik (ikon pastel + label) dipakai di `todayscreen.dart`. | — |

## Bottom Navigation (navigation/nav_bottom.dart)

Bottom nav adalah widget terpisah `NavBottom` di
[navigation/nav_bottom.dart](navigation/nav_bottom.dart), dipanggil dari
`_HomeScreenState` ([home.dart](home.dart)) lewat properti
`currentIndex` + callback `onTap`. Implementasinya memakai
`Row` dari `Expanded` + `GestureDetector` (bukan widget
`BottomNavigationBar` Flutter). Urutan tab mengikuti urutan
`_navigationIcon`/`_navigationLabel` di `NavBottom` dan
`IndexedStack.children` di `home.dart`:

| Index | Icon (FontAwesome) | Label | Screen | Keterangan |
|---|---|---|---|---|
| 0 | `house` | Beranda | `TodayScreen` | Absensi hari ini |
| 1 | `wallet` | Pembayaran | `PembayaranScreen` | Tagihan pembayaran |
| 2 | `tableCells` | Menu | `MenuScreen` | Grid ke Riwayat Absensi, Wisuda, Skripsi, Kuesioner |
| 3 | `user` | Akun | `ProfileScreen` | Profil/daftar pegawai |

Catatan implementasi:
- State aktif tab (`currentIndex`, default `0`) tetap disimpan di
  `_HomeScreenState` (`home.dart`); `NavBottom` hanya widget tampilan yang
  menerima `currentIndex` + `onTap`.
- Warna aktif memakai `_primary = Color(0xFF174A96)` (navy resmi sesuai
  `CLAUDE.md`), warna tidak aktif `Color(0xFF718096)`.
- Setiap tab menampilkan label teks kecil di bawah icon (11px) selain
  indikator garis (`Container` 3x22) untuk tab yang aktif.
- Tab "Menu" bukan halaman fitur sendiri — isinya grid kartu yang masing-masing
  melakukan `Navigator.push` ke halaman fitur terkait (lihat
  [menuscreen.dart](menuscreen.dart)).

## Halaman di Luar Bottom Navigation

- `loginscreen.dart` — halaman sebelum masuk ke `HomeScreen`, sudah mengikuti
  palet warna & struktur dari `CLAUDE.md` (navy header, curved transition,
  logo asli di `images/logo-gli.png`).

## Assets

- `images/` — berisi logo institusi (`logo-gli.png`) dan foto-foto profil
  (`osman.jpg`, `user2.png`–`user9.png`) yang dipakai di `profilescreen.dart`.
  Terdaftar di `pubspec.yaml` melalui `assets: - images/`.

## Gap / Catatan untuk Pekerjaan Berikutnya

1. `calendarscreen.dart`, `profilescreen.dart` masih pakai warna & font
   ad-hoc di dalam body (mis. `Colors.deepOrange`, warna acak per kartu di
   `profilescreen.dart`) — belum diseragamkan dengan design system di
   `CLAUDE.md`. `home.dart`, `todayscreen.dart`, `loginscreen.dart`,
   `nav_bottom.dart`, `pembayaranscreen.dart`, `menuscreen.dart`,
   `wisudascreen.dart`, `skripsiscreen.dart`, `kuesionerscreen.dart`, dan
   `widgets/` sudah menjadi acuan yang benar (navy `#174A96`, spacing &
   radius sesuai `CLAUDE.md`).
2. `profilescreen.dart` berisi data dummy (nama & foto contoh), belum
   terhubung ke data pegawai sebenarnya. Juga masih dipakai sebagai tab
   "Akun" walau isinya daftar tim, bukan profil pengguna yang login — perlu
   diganti kontennya saat data akun pengguna tersedia.
3. `pembayaranscreen.dart`, `wisudascreen.dart`, `skripsiscreen.dart`,
   `kuesionerscreen.dart`, `krsscreen.dart`, `jadwalkuliahscreen.dart`,
   `khsscreen.dart`, `transkripnilaiscreen.dart`, `kartuujianscreen.dart`,
   dan `komponennilaiscreen.dart` masih berupa halaman placeholder
   (`EmptyState`), belum terhubung ke data/API sebenarnya. `todayscreen.dart`
   juga masih memakai data jadwal kuliah & pengumuman dummy (statis), belum
   terhubung ke data akademik mahasiswa sebenarnya.
4. Belum ada routing bernama (`/login`, `/home`, dst.) — navigasi masih
   langsung lewat `MaterialPageRoute` manual.
5. Bottom navigation (`nav_bottom.dart`) tetap mempertahankan 4 tab yang
   sudah berjalan (Beranda/Pembayaran/Menu/Akun) alih-alih diganti menjadi
   Beranda/Akademik/Notifikasi/Akun, supaya fitur Pembayaran dan Menu yang
   sudah ada tidak kehilangan akses navigasi.
