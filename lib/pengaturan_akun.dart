import 'package:flutter/material.dart';

class PengaturanAkun extends StatelessWidget {
  const PengaturanAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Pengaturan Akun",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          ListTile(
            title: Text("Bahasa"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Bahasa Indonesia"),
                SizedBox(width: 8),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
          ListTile(
            title: Text("Usia"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("18 - 24"),
                SizedBox(width: 8),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
          ListTile(
            title: Text("Kosongkan ruang"),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title: Text("Akun Saya"),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title: Text("Periksa Pembaruan"),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title: Text("Tentang"),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
