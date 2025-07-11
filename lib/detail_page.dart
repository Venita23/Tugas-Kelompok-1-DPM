import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Novel'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Sampul Novel
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/400/200', // Ganti URL jika ada gambar lain
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Judul dan Penulis
              const Text(
                'Judul Novel: Cinta di Ujung Senja',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Penulis: Venita Amelia',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Deskripsi Novel
              const Text(
                'Deskripsi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ini adalah kisah cinta yang penuh liku dan emosi, '
                'berlatar di sebuah kota kecil di tepi laut. '
                'Novel ini membawa pembaca pada perjalanan batin seorang wanita '
                'yang menghadapi kehilangan dan harapan baru.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              // Tombol Baca Bab
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan aksi ke halaman bab atau pembaca
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Mulai membaca...')),
                    );
                  },
                  child: const Text('Mulai Membaca'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
