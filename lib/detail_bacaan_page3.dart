import 'package:flutter/material.dart';
import 'bab01_page2.dart'; // pastikan file ini ada

class DetailBacaanPage2 extends StatelessWidget {
  final String judul;
  final String gambar;
  final String sinopsis;

  const DetailBacaanPage2({
    super.key,
    required this.judul,
    required this.gambar,
    required this.sinopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 248, 255),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  color: const Color(0xFFB3D4FF),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 80,
                  left: MediaQuery.of(context).size.width / 2 - 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      gambar,
                      width: 120,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              judul,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Sinopsis:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Liu Fei wanita keturunan bangsawan yang jatuh cinta pada putra mahkota. '
                      'Dia bahkan akan merelakan segala nya untuk mendapatkan pria yang ia cintai. '
                      'Namun sayangnya setelah dia mendapatkan apa yang dia inginkan, ia justru hidup menderita. '
                      'Pria yang ia cintai dengan segenap jiwa dan raga nya justru merupakan orang yang begitu kejam meghancurkan dirinya. '
                      'Tidak cukup dengan membunuh seluruh keluarga dan mengirimkan nya ke istana dingin. Pria itu dengan kejam membunuh bayi yang ada dalam kandungannya. '
                      'Dengan darah yang masih mengalir dari tubuh nya ia diseret dan dijatuhi hukuman mati dengan tuduhan penghianatan dan pemberontakkan. '
                      'Kepala nya dipenggal dan kepala nya di gantung di gerbang kota untuk menunjukkan pada semua orang tentang dosa yang tidak pernah ia lakukan selama hidupnya. '
                      'Arwah nya melihat semua itu dan menjerit atas ketidakadilan yang menimpa diri nya. Ternyata ,,, dewa mendengar jeritan nya dan memberikan kesempatan hidup kembali. '
                      'Saat ia membuka kedua mata nya ia kembali di usia nya yang 13 tahun. Tepat sebelum dia berulang tahun yang ke 14. '
                      'Saat itu juga dia berjanji pada diri nya sendiri, akan membalas semua yang telah dilakukan oleh orang - orang yang dulu nya telah begitu kejam menghancurkan hidupnya. '
                      '"Dalam hidup ini aku akan memilih \'Dia\' menjadi suamiku!!".',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Bab01Page2(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.menu_book, size: 18, color: Colors.black),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Konten',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text(
                            '150 Bab >',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003D82),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Lanjut Baca',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
