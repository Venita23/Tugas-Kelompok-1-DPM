import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedGenre = 'Untuk Anda';

  final Map<String, List<Map<String, String>>> bukuPilihan = {
    'Untuk Anda': [
      {
        "judul": "Kinanti Asmara Dua Dunia",
        "gambar": "assets/KinantiAsmaraDuaDunia.jpeg"
      },
      {
        "judul": "TheSecond Life of The Crown Princess",
        "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg"
      },
      {
        "judul": "The Last Element",
        "gambar": "assets/TheLastElement.jpeg"
      },
      {
        "judul": "a love worth fighting for",
        "gambar": "assets/aloveworthfightingfor.jpeg"
      },
      {
        "judul": "Kebangkitan Dewi Api",
        "gambar": "assets/KebangkitanDewiApi.jpeg"
      },
      {
        "judul": "Celestia Menjadi Pengantin Kaisar",
        "gambar": "assets/CelestiaMenjadiPengantinKaisar.jpeg"
      },
    ],
    'Kerajaan': [
      {
        "judul": "Istri Cantik Sang Panglima",
        "gambar": "assets/IstriCantikSangPanglima.jpeg"
      },
      {
        "judul": "Reinkarnasi Queen Mafia Menjadi Putri Duke",
        "gambar": "assets/ReinkarnasiQueenMafiaMenjadiPutriDuke.jpeg"
      },
      {
        "judul": "Moonlight",
        "gambar": "assets/moonlight.jpeg"
      },
      {
        "judul": "Sword",
        "gambar": "assets/sword.png"
      },
      {
        "judul": "Kebangkitan Dewi Api",
        "gambar": "assets/KebangkitanDewiApi.jpeg"
      },
      {
        "judul": "Selir Sang Pangeran",
        "gambar": "assets/selirsangpangeran.jpeg"
      },
    ],
    'Romansa': [
      {
        "judul": "Santri Cantik Incaran Gus AL",
        "gambar": "assets/SantriCantikIncaranGusAL.png"
      },
      {
        "judul": "Love",
        "gambar": "assets/love.jpeg"
      },
      {
        "judul": "Our Secret Love",
        "gambar": "assets/OurSecretLove.jpeg"
      },
      {
        "judul": "Love Story",
        "gambar": "assets/LoveStory.jpeg"
      },
      {
        "judul": "Kisah Kasih Senja",
        "gambar": "assets/KisahKasihSenja.png"
      },
      {
        "judul": "Harapan Baru",
        "gambar": "assets/HarapanBaru.png"
      },
    ],
    'Fantasi': [
      {
        "judul": "The World of Immortality",
        "gambar": "assets/TheWorldOfImmortality.png"
      },
      {
        "judul": "The Son Neptune",
        "gambar": "assets/TheSonNeptune.jpeg"
      },
      {
        "judul": "The Second Life of The Crown Princess",
        "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg"
      },
      {
        "judul": "Anak dari Desa yang Raib",
        "gambar": "assets/AnakdariDesayangRaib.jpeg"
      },
      {
        "judul": "The Poppy War Perang Opium",
        "gambar": "assets/ThePoppyWarPerangOpium.jpeg"
      },
      {
        "judul": "Windwitch",
        "gambar": "assets/Windwitch.jpeg"
      },
    ],
    'Misteri': [
      {
        "judul": "Kinanti Asmara Dua Dunia",
        "gambar": "assets/KinantiAsmaraDuaDunia.jpeg"
      },
      {
        "judul": "The Last Element",
        "gambar": "assets/TheLastElement.jpeg"
      },
      {
        "judul": "Vimala (Janji Jiwa)",
        "gambar": "assets/Vimala.jpeg"
      },
      {
        "judul": "Walk Into The Shadow",
        "gambar": "assets/WalkIntoTheShadow.jpeg"
      },
      {
        "judul": "Misteri Kehidupan",
        "gambar": "assets/MisteriKehidupan.png"
      },
      {
        "judul": "Sang Penerbang Di Taman Puisi",
        "gambar": "assets/SangPenerbangDiTamanPuisi.jpeg"
      },
    ]
  };

  final List<Map<String, String>> bukuPopuler = [
    {
      "judul": "Kinanti Asmara Dua Dunia",
        "gambar": "assets/KinantiAsmaraDuaDunia.jpeg"
    },
    {
      "judul": "Vimala (Janji Jiwa)",
      "gambar": "assets/Vimala.jpeg"
    },
    {
      "judul": "Stay With Me",
      "gambar": "assets/StayWithMe.jpeg"
    },
    {
      "judul": "Cinta Dalam Diam",
      "gambar": "assets/CintaDalamDiam.png"
    },
    {
      "judul": "Our Secret Love",
      "gambar": "assets/OurSecretLove.jpeg"
    },
    {
      "judul": "Kebangkitan Dewi Api",
      "gambar": "assets/KebangkitanDewiApi.jpeg"
    },
    {
      "judul": "Istri Cantik Sang Panglima",
      "gambar": "assets/IstriCantikSangPanglima.jpeg"
    },
    {
      "judul": "Celestia Menjadi Pengantin Kaisar",
      "gambar": "assets/CelestiaMenjadiPengantinKaisar.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentList = bukuPilihan[selectedGenre] ?? [];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Beranda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: Color(0xFF555555)),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF003D82)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide:
                      const BorderSide(color: Color(0xFF003D82), width: 1.3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide:
                      const BorderSide(color: Color(0xFF003D82), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pilihan",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Lihat semua", style: TextStyle(color: Colors.red)),
              ],
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['Untuk Anda', 'Kerajaan', 'Romansa', 'Fantasi', 'Misteri']
                    .map((genre) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(genre),
                            selected: selectedGenre == genre,
                            onSelected: (_) {
                              setState(() {
                                selectedGenre = genre;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: currentList.length,
                itemBuilder: (context, index) {
                  final buku = currentList[index];
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
                            fontWeight: FontWeight.bold),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Populer",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Lihat semua", style: TextStyle(color: Colors.red)),
              ],
            ),
            const SizedBox(height: 8),
GridView.count(
  crossAxisCount: 2,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  childAspectRatio: 0.7, // ⬅ Ubah dari 0.6 → 0.7 untuk gambar lebih tinggi
  children: bukuPopuler.map((buku) {
    return Padding(
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
                  height: 300, // ⬅ Tinggi gambar diperbesar
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
    );
  }).toList(),
),


          ],
        ),
      ),
    );
  }
}