import 'package:flutter/material.dart';

class PopulerPage extends StatefulWidget {
  const PopulerPage({super.key});

  @override
  State<PopulerPage> createState() => _PopulerPageState();
}

class _PopulerPageState extends State<PopulerPage> {
  List<Map<String, String>> populerList = [
    {"title": "Kinanti Asrama Dua Dunia", "image": "assets/KinantiAsmaraDuaDunia.jpeg"},
    {"title": "Vimala", "image": "assets/Vimala.jpeg"},
    {"title": "Stay With Me", "image": "assets/StayWithMe.jpeg"},
    {"title": "Cinta Dalam Diam", "image": "assets/CintaDalamDiam.png"},
    {"title": "Our Secret Love", "image": "assets/OurSecretLove.jpeg"},
    {"title": "Kebangkitan Dewi Api", "image": "assets/KebangkitanDewiApi.jpeg"},
    {"title": "Istri Cantik Sang Panglima", "image": "assets/IstriCantikSangPanglima.jpeg"},
    {"title": "Celestia Menjadi Pengantin Kaisar", "image": "assets/CelestiaMenjadiPengantinKaisar.jpeg"},
    {"title": "The world of Immortality", "image": "assets/TheWorldOfImmortality.png"},
    {"title": "The Story of One love", "image": "assets/TheStoryOfOneLove.jpeg"},
    {"title": "Windwitch", "image": "assets/Windwitch.jpeg"},
    {"title": "Kisah Kasih Senja", "image": "assets/KisahKasihSenja.png"},
    {"title": "Moonlight", "image": "assets/moonlight.jpeg"},
    {"title": "Love Story", "image": "assets/LoveStory.jpeg"},
    {"title": "Alam dan Langit Sandykala", "image": "assets/AlamdanLangitSandykala.jpeg"},
    {"title": "Harapan Baru", "image": "assets/HarapanBaru.png"},
    {"title": "Sword", "image": "assets/sword.png"},
    {"title": "Love Story", "image": "assets/LoveStory.jpeg"},
    {"title": "Santri Cantik Incaran Gus Al", "image": "assets/SantriCantikIncaranGusAl.png"},
    {"title": "Untuk Sisi Lain", "image": "assets/UntukSisiLain.jpeg"},
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // Filter list berdasarkan search
    List<Map<String, String>> filteredList = populerList
        .where((book) =>
            book["title"]!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Populer",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search, color: Color(0xFF003D82)),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF003D82),
                    width: 1.3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF003D82),
                    width: 2,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // Grid Buku
        Expanded(
  child: GridView.builder(
    padding: const EdgeInsets.all(12),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // 2 buku per baris
      childAspectRatio: 1.4, // biar portrait tapi tetap proporsional
      crossAxisSpacing: 16,
      mainAxisSpacing: 20,
    ),
    itemCount: filteredList.length,
    itemBuilder: (context, index) {
      final book = filteredList[index];
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nomor urut
          CircleAvatar(
            radius: 11,
            backgroundColor: const Color(0xFFF7C100),
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Gambar portrait
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              book["image"]!,
              width: 120,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),

          // Judul wrap otomatis
          Expanded(
            child: Text(
              book["title"]!,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    },
  ),
),


        ],
      ),
    );
  }
}
