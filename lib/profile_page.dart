import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(), // pastikan ini
    );
  }
}

// Copy seluruh kode ProfilePage di bawah sini
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: const Color.fromARGB(255, 40, 101, 244),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bacaan'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Genre'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Profil", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.account_circle, size: 50),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Venita Amelia ✒", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("VIP", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bacaan Terakhir", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Lihat semua", style: TextStyle(color: Colors.red)),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 3, 16),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text("Cover ${index + 1}"),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              buildSettingsCard([
                settingItem(Icons.settings, "Pengaturan Akun"),
                settingItem(Icons.favorite_border, "Preferensi Bacaan"),
                settingItem(Icons.subscriptions, "Langganan"),
                settingItem(Icons.history, "Riwayat"),
              ]),
              const SizedBox(height: 12),
              buildSettingsCard([
                settingItem(Icons.feedback_outlined, "Bantuan & Umpan Balik"),
                settingItem(Icons.info_outline, "Tentang Aplikasi"),
                settingItem(Icons.mail_outline, "Kotak Masuk"),
                settingItem(Icons.create_outlined, "Menjadi Penulis"),
              ]),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 61, 130),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Log Out", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildSettingsCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
      ),
      child: Column(children: children),
    );
  }

  static Widget settingItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}