import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onRegister;
  final VoidCallback onBack;

  const RegisterPage({
    super.key,
    required this.onGoogleTap,
    required this.onFacebookTap,
    required this.onRegister,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: onBack,
        ),
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
                ),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: onGoogleTap,
                      icon: Image.asset('assets/google.png', height: 20),
                      label: const Text("Login dengan Google"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF003D82),
                        side: const BorderSide(color: Color(0xFF003D82)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: onFacebookTap,
                      icon: Image.asset('assets/facebook.png', height: 20),
                      label: const Text("Login dengan Facebook"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF003D82),
                        side: const BorderSide(color: Color(0xFF003D82)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text("- atau -", textAlign: TextAlign.center),
              const SizedBox(height: 16),
              _buildTextField("Nama", Icons.person),
              const SizedBox(height: 16),
              _buildTextField("Email", Icons.email),
              const SizedBox(height: 16),
              _buildTextField("Password", Icons.lock, obscure: true),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: onRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003D82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun? "),
                  GestureDetector(
                    onTap: onBack,
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF003D82)),
        filled: true,
        fillColor: const Color(0xFFB3D4FF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF003D82), width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF003D82), width: 2),
        ),
      ),
    );
  }
}