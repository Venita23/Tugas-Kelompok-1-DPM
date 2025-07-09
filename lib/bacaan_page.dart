import 'package:flutter/material.dart';

class BacaanPage extends StatefulWidget {
  const BacaanPage({super.key});

  @override
  State<BacaanPage> createState() => _BacaanPageState();
}

class _BacaanPageState extends State<BacaanPage> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> riwayat = [
    {
      "kategori": "Hari ini",
      "items": [
        {
          "image": "assets/KinantiAsmaraDuaDunia.jpeg",
          "judul": "Kinanti Asmara Dua Dunia",
          "penulis": "Vir & Sam",
          "bab": "129/150",
          "update": "Tiap Hari",
          "info": "1 Bab belum dibaca"
        },
        {
          "image": "assets/TheWorldOfImmortality.png",
          "judul": "Love's Serendipity",
          "penulis": "188",
          "bab": "68",
          "update": "Tiap Hari",
          "info": "68 Bab belum dibaca"
        },
        {
          "image": "assets/images/cover3.png",
          "judul": "Jatuh ke dalam Api",
          "penulis": "Yelhan",
          "bab": "105",
          "update": "Tiap Hari",
          "info": "1 Bab belum dibaca"
        },
      ]
    },
    {
      "kategori": "Kemarin",
      "items": [
        {
          "image": "assets/images/cover4.png",
          "judul": "Vimela (Janji Jiwa)",
          "penulis": "Vir & Sam",
          "bab": "75",
          "update": "Tiap Hari",
          "info": "1 Bab belum dibaca"
        },
        {
          "image": "assets/images/cover5.png",
          "judul": "Istri Cantik Sang Panglima",
          "penulis": "Arnis",
          "bab": "100",
          "update": "Tiap Hari",
          "info": "0 Bab belum dibaca"
        },
        {
          "image": "assets/images/cover6.png",
          "judul": "Love Brings You Home",
          "penulis": "Helena Paquet",
          "bab": "55",
          "update": "Seminggu Sekali",
          "info": "1 Bab belum dibaca"
        },
      ]
    },
    {
      "kategori": "Sebelumnya",
      "items": [
        {
          "image": "assets/images/cover7.png",
          "judul": "Stay With Me",
          "penulis": "Claudia Wilson",
          "bab": "50",
          "update": "Tiap Hari",
          "info": "12 Bab belum dibaca"
        },
        {
          "image": "assets/images/cover8.png",
          "judul": "Our Secret Love",
          "penulis": "Claudia Wilson",
          "bab": "78",
          "update": "Tiap Hari",
          "info": "36 Bab belum dibaca"
        },
      ]
    },
  ];

  final List<Map<String, String>> koleksi = [
    {
      "image": "assets/KinantiAsmaraDuaDunia.jpeg",
      "title": "Kinanti Asmara Dua Dunia",
      "bab": "Bab 129/150"
    },
    {
      "image": "assets/HarapanBaru.png",
      "title": "Harapan Baru",
      "bab": "Bab 58/60"
    },
    {
      "image": "assets/CintaDalamDiam.png",
      "title": "Cinta Dalam Diam",
      "bab": "Bab 100/100"
    },
    {
      "image": "assets/Misterikehidupan.png",
      "title": "Misteri Kehidupan",
      "bab": "Bab 70/100"
    },
    {
      "image": "assets/StayWithMe.jpeg",
      "title": "Stay With Me",
      "bab": "Bab 50/50"
    },
    {
      "image": "assets/selirsangpangeran.jpeg",
      "title": "Selir Sang Pangeran",
      "bab": "Bab 60/75"
    },
    {
      "image": "assets/KisahKasihSenja.png",
      "title": "Kisah kasih Senja",
      "bab": "Bab 75/80"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Bacaan",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFF003D82),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: const Color.fromARGB(255, 247, 193, 0),
                borderRadius: BorderRadius.circular(30),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(child: Align(alignment: Alignment.center, child: Text("Riwayat"))),
                Tab(child: Align(alignment: Alignment.center, child: Text("Koleksi"))),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildRiwayatList(),
                buildKoleksiGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRiwayatList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: riwayat.map((kategori) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kategori["kategori"],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...List<Widget>.from(kategori["items"].map((item) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: Image.asset(item["image"], width: 100, height: 130),
                  title: Text("Judul : ${item["judul"]}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Penulis : ${item["penulis"]}", style: const TextStyle(fontSize: 12)),
                      Text("Bab : ${item["bab"]}", style: const TextStyle(fontSize: 12)),
                      Text("Update : ${item["update"]}", style: const TextStyle(fontSize: 12)),
                      Text(item["info"], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 179, 212, 255),
                      foregroundColor: Colors.black,
                    ),
                    child: const Text("Baca"),
                  ),
                ),
              );
            })),
            const SizedBox(height: 12),
          ],
        );
      }).toList(),
    );
  }

  Widget buildKoleksiGrid() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: koleksi.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (context, index) {
          final book = koleksi[index];
          final isAddButton = book["image"] == "";

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 0.7,
                child: isAddButton
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add, size: 40, color: Colors.grey),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          book["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              const SizedBox(height: 6),
              Text(
                book["title"]!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              if (!isAddButton)
                Text(
                  book["bab"]!,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
            ],
          );
        },
      ),
    );
  }
}