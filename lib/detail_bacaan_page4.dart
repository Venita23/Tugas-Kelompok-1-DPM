import 'package:flutter/material.dart';
import 'bab01_page1.dart'; // pastikan file ini ada

class DetailBacaanPage1 extends StatelessWidget {
  final String judul;
  final String gambar;
  final String sinopsis;

  const DetailBacaanPage1({
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
                      'assets/SantriCantikIncaranGusAL.png',
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
                      'Sinopsis:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '“Ya Allah, jika dia gadis yang Kau kirimkan untuk menjadi jodohku, maka pertemukanlah aku dengannya. Dan jika dia hanya pemanis dalam mimpiku, maka hilangkanlah dia dalam mimpiku, karena kehadirannya sangat mengganggu perasaanku.”\n\n'
                      'Mendapatkan mimpi bertemu seorang gadis selama tiga tahun berturut-turut, Gus Alraz Al-Ghifari Maulana dibuat dilema akan kehadiran gadis tersebut, karena selama ini Gus Al — atau yang sering disapa Gus Al — tak pernah sekalipun bertemu dengannya.\n\n'
                      '“Abah, tiga tahun belakangan ini, Al selalu mendapatkan mimpi bertemu seorang gadis, tapi Al tidak mengenalnya, Abah. Apa maksud dari mimpi itu Abah?” tanya Gus Al.\n\n'
                      '“Kamu sudah Shalat Istikharah, Le?” tanya Abah.\n\n'
                      '“Sudah Abah, sejak diberi mimpi, Al langsung melaksanakan Shalat Istikharah. Hasilnya tetap sama, dia selalu datang di dalam mimpi Al,” jawab Gus Al.\n\n'
                      '“In sya Allah, dia adalah jodohmu, Le,” jawab Abah Zainuddin sambil tersenyum.\n\n'
                      '“Tapi Al tidak mengenalnya Abah dan tidak pernah bertemu sebelumnya,” lanjut Gus Al.\n\n'
                      '“In sya Allah, kalian akan dipertemukan dalam waktu dekat.”\n\n'
                      'Gus Al berharap apa yang dikatakan oleh sang Abah akan benar-benar terjadi.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
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
                            builder: (context) => const Bab01Page1(),
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
