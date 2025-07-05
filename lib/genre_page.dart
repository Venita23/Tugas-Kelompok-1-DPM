import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BacaanPage(),
    );
  }
}

class BacaanPage extends StatefulWidget {
  const BacaanPage({super.key});

  @override
  State<BacaanPage> createState() => _BacaanPageState();
}

class _BacaanPageState extends State<BacaanPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchController;

  final List<String> kategori = ['Untuk Anda', 'Kerajaan', 'Romansa', 'Fantasi', 'Misteri'];

  // 📝 Ubah isi setiap genre di bawah ini (judul, penulis, gambar, bab, update)
  final Map<String, List<Map<String, String>>> semuaBacaan = {
    'Untuk Anda': [
      {"judul": "Kinanti Asmara Dua Dunia", "penulis": "Vir & Sam", "bab": "150", "update": "Tiap Hari", "gambar": "assets/KinantiAsmaraDuniaDunia.jpeg"},
      {"judul": "The World Of Immortality", "penulis": "Yunnii Parkk", "bab": "80", "update": "Tiap Hari", "gambar": "assets/TheWorldOfImmortality.png"},
      {"judul": "Santri Cantik Incaran Gus AL", "penulis": "Naylest", "bab": "100", "update": "Tiap Hari", "gambar": "assets/SantriCantikIncaranGusAL.png"},
      {"judul": "Istri Cantik Sang Panglima", "penulis": "Araina", "bab": "100", "update": "Tiap Hari", "gambar": "assets/IstriCantikSangPanglima.jpeg"},
      {"judul": "The Second Life of The Crown Princess", "penulis": "Wintersnow", "bab": "168", "update": "Tiap Hari", "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg"},
      {"judul": "Vimala (Janji Jiwa)", "penulis": "Vir & Sam", "bab": "75", "update": "Tiap Hari", "gambar": "assets/Vimala.jpeg"},
      {"judul": "Istri Kecil Sang Bupati", "penulis": "Ulvaoslan", "bab": "75", "update": "Seminggu Sekali", "gambar": "assets/IstriKecilSangBupati.jpeg"},
      {"judul": "Judul A8", "penulis": "Penulis A8", "bab": "7", "update": "3 Hari", "gambar": "assets/anda8.jpg"},
      {"judul": "Judul A9", "penulis": "Penulis A9", "bab": "14", "update": "Tiap Hari", "gambar": "assets/anda9.jpg"},
      {"judul": "Judul A10", "penulis": "Penulis A10", "bab": "6", "update": "1 Hari", "gambar": "assets/anda10.jpg"},
    ],
    'Kerajaan': [
      {"judul": "Judul K1", "penulis": "Penulis K1", "bab": "18", "update": "2 Hari", "gambar": "assets/kerajaan1.jpg"},
      {"judul": "Judul K2", "penulis": "Penulis K2", "bab": "22", "update": "1 Hari", "gambar": "assets/kerajaan2.jpg"},
      {"judul": "Judul K3", "penulis": "Penulis K3", "bab": "16", "update": "Tiap Hari", "gambar": "assets/kerajaan3.jpg"},
      {"judul": "Judul K4", "penulis": "Penulis K4", "bab": "25", "update": "3 Hari", "gambar": "assets/kerajaan4.jpg"},
      {"judul": "Judul K5", "penulis": "Penulis K5", "bab": "14", "update": "2 Hari", "gambar": "assets/kerajaan5.jpg"},
      {"judul": "Judul K6", "penulis": "Penulis K6", "bab": "17", "update": "Tiap Hari", "gambar": "assets/kerajaan6.jpg"},
      {"judul": "Judul K7", "penulis": "Penulis K7", "bab": "20", "update": "1 Hari", "gambar": "assets/kerajaan7.jpg"},
      {"judul": "Judul K8", "penulis": "Penulis K8", "bab": "19", "update": "3 Hari", "gambar": "assets/kerajaan8.jpg"},
      {"judul": "Judul K9", "penulis": "Penulis K9", "bab": "21", "update": "2 Hari", "gambar": "assets/kerajaan9.jpg"},
      {"judul": "Judul K10", "penulis": "Penulis K10", "bab": "23", "update": "Tiap Hari", "gambar": "assets/kerajaan10.jpg"},
    ],
    'Romansa': [
      {"judul": "Romansa 1", "penulis": "Cinta 1", "bab": "10", "update": "Tiap Hari", "gambar": "assets/romansa1.jpg"},
      {"judul": "Romansa 2", "penulis": "Cinta 2", "bab": "12", "update": "2 Hari", "gambar": "assets/romansa2.jpg"},
      {"judul": "Romansa 3", "penulis": "Cinta 3", "bab": "8", "update": "1 Hari", "gambar": "assets/romansa3.jpg"},
      {"judul": "Romansa 4", "penulis": "Cinta 4", "bab": "15", "update": "3 Hari", "gambar": "assets/romansa4.jpg"},
      {"judul": "Romansa 5", "penulis": "Cinta 5", "bab": "20", "update": "Tiap Hari", "gambar": "assets/romansa5.jpg"},
      {"judul": "Romansa 6", "penulis": "Cinta 6", "bab": "9", "update": "1 Hari", "gambar": "assets/romansa6.jpg"},
      {"judul": "Romansa 7", "penulis": "Cinta 7", "bab": "11", "update": "2 Hari", "gambar": "assets/romansa7.jpg"},
      {"judul": "Romansa 8", "penulis": "Cinta 8", "bab": "7", "update": "3 Hari", "gambar": "assets/romansa8.jpg"},
      {"judul": "Romansa 9", "penulis": "Cinta 9", "bab": "14", "update": "Tiap Hari", "gambar": "assets/romansa9.jpg"},
      {"judul": "Romansa 10", "penulis": "Cinta 10", "bab": "6", "update": "1 Hari", "gambar": "assets/romansa10.jpg"},
    ],
    'Fantasi': [
      {"judul": "Fantasi 1", "penulis": "F1", "bab": "50", "update": "2 Hari", "gambar": "assets/fantasi1.jpg"},
      {"judul": "Fantasi 2", "penulis": "F2", "bab": "45", "update": "Tiap Hari", "gambar": "assets/fantasi2.jpg"},
      {"judul": "Fantasi 3", "penulis": "F3", "bab": "40", "update": "1 Hari", "gambar": "assets/fantasi3.jpg"},
      {"judul": "Fantasi 4", "penulis": "F4", "bab": "35", "update": "3 Hari", "gambar": "assets/fantasi4.jpg"},
      {"judul": "Fantasi 5", "penulis": "F5", "bab": "42", "update": "Tiap Hari", "gambar": "assets/fantasi5.jpg"},
      {"judul": "Fantasi 6", "penulis": "F6", "bab": "38", "update": "2 Hari", "gambar": "assets/fantasi6.jpg"},
      {"judul": "Fantasi 7", "penulis": "F7", "bab": "47", "update": "Tiap Hari", "gambar": "assets/fantasi7.jpg"},
      {"judul": "Fantasi 8", "penulis": "F8", "bab": "43", "update": "3 Hari", "gambar": "assets/fantasi8.jpg"},
      {"judul": "Fantasi 9", "penulis": "F9", "bab": "39", "update": "2 Hari", "gambar": "assets/fantasi9.jpg"},
      {"judul": "Fantasi 10", "penulis": "F10", "bab": "44", "update": "Tiap Hari", "gambar": "assets/fantasi10.jpg"},
    ],
    'Misteri': [
      {"judul": "Misteri 1", "penulis": "Detektif 1", "bab": "33", "update": "3 Hari", "gambar": "assets/misteri1.jpg"},
      {"judul": "Misteri 2", "penulis": "Detektif 2", "bab": "27", "update": "Tiap Hari", "gambar": "assets/misteri2.jpg"},
      {"judul": "Misteri 3", "penulis": "Detektif 3", "bab": "29", "update": "2 Hari", "gambar": "assets/misteri3.jpg"},
      {"judul": "Misteri 4", "penulis": "Detektif 4", "bab": "31", "update": "Tiap Hari", "gambar": "assets/misteri4.jpg"},
      {"judul": "Misteri 5", "penulis": "Detektif 5", "bab": "35", "update": "1 Hari", "gambar": "assets/misteri5.jpg"},
      {"judul": "Misteri 6", "penulis": "Detektif 6", "bab": "37", "update": "Tiap Hari", "gambar": "assets/misteri6.jpg"},
      {"judul": "Misteri 7", "penulis": "Detektif 7", "bab": "32", "update": "3 Hari", "gambar": "assets/misteri7.jpg"},
      {"judul": "Misteri 8", "penulis": "Detektif 8", "bab": "36", "update": "2 Hari", "gambar": "assets/misteri8.jpg"},
      {"judul": "Misteri 9", "penulis": "Detektif 9", "bab": "40", "update": "Tiap Hari", "gambar": "assets/misteri9.jpg"},
      {"judul": "Misteri 10", "penulis": "Detektif 10", "bab": "38", "update": "1 Hari", "gambar": "assets/misteri10.jpg"},
    ],
  };

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: kategori.length, vsync: this);
    _searchController = TextEditingController();
  }

  Widget buildCard(Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              data['gambar']!,
              width: 80,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['judul']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                Text(data['penulis']!, style: const TextStyle(fontSize: 12)),
                Text("Bab ${data['bab']}", style: const TextStyle(fontSize: 12)),
                Text("Update ${data['update']}", style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB3D4FF),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                  ),
                  child: const Text("Baca", style: TextStyle(fontSize: 12, color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEEEEE),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Genre", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
            const SizedBox(height: 8),
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 100,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: const Color.fromARGB(255, 0, 61, 130),
            borderRadius: BorderRadius.circular(20),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: kategori.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: kategori.map((genre) {
          final bacaanGenre = semuaBacaan[genre]!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: bacaanGenre.map((data) => buildCard(data)).toList(),
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Bacaan"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Genre"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
