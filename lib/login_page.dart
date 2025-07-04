import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart'; // Tambahkan ini sesuai lokasi file HomePage

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset(
                'assets/logo_apk.png',
                height: 150, // tinggi gambar
                fit: BoxFit.cover,
              ),
              
              const SizedBox(height: 30),
             
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

            // Username
            TextField(
              style: const TextStyle(color: Color(0xFF003D82)),
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: const TextStyle(color: Color(0xFF003D82)),
                prefixIcon: const Icon(Icons.person, color: Color(0xFF003D82)),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xFF003D82), width: 1.3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xFF003D82), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Password
            TextField(
              obscureText: true,
              style: const TextStyle(color: Color(0xFF003D82)),
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: const TextStyle(color: Color(0xFF003D82)),
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF003D82)),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xFF003D82), width: 1.3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xFF003D82), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Tombol Masuk
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003D82),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
              
            const Text("Apakah kamu punya akun?"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text(
                  "Membuat Akun",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}