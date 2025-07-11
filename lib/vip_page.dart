import 'package:flutter/material.dart';

class VIPPage extends StatelessWidget {
  const VIPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "VIP",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20, // Sama seperti tulisan "Riwayat"
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Anda sudah\nmenjadi pembaca\nVIP 👑",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 1),
              const Text(
                "Manfaat pembaca VIP",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "Paket VIP👑",
                        style: TextStyle(
                          backgroundColor: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Bebas iklan"),
                      Text("Unduh tak terbatas"),
                      Text("Kunci konten terbuka"),
                      Text("Lencana VIP eksklusif"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              const Text(
                "Paket secara otomatis diperpanjang di siklus berikutnya sampai dibatalkan.",
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 10),
              const Text(
                "Akun VIP hanya dapat terhubung maksimal 3 perangkat",
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 10),
              const Text(
                "Dengan melanjutkan, Anda menyetujui Ketentuan Penggunaan dan Ketentuan Langganan My novel’s, serta menerima kebijakan Privasi My novel’s",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
