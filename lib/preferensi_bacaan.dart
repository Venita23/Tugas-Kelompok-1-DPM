import 'package:flutter/material.dart';

class PreferensiBacaan extends StatefulWidget {
  const PreferensiBacaan({super.key});

  @override
  State<PreferensiBacaan> createState() => _PreferensiBacaanState();
}

class _PreferensiBacaanState extends State<PreferensiBacaan> {
  String? _selected; // 'pria' | 'wanita'

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = (screenWidth - 56) / 2;

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
        title: const Text(
          'Preferensi Bacaan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih genre favorit Anda',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              children: [
                _GenreButton(
                  id: 'pria',
                  label: 'Cerita untuk pria',
                  color: Colors.blue.shade400,
                  width: buttonWidth,
                  isSelected: _selected == 'pria',
                  onTap: () => setState(() => _selected = 'pria'),
                ),
                _GenreButton(
                  id: 'wanita',
                  label: 'Cerita untuk wanita',
                  color: Colors.pink.shade400,
                  width: buttonWidth,
                  isSelected: _selected == 'wanita',
                  onTap: () => setState(() => _selected = 'wanita'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GenreButton extends StatelessWidget {
  const _GenreButton({
    required this.id,
    required this.label,
    required this.color,
    required this.width,
    required this.isSelected,
    required this.onTap,
  });

  final String id;
  final String label;
  final Color color;
  final double width;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color checkColor = isSelected
        ? (id == 'pria' ? Colors.blue.shade700 : Colors.pink.shade700)
        : Colors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24), // lebih tinggi
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.check_circle, color: checkColor),
          ],
        ),
      ),
    );
  }
}
