# Tugas 8: Flutter Form

Nama : Kristo Jeremy Thady Tobing

Kelas : PBP-D

NPM : 2106633310

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
* **Navigator.push()** adalah metode untuk menambahkan routing ke stack screen, yang berarti halaman baru ditampilkan di atas halaman sebelumnya

* **Navigator.pushReplacement()** adalah metode untuk menambahkan routing tanpa menggunakan stack, yang berarti melakukan push routing baru dan menghapus routing sebelumnya jika dijalankan. 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* `AppBar` berfungsi untuk memberikan bar diatas laman yang dapat berisikan identitas
* `Drawer` berfungsi sebagai navigasi untuk berpindah ke page lain
* `FloatingActionButton` berfungsi sebagai tombol trigger untuk melakukan sebuah perintah
* `Form` berfungsi untuk membuat sebuah form dalam flutter
* `TextFormField` berfungsi sebagai kolom submisi dengan format text dalam form
* `DropdownButtonField` berfungsi untuk menampilkan menu dropdown untuk jenis pengisian form
* `Card` berfungsi untuk membungkus informasi data budget 
* `Text` berfungsi untuk menampilkan tulisa


## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
* `onPressed` untuk mengeksekusi fungsi terkait ketika button di-*pressed*
* `onChanged` untuk menambahkan perubahan pada sebuah ketika user melakukan perubahan value pada *field*
* `onSaved` berfungsi untuk memanggil final value ketika nilai *field* disimpan
* `onTap` untuk memanggil fungsi jika widget di-`tap`


## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Dalam proyek ini, metode yang digunakan untuk mengganti halaman adalah dengan routing menggunakan `Navigator.push()` atau `Navigator.pushReplacement()`. Handle untuk berpindah halaman tersimpan dalam `drawer`. 
```C++
Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute()),);
```    
Potongan kode tersebut menjadi sebuah perintah berpindah halaman, umumnya dilakukan dengan trigger `onPressed` atau `onTap` pada widget.Pada `MaterialPageRoute` akan menunjuk ke halaman yang dituju, yaitu halaman `SecondRoute()`.


## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

* Menambahkan drawer/hamburger menu pada app yang telah dibuat sebeumnya. Dilakukan dengan menambahkan widget drawer dan tiga ListTile yang jika dipencet akan melakukan routing ke masing2 halaman menggunakan `Navigator.pushReplacement()`.
* Menambahkan halaman form. Terdapat empat widget dalam halaman form, yaitu dua `TextFormField` untuk judul dan nominal, `DropdownMenuFormField` untuk jenis budget, dan `FloatingActionButton` untuk submit. Untuk FormField dilakukan handle action untuk `onPressed` dan `onSaved` beserta melakukan validasi sesuai tipe input. Sedangkan Button, diberikan handle action `onPressed` untuk memasukan tiga data tersebut dalam bentuk class User kedalam list.
* Menambahkan halaman data Budget. Data yang sudah dimasukan dalam list akan ditambahkan satu-satu dengan bantuan `builder` yang berisikan `itemCount` untuk indexing dan `itemBuilder`. Masing-masing akan dimasukan kedalam ListView yang berisikan widget `card`. Untuk menata elemen, digunakan `ListTile` dengan title untuk judul dan subtitle untuk nominal serta tipe budget.
* **Bonus Refactor widget Drawer ke sebuah file terpisah.** Widget drawer ditempatkan di file.dart terpisah. Untuk memanggilnya dapat dilakukan dengan memanggil nama widget drawer, contoh `drawer(context)`.

