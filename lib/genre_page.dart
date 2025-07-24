import 'package:flutter/material.dart';

class GenrePage extends StatefulWidget {
  final Function(Map<String, dynamic>)? onOpenDetail;
  const GenrePage({super.key, this.onOpenDetail});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchController;

  final List<String> kategori = ['Untuk Anda', 'Kerajaan', 'Romansa', 'Fantasi', 'Misteri'];

  final Map<String, List<Map<String, String>>> semuaBacaan = {
    'Untuk Anda': [
      {
        "judul": "Kinanti Asmara Dua Dunia",
        "penulis": "Vir & Sam",
        "bab": "150",
        "update": "Tiap Hari",
        "gambar": "assets/KinantiAsmaraDuaDunia.jpeg",
        "deskripsi": "Kinanti, wanita ini nyaris gila akibat pernikahannya yang batal..."
      },
      // Tambahkan bacaan lain dengan key 'deskripsi'
    ],
    'Kerajaan': [
      {
        "judul": "Istri Cantik Sang Panglima",
        "penulis": "Araina",
        "bab": "100",
        "update": "Tiap Hari",
        "gambar": "assets/IstriCantikSangPanglima.jpeg",
        "deskripsi": "Kisah cinta dan perjuangan di dalam kerajaan yang penuh intrik."
      },
    ],
    'Romansa': [
      {
        "judul": "Santri Cantik Incaran Gus AL",
        "penulis": "Naylest",
        "bab": "100",
        "update": "Tiap Hari",
        "gambar": "assets/SantriCantikIncaranGusAL.png",
        "deskripsi": "Romansa unik antara santri dan seorang tokoh karismatik."
      },
    ],
    'Fantasi': [
      {
        "judul": "The World Of Immortality",
        "penulis": "Yunnii Parkk",
        "bab": "80",
        "update": "Tiap Hari",
        "gambar": "assets/TheWorldOfImmortality.png",
        "deskripsi": "Dunia abadi yang penuh misteri dan pertarungan antar ras."
      },
    ],
    'Misteri': [
      {
        "judul": "The Last Element",
        "penulis": "Aroogadha",
        "bab": "100",
        "update": "Seminggu sekali",
        "gambar": "assets/TheLastElement.jpeg",
        "deskripsi": "Sebuah elemen terakhir menjadi kunci masa depan dunia."
      },
    ],
  };

  List<Map<String, String>> _hasilPencarian = [];
  bool _sedangMencari = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: kategori.length, vsync: this);
    _searchController = TextEditingController();
    _searchController.addListener(_filterBacaan);
  }

  void _filterBacaan() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _sedangMencari = false;
        _hasilPencarian = [];
      });
    } else {
      final semua = semuaBacaan.values.expand((e) => e).toList();
      setState(() {
        _sedangMencari = true;
        _hasilPencarian = semua
            .where((buku) => buku['judul']!.toLowerCase().contains(query))
            .toList();
      });
    }
  }

  Widget buildCard(Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(0),
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
                  onPressed: () {
                    if (widget.onOpenDetail != null) {
                      widget.onOpenDetail!({
                        'judul': data['judul'],
                        'image': data['gambar'],
                        'deskripsi': data['deskripsi'] ?? 'Deskripsi belum tersedia',
                      });
                    }
                  },
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Genre", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search, color: Color(0xFF003D82)),
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
          ],
        ),
        toolbarHeight: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 12, bottom: 8),
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: kategori.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final genre = kategori[index];
                final selected = _tabController.index == index;
                return ChoiceChip(
                  label: Text(
                    genre,
                    style: TextStyle(
                      color: selected ? Colors.white : const Color.fromARGB(255, 0, 61, 130),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: selected,
                  selectedColor: const Color.fromARGB(255, 0, 61, 130),
                  showCheckmark: false,
                  onSelected: (_) {
                    setState(() {
                      _tabController.animateTo(index);
                    });
                  },
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color.fromARGB(255, 0, 61, 130), width: 1.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white,
                );
              },
            ),
          ),
        ),
      ),
      body: _sedangMencari
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: _hasilPencarian.map((data) => buildCard(data)).toList(),
              ),
            )
          : TabBarView(
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
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
