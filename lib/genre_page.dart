import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

  final List<String> kategori = ['Pilihan', 'Kerajaan', 'Romansa', 'Fantasi', 'Misteri'];

  final List<Map<String, String>> daftarBacaan = [
    {
      "judul": "Kinanthi Amanah Dua Dunia",
      "penulis": "Tasaro GK",
      "bab": "Bab 51",
      "update": "1 Hari",
      "gambar": "assets/kinanthi.jpg"
    },
    {
      "judul": "The Second Life of The Villainess",
      "penulis": "WhitePearl",
      "bab": "Bab 122",
      "update": "1 Hari",
      "gambar": "assets/villainess.jpg"
    },
    {
      "judul": "Our Secret Love",
      "penulis": "Ducan Wilson",
      "bab": "Bab 13",
      "update": "1 Hari",
      "gambar": "assets/love.jpg"
    },
    {
      "judul": "Biar Cantik Sang Penggima",
      "penulis": "Budi Setiawan",
      "bab": "Bab 18",
      "update": "1100 Hari",
      "gambar": "assets/cantik.jpg"
    },
    {
      "judul": "Love Brings You Home",
      "penulis": "Dewi Anggraeni",
      "bab": "Bab 31",
      "update": "2 Hari",
      "gambar": "assets/lovehome.jpg"
    },
  ];

  List<Map<String, String>> filteredBacaan = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: kategori.length, vsync: this);
    _searchController = TextEditingController();
    filteredBacaan = List.from(daftarBacaan);

    _searchController.addListener(() {
      filterSearch(_searchController.text);
    });
  }

  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredBacaan = List.from(daftarBacaan);
      } else {
        filteredBacaan = daftarBacaan
            .where((buku) => buku["judul"]!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget buildCard(Map<String, String> data) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              image: DecorationImage(
                image: AssetImage(data['gambar']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['judul']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text("Penulis: ${data['penulis']}", style: const TextStyle(fontSize: 11)),
                  Text(data['bab']!, style: const TextStyle(fontSize: 11)),
                  Text("Update: ${data['update']}", style: const TextStyle(fontSize: 11)),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Baca",
                        style: TextStyle(fontSize: 11, color: Colors.white)),
                  ),
                ],
              ),
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
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search judul buku...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Text(
                  "Genre",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Color(0xFFF7C100),
                labelColor: Color(0xFFF7C100),
                unselectedLabelColor: Colors.black,
                tabs: kategori.map((e) => Tab(text: e)).toList(),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/banner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: kategori.map((_) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: filteredBacaan.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Text(
                              "Maaf, tidak ada judul novel tersebut",
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Column(
                          children: filteredBacaan.map((data) => buildCard(data)).toList(),
                        ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
