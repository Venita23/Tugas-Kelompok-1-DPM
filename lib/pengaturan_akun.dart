import 'package:flutter/material.dart';
import 'akunsaya_page.dart';

class PengaturanAkun extends StatefulWidget {
  const PengaturanAkun({super.key});

  @override
  State<PengaturanAkun> createState() => _PengaturanAkunState();
}

class _PengaturanAkunState extends State<PengaturanAkun> {
  String _selectedLanguage = 'Bahasa Indonesia';
  String _selectedAge = '18 - 24';

  void _showBottomSheet({
    required BuildContext context,
    required String title,
    required List<String> options,
    required String selectedValue,
    required Function(String) onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        String tempSelected = selectedValue;

        return StatefulBuilder(
          builder: (context, setStateBottomSheet) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ...options.map((option) {
                    return ListTile(
                      title: Text(option, textAlign: TextAlign.center),
                      tileColor: tempSelected == option ? Colors.grey.shade200 : null,
                      onTap: () {
                        setStateBottomSheet(() => tempSelected = option);
                      },
                    );
                  }).toList(),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onSelected(tempSelected);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF003D82),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Konfirmasi", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

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
        children: [
          ListTile(
            title: const Text("Bahasa"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_selectedLanguage, style: const TextStyle(color: Colors.grey)),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {
              _showBottomSheet(
                context: context,
                title: "Pilih Bahasa",
                selectedValue: _selectedLanguage,
                options: [
                  'Bahasa Indonesia',
                  'Bahasa Inggris',
                  'Bahasa Spanyol',
                  'Bahasa Prancis',
                  'Bahasa Jerman',
                ],
                onSelected: (val) => setState(() => _selectedLanguage = val),
              );
            },
          ),
          ListTile(
            title: const Text("Usia"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_selectedAge, style: const TextStyle(color: Colors.grey)),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {
              _showBottomSheet(
                context: context,
                title: "Pilih Rentang Usia",
                selectedValue: _selectedAge,
                options: [
                  '18 - 24',
                  '25 - 34',
                  '35 - 44',
                  '45 - 54',
                  '55+',
                ],
                onSelected: (val) => setState(() => _selectedAge = val),
              );
            },
          ),
          //const Divider(),
          ListTile(
            title: const Text("Kosongkan ruang"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              await Future.delayed(const Duration(seconds: 1));
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Cache berhasil dikosongkan!",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color(0xFF003D82),
              ),
            );
            },
          ),
          ListTile(
            title: const Text("Akun Saya"),
            trailing: const Icon(Icons.chevron_right),
              onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AkunSayaPage()),
            );
          },

          ),
          ListTile(
            title: const Text("Periksa Pembaruan"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Tampilkan dialog pengecekan pembaruan
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Pembaruan"),
                  content: const Text("Tidak ada pembaruan saat ini."),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Tentang"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white, // ✅ Dialog putih
                    title: const Text(
                      "MYNOVEL'S",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Versi: v1.0.0"),
                        SizedBox(height: 8),
                        Text(
                          "MYNOVEL'S adalah aplikasi baca dan eksplorasi novel digital untuk generasi muda. "
                          "Temukan berbagai genre, simpan daftar bacaan favorit, dan nikmati pengalaman membaca yang imersif.",
                        ),
                      ],
                    ),
                    actions: [
                      // ✅ Tombol View Licenses
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup dialog dulu
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                    primary: Colors.black,
                                    onPrimary: Colors.white,
                                    surface: Colors.white,     // ✅ Sidebar & header putih
                                    onSurface: Colors.black,   // ✅ Teks tetap hitam
                                    background: Colors.white,  // ✅ Background putih
                                    onBackground: Colors.black,
                                  ),
                                  scaffoldBackgroundColor: Colors.white,
                                  appBarTheme: const AppBarTheme(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    elevation: 0,
                                  ),
                                  textTheme: const TextTheme(
                                    bodyMedium: TextStyle(color: Colors.black),
                                    bodyLarge: TextStyle(color: Colors.black),
                                  ),
                                ),
                                child: const LicensePage(
                                  applicationName: "MYNOVEL'S",
                                  applicationVersion: "v1.0.0",
                                  applicationLegalese: "© 2025 MYNOVEL'S",
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text("Lihat lisensi"),
                      ),
                      // ✅ Tombol Tutup
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Tutup"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
