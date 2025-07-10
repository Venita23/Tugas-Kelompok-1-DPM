import 'package:flutter/material.dart';

class PreferensiBacaan extends StatelessWidget {
  const PreferensiBacaan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                blurRadius: 4,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: const Text(
            "Preferensi Bacaan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih genre favorit Anda",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
           Wrap(
  spacing: 16,
  runSpacing: 16,
  children: [
    buildGenreButton(
      context: context,
      label: "Cerita untuk pria",
      color: Colors.blue.shade400,
    ),
    buildGenreButton(
      context: context,
      label: "Cerita untuk wanita",
      color: Colors.pink.shade300,
    ),
  ],
),

          ],
        ),
      ),
    );
  }

 Widget buildGenreButton({
  required BuildContext context,
  required String label,
  required Color color,
}) {

  final double screenWidth = MediaQuery.of(context).size.width;
  final double buttonWidth = (screenWidth - 56) / 2; // 20 padding kiri + kanan + 16 spacing

  return Container(
    width: buttonWidth,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(14),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4,
          offset: Offset(2, 4),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 6),
        const Icon(Icons.check_circle, color: Colors.white),
      ],
    ),
  );
}

  }

