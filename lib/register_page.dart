import 'package:flutter/material.dart';
import 'account_choice_page.dart'; // pastikan file ini ada
// ignore: unused_import
import 'login_page.dart'; // jika ingin navigasi balik ke login

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Membuat Akun',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      color: Colors.black26,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Login Google dan Facebook
              // Tombol Login Google dan Facebook (vertikal + bentuk rapi)
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    SizedBox(
      height: 48,
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AccountChoicePage(loginMethod: "Google"),
            ),
          );
        },
        icon: Image.asset('assets/google.png', height: 20),
        label: const Text(
          "Login dengan Google",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: Color(0xFF003D82), width: 1.5),
          foregroundColor: Color(0xFF003D82),
        ),
      ),
    ),
    const SizedBox(height: 12),
    SizedBox(
      height: 48,
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AccountChoicePage(loginMethod: "Facebook"),
            ),
          );
        },
        icon: Image.asset('assets/facebook.png', height: 20),
        label: const Text(
          "Login dengan Facebook",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: Color(0xFF003D82), width: 1.5),
          foregroundColor: Color(0xFF003D82),
        ),
      ),
    ),
  ],
),
const SizedBox(height: 24),


              const Text("- atau -", textAlign: TextAlign.center),
              const SizedBox(height: 16),

              // Form Nama, Email, Password
              //Nama
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nama',
                  prefixIcon: Icon(Icons.person, color: Color(0xFF003D82)),
                  hintStyle: TextStyle(color:Color(0xFF003D82)),
                  filled: true,
                  fillColor: Color(0xFFB3D4FF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF003D82), width: 1.3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF003D82), width: 2),
                  ),
                ),
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 16),

              //Email
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.person, color: Color(0xFF003D82)),
                  hintStyle: TextStyle(color: Color(0xFF003D82)),
                  filled: true,
                  fillColor: Color(0xFFB3D4FF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF003D82), width: 1.3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF003D82), width: 2),
                  ),
                ),
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 16),

              //Password
                TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.person, color: Color(0xFF003D82)),
                  hintStyle: TextStyle(color: Color(0xFF003D82)),
                  filled: true,
                  fillColor: Color(0xFFB3D4FF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF003D82), width: 1.3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF003D82), width: 2),
                  ),
                ),
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 24),

              // Tombol Daftar
              Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi daftar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003D82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sudah punya akun?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // atau kembali ke LoginPage()
                    },
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
