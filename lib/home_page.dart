import 'package:flutter/material.dart';
import 'package:flutter_application_3/genre_page.dart';
import 'populer_page.dart';
import 'detail_bacaan_page1.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedGenre;
  final List<Map<String, String>> filteredList;
  final List<Map<String, String>> bukuPopuler;
  final Map<String, List<Map<String, String>>> bukuPilihan;
  final void Function(String) onGenreSelected;

  const HomePage({
    super.key,
    required this.searchController,
    required this.selectedGenre,
    required this.filteredList,
    required this.bukuPopuler,
    required this.bukuPilihan,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Beranda", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            // Search Field
            TextField(
              controller: searchController,
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

            const SizedBox(height: 20),

            // Pilihan Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Pilihan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GenrePage()));
                  },
                  child: const Text("Lihat semua", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Genre Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: bukuPilihan.keys.map((genre) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        genre,
                        style: TextStyle(
                          color: selectedGenre == genre ? Colors.white : const Color(0xFF003D82),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: selectedGenre == genre,
                      selectedColor: const Color(0xFF003D82),
                      backgroundColor: Colors.white,
                      shape: StadiumBorder(
                        side: const BorderSide(color: Color(0xFF003D82), width: 1.5),
                      ),
                      showCheckmark: false,
                      onSelected: (_) => onGenreSelected(genre),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 12),

            // Filtered List (horizontal)
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final buku = filteredList[index];
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(buku["gambar"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Text(
                        buku["judul"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Populer Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Populer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PopulerPage()));
                  },
                  child: const Text("Lihat semua", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Populer Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.7,
              children: bukuPopuler.map((buku) {
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail ketika buku populer diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailBacaanPage1(
                          judul: buku["judul"]!,
                          gambar: buku["gambar"]!,
                          sinopsis: buku["sinopsis"] ?? "Tidak ada sinopsis.",
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                buku["gambar"]!,
                                height: 289,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 4,
                                left: 4,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: const Color(0xFFF7C100),
                                  child: Text(
                                    "${bukuPopuler.indexOf(buku) + 1}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          buku["judul"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
