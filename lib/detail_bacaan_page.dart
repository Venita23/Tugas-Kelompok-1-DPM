import 'package:flutter/material.dart';

class DetailBacaanPage extends StatelessWidget {
  final String judul;
  final String gambar;
  final String sinopsis;

  const DetailBacaanPage({
    super.key,
    required this.judul,
    required this.gambar,
    required this.sinopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F4),
      body: SafeArea(
        child: Column(
          children: [
            // Header Gambar dan Tombol Kembali
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  color: const Color(0xFFFFD9E2),
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

            // Judul
            Text(
              judul,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Statistik
           // Sinopsis Box + Konten Button
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sinopsis:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          sinopsis,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),

        // Konten Button
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // TODO: Navigasi ke konten bab
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

            // Sinopsis Box
           

            const Spacer(),

            // Bawah: Konten dan Tombol
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
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

