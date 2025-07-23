import 'package:flutter/material.dart';

class IsibabPage3 extends StatelessWidget {
  final String bab;

  const IsibabPage3({super.key, required this.bab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 248, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D4FF),
        elevation: 0,
        title: Text(
          bab,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Text(
                      // Cerita baru Liu Fei
                      '"Aaaaaaaaaaaaaaa....."\n\n'
                      'Di sebuah bangunan tua yang ada di dalam istana. Teriakan dan raungan seorang wanita menggema di sana.\n\n'
                      "'Istana dingin', merupakan sebuah bangunan tua yang diperuntukkan untuk para selir atau istri kaisar yang telah dicampakkan.\n\n"
                      "Bangunan tua itu telah menjadi saksi bisu kepedihan wanita yang kehilangan kasih sayang dan dikurung tanpa harapan.\n\n"
                      "Saat ini, seorang wanita berada di salah satu ruangan itu. Dua pengawal memegangi kakinya, dua pelayan menahan tangannya, dan dua tabib memaksa proses kelahiran.\n\n"
                      "Wanita itu adalah Liu Fei, putri bungsu dari keluarga jenderal ternama. Dahulu, hidupnya bergelimang kemewahan dan cinta.\n\n"
                      "Namun sejak jatuh cinta pada putra mahkota dan menjadi istrinya, hidup Liu Fei berubah menjadi neraka.\n\n"
                      "Setelah menjadi kaisar, sang suami justru menghancurkan keluarga Liu. Menuduh mereka pemberontak dan memusnahkan mereka, bahkan ibu Liu Fei yang tengah hamil turut dihukum mati.\n\n"
                      "Liu Fei dibuang ke Istana Dingin, bertahan hidup di tengah kegelapan, kelaparan, dan tikus. Satu-satunya harapan adalah bayi di kandungannya.\n\n"
                      "Namun di usia kandungan 8 bulan, ia dipaksa melahirkan secara paksa. Dalam kesakitan, ia memohon: \"Tolong selamatkan anakku...\"\n\n"
                      "\"Huh! Kau kira kau berhak meminta?!\" bentak pelayan.\n\n"
                      "\"Itu anak kaisar! Kenapa kalian ingin membunuh darah dagingnya?\" ratap Liu Fei.\n\n"
                      "\"Kaisar tidak peduli dengan anakmu! Selir Gufei—sepupumu—sedang mengandung pewaris yang sesungguhnya!\"\n\n"
                      "Tiba-tiba, terdengar pengawal berteriak: \"Kaisar memasuki ruangan!\"\n\n"
                      "Mata Liu Fei berbinar penuh harapan. Namun harapan itu pupus saat melihat sang suami datang menggandeng Liu An, sepupunya sendiri.\n\n"
                      "\"Hati-hati, udara ruangan ini buruk untukmu dan anak kita,\" ucap sang kaisar lembut pada Liu An.\n\n"
                      "\"Aku ingin melihat adikku untuk terakhir kali,\" kata Liu An dengan mata berkaca.\n\n"
                      "Liu Fei memohon: \"Kaisar... Tolong anak kita...\"\n\n"
                      "\"Anak itu? Tak layak lahir! Aku bahkan tidak menginginkannya di dunia ini!!\" balas sang kaisar dingin.\n\n"
                      "\"Bagaimana anda bisa...? Itu darah daging anda!\"\n\n"
                      "\"Kau tidak layak mengandung anakku! Pewarisku hanya akan lahir dari Liu An. Tabib, kenapa kalian belum membunuh anak itu?!\"\n\n"
                      "Tangis Liu Fei pecah. Dalam luka dan pengkhianatan, ia hanya bisa menjerit... hingga akhirnya, arwahnya bangkit kembali. Dewa memberinya kesempatan kedua.\n\n"
                      "Saat membuka mata, ia kembali di usia 13 tahun, tepat sebelum semuanya dimulai.\n\n"
                      "Kini, ia berjanji... Akan membalas semua yang telah menghancurkan hidupnya.",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi untuk ke halaman selanjutnya (jika ada)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003D82),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Selanjutnya",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
