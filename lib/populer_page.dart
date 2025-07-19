import 'package:flutter/material.dart';

class PopulerPage extends StatefulWidget {
  const PopulerPage({super.key});

  @override
  State<PopulerPage> createState() => _PopulerPageState();
}

class _PopulerPageState extends State<PopulerPage> {
  List<Map<String, String>> populerList = [
    {"title": "Kinanti Asrama Dua Dunia", "image": "assets/KinantiAsmaraDuaDunia.jpeg"},
    {"title": "Istri Cantik Sang Panglima", "image": "assets/IstriCantikSangPanglima.jpeg"},
    {"title": "Tujuh Kelana", "image": "assets/TujuhKelana.jpeg"},
    {"title": "The world of Immortality", "image": "assets/TheWorldOfImmortality.jpeg"},
    {"title": "Our Secret Love", "image": "assets/OurSecretLove.jpeg"},
    {"title": "The Story of One love", "image": "assets/TheStoryOfOneLove.jpeg"},
    {"title": "Windwitch", "image": "assets/Windwitch.jpeg"},
    {"title": "Bocah Andromeda", "image": "assets/BocahAndromeda.jpeg"},
    {"title": "Love Brings You Home", "image": "assets/LoveBringsYouHome.jpeg"},
    {"title": "Alam dan Langit Sandykala", "image": "assets/AlamdanLangitSandykala.jpeg"},
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
        elevation: 1,
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
      childAspectRatio: 1.4, // proporsi lebih tinggi supaya foto lebih lega
      crossAxisSpacing: 16,
      mainAxisSpacing: 20,
    ),
    itemCount: filteredList.length,
    itemBuilder: (context, index) {
      final book = filteredList[index];
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nomor urut (lebih kecil)
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

          // Thumbnail gambar (portrait lebih besar)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              book["image"]!,
              width: 110,   // lebih lebar
              height: 180,  // lebih tinggi biar portrait
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),

          // Judul buku (auto wrap ke bawah jika panjang)
          Expanded(
            child: Text(
              book["title"]!,
              softWrap: true,
              maxLines: 3, // bisa turun hingga 3 baris
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
)

        ],
      ),
    );
  }
}
