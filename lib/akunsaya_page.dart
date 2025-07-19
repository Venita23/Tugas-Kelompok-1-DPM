import 'package:flutter/material.dart';

class AkunSayaPage extends StatefulWidget {
  const AkunSayaPage({super.key});

  @override
  State<AkunSayaPage> createState() => _AkunSayaPageState();
}

class _AkunSayaPageState extends State<AkunSayaPage> {
  final TextEditingController _passwordLamaController = TextEditingController();
  final TextEditingController _passwordBaruController = TextEditingController();
  final TextEditingController _konfirmasiPasswordController = TextEditingController();

  bool _showPasswordLama = false;
  bool _showPasswordBaru = false;
  bool _showKonfirmasiPassword = false;

  void _gantiPassword() {
    final lama = _passwordLamaController.text;
    final baru = _passwordBaruController.text;
    final konfirmasi = _konfirmasiPasswordController.text;

    if (lama.isEmpty || baru.isEmpty || konfirmasi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Silakan isi semua kolom terlebih dahulu"),
          backgroundColor: Color.fromARGB(255, 245, 26, 26),
        ),
      );
      return;
    }

    if (baru != konfirmasi) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password baru dan konfirmasi tidak cocok"),
          backgroundColor: Color.fromARGB(255, 245, 26, 26),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password berhasil diganti"),
        backgroundColor: Colors.green,
      ),
    );

    _passwordLamaController.clear();
    _passwordBaruController.clear();
    _konfirmasiPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
        appBar: AppBar(
          title: const Text(
            "Akun Saya",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _passwordLamaController,
              obscureText: !_showPasswordLama,
              decoration: InputDecoration(
                labelText: "Password Lama",
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPasswordLama ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPasswordLama = !_showPasswordLama;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordBaruController,
              obscureText: !_showPasswordBaru,
              decoration: InputDecoration(
                labelText: "Password Baru",
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPasswordBaru ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPasswordBaru = !_showPasswordBaru;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _konfirmasiPasswordController,
              obscureText: !_showKonfirmasiPassword,
              decoration: InputDecoration(
                labelText: "Konfirmasi Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _showKonfirmasiPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _showKonfirmasiPassword = !_showKonfirmasiPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _gantiPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003D82),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Ganti Password", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
