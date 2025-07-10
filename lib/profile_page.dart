import 'package:flutter/material.dart';
import 'pengaturan_akun.dart';
import 'preferensi_bacaan.dart';
import 'riwayat.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> gambarBacaan = [
      "assets/KinantiAsmaraDuaDunia.jpeg",
      "assets/IstriCantikSangPanglima.jpeg",
      "assets/Vimala.jpeg",
      "assets/StayWithMe.jpeg",
      "assets/CelestiaMenjadiPengantinKaisar.jpeg",
      
    ];

    return Scaffold(
      backgroundColor: Colors.white,
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

              // Gambar Bacaan Terakhir
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: gambarBacaan.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          gambarBacaan[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),
              buildSettingsCard([
                ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Pengaturan Akun"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PengaturanAkun()),
                    );
                  },
                ),

                ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Preferensi Bacaan"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PreferensiBacaan()),
                    );
                  },
                ),
                settingItem(Icons.subscriptions, "Langganan"),

                 ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Riwayat"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Riwayat()),
                    );
                  },
                ),
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
                child: const Text("Log Out", style: TextStyle(color: Colors.white)),
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