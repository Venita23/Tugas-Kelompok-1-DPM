import 'package:flutter/material.dart';
import 'validasi.dart';

class TelkomselGooglePayment extends StatefulWidget {
  const TelkomselGooglePayment({super.key});

  @override
  State<TelkomselGooglePayment> createState() =>
      _TelkomselGooglePaymentState();
}

class _TelkomselGooglePaymentState extends State<TelkomselGooglePayment> {
  bool showPasswordField = false;
  bool passwordVisible = false;
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo Google & Device
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/google.png', height: 24),
                      const SizedBox(width: 8),
                      const Icon(Icons.smartphone, color: Colors.black, size: 32),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Judul dan Email (rata tengah)
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Tambahkan Telkomsel ke Google",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.account_circle,
                                size: 16, color: Colors.black54),
                            SizedBox(width: 4),
                            Text("veni@gmail.com",
                                style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 32),

                  const Text(
                    "Anda dapat menambahkan pembelian langsung ke tagihan Telkomsel Anda. "
                    "Anda dapat membatalkan tautan akun Anda kapan saja di payments.google.com",
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    "Kami akan menghubungi Telkomsel dengan SMS dari ponsel Anda untuk memverifikasi. Tarif pesan standar mungkin berlaku.",
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 12),

                  // Input kata sandi
                  if (showPasswordField) ...[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kata sandi",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: passwordController,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 206, 220, 237),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 93, 166, 249)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Color(0xFF003D82)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  const Text(
                    "Dengan melanjutkan, Anda menyetujui Persyaratan Layanan Google Payments dan juga Persyaratan Layanan Telkomsel. "
                    "Pemberitahuan Privasi Google Payments menjelaskan cara penanganan data Anda yang terkait dengan Google Payments.",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("MY NOVEL'S",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Rp37.740,00",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003D82),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        if (!showPasswordField) {
                          setState(() {
                            showPasswordField = true;
                          });
                        } else if (passwordController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ValidasiPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Mohon masukkan kata sandi'),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Beli sekarang",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
