# Tugas 7: Elemen Dasar Flutter

Nama : Kristo Jeremy Thady Tobing

Kelas : PBP-D

NPM : 2106633310

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

**Stateless widgets** adalah sebuah widget yang penampilannya tidak akan berubah, misalnya `Icon`, `IconButton`, dan `Text`. Stateless widgets merupakan subclass dari `StatelessWidget`. Kebalikannya adalah **stateful widgets**, widget jenis ini bersifat dinamis. Penampilan dari widget ini dapat berubah tegantung interaksi antara user dengan app. Contohnya adalah `Checkbox`, `Radio`, `Slider`, `InkWell`, `Form`, dan `TextField`. Stateless widgets merupkan subclass dari `StatefulWidget`.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Widget yang dipakai dalam proyek kali ini adalah `Floating Action Button`, `Icon`, dan `Text`. Berikut penjelasannya:
* **Floating Action Button** adalah widget yang digunakan untuk melakukan action, yaitu decrement dan increment counter. 
* **Icon** adalah widget yang digunakan untuk menampilkan gambar apa widget floating action button. Widget ini akan menampilkan gambar (-) untuk action button decrement dan gambar (+) untuk button increment.
* **Text** adalah widget yang menapilkan tulisan dalam proyek ini, yaitu, judul, tulisan ganjil/genap, dan counter.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

**setState()** berfungsi untuk memberitahu framework bahwa terdapat object yang berubah yang mungkin berdampak pada tampilan. Tanpa menggunakan setState(), maka perubahan dalam framework mungkin tidak akan di-*build* sehingga object tidak diperbarui. Pada proyek ini variabel yang terdampak setState() adalah object _counter, yaitu berisi counter yang akan dikenai fungsi increment dan decrement. Tanpa menggunakan setState() tampilan text yang berisi counter tsb. mungkin saja tidak terbarui.

## Jelaskan perbedaan antara const dengan final.

* **const** berarti menggunakan constant variabel hanya dari compile-time saja. Object yang menggunakan const menjadi deep state hanya pada compile time. Object yang menggunakn const menjadi frozen dan sepenuhnya tidak berubah.

* **final** berarti sebuah object hanya dapat *single-assignment*, yaitu nilai sebuah variabel tidak dapat diubah-ubah lagi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

* Pertama-tama, untuk membuat program flutter baru, perlu menjalankan perintah `fluter create counter_7` pada repositori lokal yang dituju.
* Kemudian, untuk mengimplementasikan logika decrement dan increment, perlu mengubah fungsi setState() sebagai berikut:
    ```java
    void _incrementCounter() {
        setState(() {
        _counter++;
        });
    }
    void _decrementCounter() {
        setState(() {
        _counter--;
        });
    }
    ```
* Selanjutnya, untuk mengubah warna text sesuai ganjil genapnya counter, dapat implementasikan menggunakan if-else condition sebagai berikut:
    ```C
    if(_counter%2 == 0)
        Text(
            'GENAP', style: TextStyle(color: Colors.red,),
        )
        else
        Text(
            'GANJIL', style: TextStyle(color: Colors.blue,)
        ),
    ```
* Terkahir, untuk melakukan trigger fungsi dengan button perlu diimplenetasikan sebagai berikut (sekaligus bonus):
    ```C
    floatingActionButton: Padding (
      padding: const EdgeInsets.only(left : 30), 
      child : Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        if (_counter > 0) FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove)
        ), 
        Expanded (child: Container ()),
        FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        )
    ```

