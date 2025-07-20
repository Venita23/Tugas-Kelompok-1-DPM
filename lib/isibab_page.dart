import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Bab01Page(),
  ));
}

class Bab01Page extends StatelessWidget {
  const Bab01Page({super.key});

  final String isiCerita = '''
"Kamu dengar sendiri Wira, bapaknya Kinanti itu mata duitan. Hidup miskin tapi minta mahar lima puluh juta, memangnya dia siapa?"

Sambil masuk ke dalam rumah, bu Asih mengomel.

"Cuma tamatan sekolah dasar tapi minta mahar lima puluh juta. Pak Hasan memeras kita, kamu sadar nggak?" timpal pak Wisnu, bapaknya Wira.

"Belum nikah aja udah minta mahar uang lima puluh juta, minta segala perabotan rumah tangga lengkap. Mereka pikir kita ini toko?"

"Gimana kalau udah nikah? Yang ada habis harta kita diporotin sama Kinan dan bapaknya."

Wira hanya diam saja, apa yang dikatakan kedua orang tuanya benar, belum menikah saja kedua orang tua Kinan sudah minta hal yang sedikit tidak masuk di akal. Kinan yang menguping dari teras rumah hanya bisa diam saja dengan perasaan bersalah dan tidak enak hati.

"Mas," panggilnya pada Wira setelah pak Wisnu dan bu Asih masuk ke kamar. Wisnu menghembuskan napas pelan kemudian...
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD9E2),
        elevation: 0,
        title: const Text(
          'BAB 1:',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.menu_book, size: 18, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          'Konten',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Text(
                      '150 Bab >',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const Divider(height: 20, thickness: 1),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      isiCerita,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}