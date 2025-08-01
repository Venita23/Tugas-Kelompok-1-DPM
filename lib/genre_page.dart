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
        "deskripsi": "Kinanti, wanita ini nyaris gila akibat pernikahannya yang batal di gelar ebenarnya tidak batal, hanya saja disaat hari pernikahan tiba, ternyata pengantin perempuan yang seharusnya bersanding dengan Wira adalah Kinanti diganti dengan Citra, saudara sepupu Kinanti. Gunjingan dan hinaan yang dilontarkan kepada keluarga Kinanti membuat sang bapak yang bernama Hasan jatuh sakit kemudian meninggal dunia. Dalam keterpurukannya, seseorang datang menghibur Kinanti, bukan dari golongan manusia, tapi jin yang bernama Lindu Ajisangkana."
      },
      {
        "judul": "Reinkarnasi Queen Mafia Menjadi Putri Duke",
        "penulis": "Vir & Sam",
        "bab": "150",
        "update": "Tiap Hari",
        "gambar": "assets/ReinkarnasiQueenMafiaMenjadiPutriDuke.jpeg",
      },
      {
        "judul": "The Second Life of The Crown Princess",
        "penulis": "Vir & Sam",
        "bab": "150",
        "update": "Tiap Hari",
        "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg",
      },
      {
        "judul": "The Last Element",
        "penulis": "Vir & Sam",
        "bab": "150",
        "update": "Tiap Hari",
        "gambar": "assets/TheLastElement.jpeg",
      },
      {
        "judul": "A Love Worth Fighting For",
        "penulis": "Vir & Sam",
        "bab": "150",
        "update": "Tiap Hari",
        "gambar": "assets/aloveworthfightingfor.jpeg",
      },
      {
        "judul": "Kebangkitan Dewi Api",
        "penulis": "Vir & Sam",
        "bab": "150",
        "update": "Tiap Hari",
        "gambar": "assets/KebangkitanDewiApi.jpeg",
      },
      // Tambahkan bacaan lain dengan key 'deskripsi'
    ],
    'Kerajaan': [
      {
        "judul": "Istri Cantik Sang Panglima ",
        "penulis": "Anonim",
        "bab": "150",
        "update": "Setiap Minggu",
        "gambar": "assets/IstriCantikSangPanglima.jpeg",
        "deskripsi": "Liu Fei, wanita keturunan bangsawan yang jatuh cinta pada putra mahkota. Dia bahkan rela merelakan segalanya demi mendapatkan pria yang ia cintai. Namun sayangnya, setelah ia mendapatkan apa yang diinginkan, ia justru hidup dalam penderitaan. Pria yang ia cintai dengan segenap jiwa dan raganya justru merupakan orang yang kejam yang menghancurkan dirinya. Tidak cukup dengan membunuh seluruh keluarganya dan mengirimnya ke istana dingin, pria itu dengan kejam membunuh bayi yang ada dalam kandungannya. Dengan darah yang masih mengalir dari tubuhnya, ia diseret dan dijatuhi hukuman mati dengan tuduhan pengkhianatan dan pemberontakan."
      },
      {
        "judul": "Reinkarnasi Queen Mafia Menjadi Putri Duke",
        "penulis": "Amey MK",
        "bab": "100",
        "update": "Tiap Hari",
        "gambar": "assets/ReinkarnasiQueenMafiaMenjadiPutriDuke.jpeg",
      },
      {
        "judul": "Moonlight",
        "penulis": "Enigma",
        "bab": "50",
        "update": "Tiap Hari",
        "gambar": "assets/moonlight.jpeg",
      },
      {
        "judul": "Jenderal Wanita Badas Menjadi Permaisuri Kejam",
        "penulis": "Luna Moo",
        "bab": "40",
        "update": "Tiap Hari",
        "gambar": "assets/JenderalWanitaBadasMenjadiPermaisuriKejam.jpeg",
      },{
        "judul": "Jatuh Cinta Dengan pangeran Licik",
        "penulis": "Nailaaa",
        "bab": "95",
        "update": "Seminggu Sekali", 
        "gambar": "assets/JatuhCintadenganpangeranlicik.jpeg",
      },
      {
        "judul":" Selir Pilihan Sang Pangeran",
        "penulis": "Princess Pefiiz",
        "bab": "150",
        "update": "Tiap Hari",
        "gambar": "assets/selirsangpangeran.jpeg",
      },
      {
        "judul": "Istri Kecil Sang Bupati",
        "penulis": "Ulvaoslan",
        "bab": "75",
        "update": "Seminggu Sekali",
        "gambar": "assets/IstriKecilSangBupati.jpeg",
      },
      {
        "judul": "Reinkarnasi Menjadi Bayi ELF",
        "penulis": "Gekko_4",
        "bab": "67",
        "update": "-",
        "gambar": "assets/ReinkarnasiMenjadiBayiELF.jpeg",
      },
      {
        "judul": "Kebangkitan Dewi Api",
        "penulis": " Yehana",
        "bab": "105",
        "update": "Tiap Hari",
        "gambar": "assets/KebangkitanDewiApi.jpeg",
      },
      {
        "judul": "Celestia Menjadi Pengantin Kaisar",
        "penulis": "Aluna Sty",
        "bab": "178",
        "update": "Seminggu Sekali",
        "gambar": "assets/CelestiaMenjadiPengantinKaisar.jpeg",
      },
    ],
    'Romansa': [
      {
        "judul": "Santri Cantik Incaran Gus AL",
        "penulis": "Naylest",
        "bab": "100",
        "update": "Tiap Hari",
        "gambar": "assets/SantriCantikIncaranGusAL.png",
        "deskripsi": "“Ya Allah, jika dia gadis yang Kau kirimkan untuk menjadi jodohku, maka pertemukanlah aku dengannya. Dan jika dia hanya pemanis dalam mimpiku, maka hilangkanlah dia dalam mimpiku, karena kehadirannya sangat mengganggu perasaanku.” Mendapatkan mimpi bertemu seorang gadis selama tiga tahun berturut-turut, Gus Alraz Al-Ghifari Maulana dibuat dilema akan kehadiran gadis tersebut, karena selama ini Gus Alraz, atau yang sering disapa Gus Al, tak pernah sekalipun bertemu dengannya."
      },
      {
        "judul": "Love",
        "penulis": "Olivia Wilson",
        "bab": "100",
        "update": "Tiap Hari",
        "gambar": "assets/love.jpeg",
      },
      {
        "judul": "Our Secret Love",
        "penulis": "Claudia Wilson",
        "bab": "136",
        "update": "Tiap Hari",
        "gambar": "assets/OurSecretLove.jpeg",
      },
      {
        "judul": "A Love Worth Fighting For",
        "penulis": "Olivia Wilson",
        "bab": "200",
        "update": "Tiap Hari",
        "gambar": "assets/ALoveWorthFightingFor.jpeg",
      },
      {
        "judul": "Love Story",
        "penulis": "Lorna Alvarado",
        "bab": "118",
        "update": "Tiap Hari",
        "gambar": "assets/LoveStory.jpeg",
      },
       {
        "judul": "The Story Of One Love",
        "penulis": "Olivia Wilson",
        "bab": "145",
        "update": "Tiap Hari",
        "gambar": "assets/TheStoryOfOneLove.jpeg",
      },
      {
        "judul": "Cinta Dalam Diam",
        "penulis": "Ailaaa",
        "bab": "60",
        "update": "Tiap Hari",
        "gambar": "assets/CintaDalamDiam.png",
      },
      {
        "judul": "Harapan Baru",
        "penulis": "Itsuki Takashi",
        "bab": "85",
        "update": "Tiap Hari",
        "gambar": "assets/HarapanBaru.png",
      },
    ],
    'Fantasi': [
      {
        "judul": "The World Of Immortality",
        "penulis": "Yunnii Parkk",
        "bab": "168",
        "update": "Tiap Hari",
        "gambar": "assets/TheWorldOfImmortality.png",
        "deskripsi":"Dengan kekuatan aku akan menguasai dunia. Dengan kekuatan aku akan menghancurkan apapun yang menghalangiku. Dengan kekuatan aku akan mencapai puncak keabadian.  Namun, jalan menuju puncak keabadian tidak selalu mulus dan terdapat juga berbagai macam rintangan serta misteri di dalamnya."
      },
      {
        "judul": "The Second Life Of The Crown Princess",
        "penulis": "Wintersnow",
        "bab": "168",
        "update": "Tiap Hari",
        "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg",
      },
      {
        "judul": "Demon In The Wood",
        "penulis": "Grishaverse",
        "bab": "100",
        "update": "Tiap Hari",
        "gambar": "assets/DemonInTheWood.jpeg",
      },
      {
        "judul": "Windwitch",
        "penulis": "Susan Dennerd",
        "bab": "200",
        "update": "Tiap Hari",
        "gambar": "assets/Windwitch.jpeg",
      },
      {
        "judul": "The Muse",
        "penulis": "Jessie Burton",
        "bab": "120",
        "update": "Tiap Hari",
        "gambar": "assets/TheMuse.jpeg",
      },
      {
        "judul": "Harta Vaeran",
        "penulis": "Pratama Wirya",
        "bab": "118",
        "update": "Tiap Hari",
        "gambar": "assets/HartaVaeran.jpeg",
      },
       {
        "judul": "The Son Neplune ",
        "penulis": "Rick Riordan",
        "bab": "80",
        "update": "Tiap Hari",
        "gambar": "assets/TheSonNeptune.jpeg",
      },
      {
        "judul": "Pendekar Syair Terkutuk",
        "penulis": "Rendra Harahpa",
        "bab": "60",
        "update": "Tiap Hari",
        "gambar": "assets/PendekarSyairTerkutuk.jpeg",
      },
      {
        "judul": "Anak dari Desa yang Raib",
        "penulis": "Marina Saga",
        "bab": "85",
        "update": "Tiap Hari",
        "gambar": "assets/AnakdariDesayangRaib.jpeg",
      },
    ],
    'Misteri': [
      {
        "judul": "Kinanti Asmara Dua Dunia",
        "penulis": "Vir & Sam",
        "bab": "150",
        "update": "Tiap Hari",
        "gambar": "assets/KinantiAsmaraDuaDunia.jpeg",
        "deskripsi": "Kinanti, wanita ini nyaris gila akibat pernikahannya yang batal di gelar ebenarnya tidak batal, hanya saja disaat hari pernikahan tiba, ternyata pengantin perempuan yang seharusnya bersanding dengan Wira adalah Kinanti diganti dengan Citra, saudara sepupu Kinanti. Gunjingan dan hinaan yang dilontarkan kepada keluarga Kinanti membuat sang bapak yang bernama Hasan jatuh sakit kemudian meninggal dunia. Dalam keterpurukannya, seseorang datang menghibur Kinanti, bukan dari golongan manusia, tapi jin yang bernama Lindu Ajisangkana."
      },
      {
        "judul": "Sang Penerbang Di Taman Puisi",
        "penulis": "Brigitte Schwartz",
        "bab": "100",
        "update": "Tiap Hari",
        "gambar": "assets/SangPenerbangDiTamanPuisi.jpeg",
      },
      {
        "judul": "Ahli Waris yang Tertukar",
        "penulis": "Ratu Peri",
        "bab": "100",
        "update": "Tiap Hari",
        "gambar": "assets/AhliWarisyangTertukar.jpeg",
      },
      {
        "judul": "TheLastElement",
        "penulis": "Aroogadha",
        "bab": "100",
        "update": "Seminggu Sekali",
        "gambar": "assets/TheLastElement.jpeg",
      },{
        "judul": "The Poppy War Perang Opium",
        "penulis": "R. F. Kuang",
        "bab": "150",
        "update": "Tiap Hari", 
        "gambar": "assets/ThePoppyWarPerangOpium.jpeg",

      },
      {
        "judul": "Vimala (Janji Jiwa)",
        "penulis": "Vir & Sam",
        "bab": "75",
        "update": "Tiap Hari",
        "gambar": "assets/Vimala.jpeg",
      },
      {
        "judul": "Untuk Sisi Lain",
        "penulis": "Victoria Anggara",
        "bab": "69",
        "update": "-",
        "gambar": "assets/UntukSisiLain.jpeg",
      },
      {
        "judul": "The Vampire World",
        "penulis": "Vearth",
        "bab": "80",
        "update": "-",
        "gambar": "assets/TheVampireWorld.jpeg",
      },
      {
        "judul": "Walk Into The Shadow",
        "penulis": "Estelle Darcy",
        "bab": "138",
        "update": "Tiap Hari",
        "gambar": "assets/WalkIntoTheShadow.jpeg",
      },
      {
        "judul": "Anak dari Desa yang Raib",
        "penulis": "Estelle Darcy",
        "bab": "40",
        "update": "Tiap Hari",
        "gambar": "assets/AnakdariDesayangRaib.jpeg",
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
    : IndexedStack(
        index: _tabController.index,
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