import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenrePage(), // ← Diganti dari BacaanPage() ke GenrePage()
    );
  }
}


class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchController;

  final List<String> kategori = ['Untuk Anda', 'Kerajaan', 'Romansa', 'Fantasi', 'Misteri'];

  // 📝 Ubah isi setiap genre di bawah ini (judul, penulis, gambar, bab, update)
  final Map<String, List<Map<String, String>>> semuaBacaan = {
    'Untuk Anda': [
      {"judul": "Kinanti Asmara Dua Dunia", "penulis": "Vir & Sam", "bab": "150", "update": "Tiap Hari", "gambar": "assets/KinantiAsmaraDuaDunia.jpeg"},
      {"judul": "The World Of Immortality", "penulis": "Yunnii Parkk", "bab": "80", "update": "Tiap Hari", "gambar": "assets/TheWorldOfImmortality.png"},
      {"judul": "Santri Cantik Incaran Gus AL", "penulis": "Naylest", "bab": "100", "update": "Tiap Hari", "gambar": "assets/SantriCantikIncaranGusAL.png"},
      {"judul": "Istri Cantik Sang Panglima", "penulis": "Araina", "bab": "100", "update": "Tiap Hari", "gambar": "assets/IstriCantikSangPanglima.jpeg"},
      {"judul": "The Second Life of The Crown Princess", "penulis": "Wintersnow", "bab": "168", "update": "Tiap Hari", "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg"},
      {"judul": "Vimala (Janji Jiwa)", "penulis": "Vir & Sam", "bab": "75", "update": "Tiap Hari", "gambar": "assets/Vimala.jpeg"},
      {"judul": "Istri Kecil Sang Bupati", "penulis": "Ulvaoslan", "bab": "75", "update": "Seminggu Sekali", "gambar": "assets/IstriKecilSangBupati.jpeg"},
      {"judul": "Stay With Me", "penulis": "Claudia Wilson", "bab": "50", "update": "Seminggu Sekali", "gambar": "assets/StayWithMe.jpeg"},
      {"judul": "Kebangkitan Dewi Api", "penulis": "Yehana", "bab": "105", "update": "Tiap Hari", "gambar": "assets/KebangkitanDewiApi.jpeg"},
      {"judul": "Celestia Menjadi Pengantin Kaisar", "penulis": "Aluna Sty", "bab": "178", "update": "Seminggu Sekali", "gambar": "assets/CelestiaMenjadiPengantinKaisar.jpeg"},
    ],
    'Kerajaan': [
      {"judul": "Istri Cantik Sang Pangeran", "penulis": "Araina", "bab": "100", "update": "Tiap Hari", "gambar": "assets/IstriCantikSangPanglima.jpeg"},
      {"judul": "Reinkarnasi Queen Mafia Menjadi Putri Duke", "penulis": "Amey MK", "bab": "100", "update": "Tiap Hari", "gambar": "assets/ReinkarnasiQueenMafiaMenjadiPutriDuke.jpeg"},
      {"judul": "Moonlight", "penulis": "Enigma", "bab": "50", "update": "Tiap Hari", "gambar": "assets/moonlight.jpeg"},
      {"judul": "Sword", "penulis": "Olivia Wilson", "bab": "75", "update": "Seminggu Dua kali", "gambar": "assets/sword.png"},
      {"judul": "Jenderal Wanita Badas Menjadi Permaisuri Kejam", "penulis": "Luna Moo", "bab": "40", "update": "2 Hari", "gambar": "assets/JenderalWanitaBadasMenjadiPermaisuriKejam.jpeg"},
      {"judul": "Jatuh Cinta Dengan Pangeran Licik", "penulis": "Nailaaa", "bab": "95", "update": "Seminggu Sekali", "gambar": "assets/JatuhCintadenganpangeranlicik.jpeg"},
      {"judul": "Istri Kecil Sang Bupati", "penulis": "Ulvaoslan", "bab": "75", "update": "Seminggu Sekali", "gambar": "assets/IstriKecilSangBupati.jpeg"},
      {"judul": "Kebangkitan Dewi Api", "penulis": "Yehana", "bab": "105", "update": "Tiap Hari", "gambar": "assets/KebangkitanDewiApi.jpeg"},
      {"judul": "Reinkarnasi Menjadi Bayi ELF", "penulis": "Gekko_4", "bab": "67", "update": "Seminggu Dua Kali", "gambar": "assets//ReinkarnasiMenjadiBayiELF.jpeg"},
      {"judul": "Celestia Menjadi Pengantin Kaisar", "penulis": "Aluna Sty", "bab": "178", "update": "Seminggu Sekali", "gambar": "assets/CelestiaMenjadiPengantinKaisar.jpeg"},
    ],
    'Romansa': [
      {"judul": "Santri Cantik Incaran Gus AL", "penulis": "Naylest", "bab": "100", "update": "Tiap Hari", "gambar": "assets/SantriCantikIncaranGusAL.png"},
      {"judul": "Love", "penulis": "Olivia Wilson", "bab": "100", "update": "Tiap Hari", "gambar": "assets/love.jpeg"},
      {"judul": "A Love Worth Fightig For", "penulis": "Olivia Wilson", "bab": "200", "update": "Dua Hari Sekali", "gambar": "assets/aloveworthfightingfor.jpeg"},
      {"judul": "The Story of One Love", "penulis": "Olivia Wilson", "bab": "145", "update": "Seminggu Sekali", "gambar": "assets/TheStoryofOneLove.jpeg"},
      {"judul": "Alam dan Langit Sandykala", "penulis": "Debora Oline", "bab": "65", "update": "Tiap Hari", "gambar": "assets/AlamdanLangitSandykala.jpeg"},
      {"judul": "Cinta Dalam Diam", "penulis": "Ailaaa", "bab": "60", "update": "Seminggu Sekali", "gambar": "assets/CintaDalamDiam.png"},
      {"judul": "Kisah Kasih Senja", "penulis": "Lorna Alvarado", "bab": "85", "update": "Tiap Hari", "gambar": "assets/KisahKasihSenja.png"},
      {"judul": "Harapan Baru", "penulis": "Itsuki Takashi", "bab": "150", "update": "Tiap Hari", "gambar": "assets/HarapanBaru.png"},
      {"judul": "Love Story", "penulis": "Lorna Alvarado", "bab": "118", "update": "Tiap Hari", "gambar": "assets/LoveStory.jpeg"},
      {"judul": "Our Secret Love", "penulis": "Claudia Wilson", "bab": "56", "update": "Tiap Hari", "gambar": "assets/OurSecretLove.jpeg"},
    ],
    'Fantasi': [
    {"judul": "The World Of Immortality", "penulis": "Yunnii Parkk", "bab": "80", "update": "Tiap Hari", "gambar": "assets/TheWorldOfImmortality.png"},
    {"judul": "The Second Life of The Crown Princess", "penulis": "Wintersnow", "bab": "168", "update": "Tiap Hari", "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg"},
    {"judul": "Demon In The Wood", "penulis": "Grishaverse", "bab": "100", "update": "Tiap Hari", "gambar": "assets/DemonInTheWood.jpeg"},
    {"judul": "Windwitch", "penulis": "Susan Dennerd", "bab": "200", "update": "Seminggu", "gambar": "assets/Windwitch.jpeg"},
    {"judul": "Harta Vaeran", "penulis": "Pratama Wirya", "bab": "65", "update": "Tiap Hari", "gambar": "assets/HartaVaeran.jpeg"},
    {"judul": "The Muse", "penulis": "Jessie Burton", "bab": "120", "update": "Tiap Hari", "gambar": "assets/TheMuse.jpeg"},
    {"judul": "The Son Neplune", "penulis": "Rick Riordan", "bab": "80", "update": "Tiap Hari", "gambar": "assets/TheSonNeptune.jpeg"},
    {"judul": "Pendekar Syair Terkutuk", "penulis": "Rendra Harahap", "bab": "60", "update": "Dua Hari Sekali", "gambar": "assets/PendekarSyairTerkutuk.jpeg"},
    {"judul": "The Poppy War Perang Opium", "penulis": "R. F. Kuang", "bab": "150", "update": "Tiap Hari", "gambar": "assets/ThePoppyWarPerangOpium.jpeg"},
    {"judul": "Anak dari Desa yang Raib", "penulis": "Marina Saga", "bab": "44", "update": "Tiap Hari", "gambar": "assets/AnakdariDesayangRaib.jpeg"},
  ],

    'Misteri': [
      {"judul": "Kinanti Asmara Dua Dunia", "penulis": "Vir & Sam", "bab": "150", "update": "Tiap Hari", "gambar": "assets/KinantiAsmaraDuaDunia.jpeg"},
      {"judul": "Sang Penerbang Di Taman Puisi", "penulis": "Briigitte Schwartz", "bab": "100", "update": "Tiap Hari", "gambar": "assets/SangPenerbangDiTamanPuisi.jpeg"},
      {"judul": "Ahli Waris yang Tertukar", "penulis": "Ratu Peri", "bab": "100", "update": "Dua Hari Sekali", "gambar": "assets/AhliWarisyangTertukar.jpeg"},
      {"judul": "The Last Element", "penulis": "Aroogadha", "bab": "100", "update": "Seminggu sekali", "gambar": "assets/TheLastElement.jpeg"},
      {"judul": "Vimala (Janji Jiwa)", "penulis": "Vir & Sam", "bab": "75", "update": "Tiap Hari", "gambar": "assets/Vimala.jpeg"},
      {"judul": "The  Vampire World", "penulis": "Vearth", "bab": "80", "update": "Tiap Hari", "gambar": "assets/TheVampireWorld.jpeg"},
      {"judul": "Misteri Kehidupan", "penulis": "Ketut Susilo", "bab": "150", "update": "Seminggu Sekali", "gambar": "assets/MisteriKehidupan.png"},
      {"judul": "Untuk Sisi Lain", "penulis": "Victoria Anggara", "bab": "69", "update": "Tiap Hari", "gambar": "assets/UntukSisiLain.jpeg"},
      {"judul": "Walk Into The Shadow", "penulis": "Estelle Darcy", "bab": "138", "update": "Tiap Hari", "gambar": "assets/WalkIntoTheShadow.jpeg"},
      {"judul": "Anak dari Desa yang Raib", "penulis": "Marina Saga", "bab": "44", "update": "Tiap Hari", "gambar": "assets/AnakdariDesayangRaib.jpeg"},
    ],
  };


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
     
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}