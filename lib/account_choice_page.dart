import 'package:flutter/material.dart';
import 'home_page.dart'; // import halaman Home

class AccountChoicePage extends StatelessWidget {
  final String loginMethod; // "Google" atau "Facebook"

  const AccountChoicePage({super.key, required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    final isGoogle = loginMethod == "Google";
    final iconAsset = isGoogle ? 'assets/google.png' : 'assets/facebook.png';

    final accounts = [
      {"name": "Venita Amelia", "email": "venitaaa@gmail.com", "color": Colors.black},
      {"name": "Wenita Amelia", "email": "wenitaaa@gmail.com", "color": Colors.red},
      {"name": "Ronald Alexandro", "email": "ronalddd@gmail.com", "color": Colors.purple},
      {"name": "Niren", "email": "nirennn@gmail.com", "color": const Color.fromARGB(255, 39, 50, 176)},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              "Pilih Akun",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.black26,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Image.asset(iconAsset, height: 30),
            const SizedBox(height: 4),
            const Text(
              "untuk melanjutkan ke MY NOVEL'S",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 24),

            // List akun
            ...accounts.map((account) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                  border: Border.all(color: Color(0xFF003D82),width: 2),
                ),
                child: ListTile(
                  leading: Icon(Icons.account_circle, color: account['color'] as Color),
                  title: Text(
                    isGoogle
                        ? account['name'] as String
                        : '${account['name'] as String}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    isGoogle
                        ? account['email'] as String
                        : (account['email'] as String).length > 22
                            ? "${(account['email'] as String).substring(0, 22)}..."
                            : account['email'] as String,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // 👉 Ganti ke halaman Home setelah pilih akun
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              );
            }),

            const SizedBox(height: 16),

            // Catatan privasi
            if (isGoogle)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text.rich(
                  TextSpan(
                    text:
                        "Untuk melanjutkan, Google akan membagikan nama, alamat email, dan foto profil Anda ke MY NOVEL'S. Sebelum menggunakan aplikasi ini, tinjau ",
                    style: const TextStyle(fontSize: 12),
                    children: [
                      TextSpan(
                        text: 'kebijakan privasi',
                        style: TextStyle(color: Colors.blue.shade700),
                      ),
                      const TextSpan(text: ' dan '),
                      TextSpan(
                        text: 'persyaratan layanan',
                        style: TextStyle(color: Colors.blue.shade700),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                  textAlign: TextAlign.justify,
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Image.asset('assets/meta.png', height: 50),
              )
          ],
        ),
      ),
    );
  }
}