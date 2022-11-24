# Tugas 9: Integrasi Web Service pada Flutter

Nama : Kristo Jeremy Thady Tobing

Kelas : PBP-D

NPM : 2106633310

##  Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Umumnya terdapat dua metode untuk pengambilan data JSON *Manual serialization* dan *Automated serialization*. Pada proyek ini, metode yang digunakan adalah *Manual seriazlization* yang memanfaatkan sebuah class pemodelan, `dart:convert`, fungsi `jsonDecode()`, dan `Map<String,dynamic>`. Metode ini tidak cocok untuk pengambilan json berskala besar.

Disisi lain, metode *Automated serialization* tidak menggunakan class pemodelan untuk mengambil json, tetapi menggunakan external library seperti `json_serializable` dan `built_value`. Metode ini lebih cocok digunakan untuk pengambilan data berskala menengah hingga besar.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

* `AppBar` dan `Drawer` untuk menampilkan bar diatas page dan navigasi ke page lain.
* `Column`, `Padding`, `Align`, `ListView`, `Container` yang berfungsi untuk merapihkan dan mengatur layout.
* `SizedBox` untuk menambahkan ruang kosong.
* `FutureBuilder` untuk melakukan built dari snapshot hasil pengambilan json.
* `TextButton` untuk membuat tombol
* `Text`, `TextSpan`, `RichText` untuk menampilkan tulisan dan modifikasinya.

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

* Menambahkan *dependency* `http` ke proyek, *dependency* digunakan untuk pengambilan data melalui HTTP request.
* Membuat pemodelan sesuai dengan respons dari data yang berasal dari *web service* tersebut.
* Membuat *http request* ke *web service* menggunakan *dependency* `http`.
* Mengkonversikan objek yang didapatkan dari *web service* ke model yang telah kita buat di langkah kedua.
* Menampilkan data yang telah dikonversi ke aplikasi dengan `FutureBuilder`.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas

* Membuat folder `lib/page` dan `lib/model` yang mana file dart yang berisi halaman akan berada di `page` dan model akan berada di `model`.
* Membuat tiga file baru, `my_watchlist_json.dart` untuk model dan `my_watchlist.dart` dan `watchlist_detail.dart`untuk page.
* Membuat file dart Menambahkan halaman `WatchlistPage` pada drawer.
* Membuat model untuk pengambilan json menggunakan website Quicktype. Model kemudian disalin ke `my_watchlist_json.dart`.
* Menambahkan package `http` dengan `flutter pub add http` dan menambahkan potongan kode `<uses-permission android:name="android.permission.INTERNET" />` pada file `android/app/src/main/AndroidManifest.xml`.
* Membuat class pemgambilan dari menggunakan metode `http.get`.
    ```dart
    class _WatchlistPage extends State<WatchlistPage>{
        Future<List<Mywatchlist>> fetchMywatchlist() async {
            var url = Uri.parse('https://pbptugas2kristo.herokuapp.com/mywatchlist/json/');
            var response = await http.get(
            url,
            headers : {
                "Access-Control-Allow-Origin": "*",
                "Content-Type": "application/json",
            }, 
            );

            var data = jsonDecode(utf8.decode(response.bodyBytes));

            List<Mywatchlist> listWatchlist = [];
                for (var d in data) {
                if (d != null) {
                    listWatchlist.add(Mywatchlist.fromJson(d));
                }
                }

        return listWatchlist;
    }
    ```
* Menampilkan judul film menggunakan `FutureBuilder` dan `TextButton` agar *clickable*. `onPressed` button akan berpindah ke halaman `WatchlistDetailPage` untuk menampilkan informasi film yang bersesuaian dengan judul.
* Halaman `WatchlistDetailPage` berisi tanggal rilis, rating, status, review, dan tombol back ke halaman `WatchlistPage`.
* [BONUS] Memberikan kondisi if-else untuk mengganti warna pada `boxShadow`.