import 'package:flutter/material.dart';

class HomeController {
  String selectedGenre = 'Untuk Anda';
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredList = [];

  final Map<String, List<Map<String, String>>> bukuPilihan = {
    'Untuk Anda': [
      {"judul": "Kinanti Asmara Dua Dunia", "gambar": "assets/KinantiAsmaraDuaDunia.jpeg"},
      {"judul": "The Second Life of The Crown Princess", "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg"},
      {"judul": "The Last Element", "gambar": "assets/TheLastElement.jpeg"},
      {"judul": "A Love Worth Fighting For", "gambar": "assets/aloveworthfightingfor.jpeg"},
      {"judul": "Kebangkitan Dewi Api", "gambar": "assets/KebangkitanDewiApi.jpeg"},
      {"judul": "Celestia Menjadi Pengantin Kaisar", "gambar": "assets/CelestiaMenjadiPengantinKaisar.jpeg"},
    ],
    'Kerajaan': [
      {"judul": "Istri Cantik Sang Panglima", "gambar": "assets/IstriCantikSangPanglima.jpeg"},
      {"judul": "Reinkarnasi Queen Mafia Menjadi Putri Duke", "gambar": "assets/ReinkarnasiQueenMafiaMenjadiPutriDuke.jpeg"},
      {"judul": "Moonlight", "gambar": "assets/moonlight.jpeg"},
      {"judul": "Sword", "gambar": "assets/sword.png"},
      {"judul": "Kebangkitan Dewi Api", "gambar": "assets/KebangkitanDewiApi.jpeg"},
      {"judul": "Selir Sang Pangeran", "gambar": "assets/selirsangpangeran.jpeg"},
    ],
    'Romansa': [
      {"judul": "Santri Cantik Incaran Gus AL", "gambar": "assets/SantriCantikIncaranGusAL.png"},
      {"judul": "Love", "gambar": "assets/love.jpeg"},
      {"judul": "Our Secret Love", "gambar": "assets/OurSecretLove.jpeg"},
      {"judul": "Love Story", "gambar": "assets/LoveStory.jpeg"},
      {"judul": "Kisah Kasih Senja", "gambar": "assets/KisahKasihSenja.png"},
      {"judul": "Harapan Baru", "gambar": "assets/HarapanBaru.png"},
    ],
    'Fantasi': [
      {"judul": "The World of Immortality", "gambar": "assets/TheWorldOfImmortality.png"},
      {"judul": "The Son Neptune", "gambar": "assets/TheSonNeptune.jpeg"},
      {"judul": "The Second Life of The Crown Princess", "gambar": "assets/TheSecondLifeofTheCrownPrincess.jpeg"},
      {"judul": "Anak dari Desa yang Raib", "gambar": "assets/AnakdariDesayangRaib.jpeg"},
      {"judul": "The Poppy War Perang Opium", "gambar": "assets/ThePoppyWarPerangOpium.jpeg"},
      {"judul": "Windwitch", "gambar": "assets/Windwitch.jpeg"},
    ],
    'Misteri': [
      {"judul": "Kinanti Asmara Dua Dunia", "gambar": "assets/KinantiAsmaraDuaDunia.jpeg"},
      {"judul": "The Last Element", "gambar": "assets/TheLastElement.jpeg"},
      {"judul": "Vimala (Janji Jiwa)", "gambar": "assets/Vimala.jpeg"},
      {"judul": "Walk Into The Shadow", "gambar": "assets/WalkIntoTheShadow.jpeg"},
      {"judul": "Misteri Kehidupan", "gambar": "assets/MisteriKehidupan.png"},
      {"judul": "Sang Penerbang Di Taman Puisi", "gambar": "assets/SangPenerbangDiTamanPuisi.jpeg"},
    ],
  };

  final List<Map<String, String>> bukuPopuler = [
    {"judul": "Kinanti Asmara Dua Dunia", "gambar": "assets/KinantiAsmaraDuaDunia.jpeg"},
    {"judul": "Vimala (Janji Jiwa)", "gambar": "assets/Vimala.jpeg"},
    {"judul": "Stay With Me", "gambar": "assets/StayWithMe.jpeg"},
    {"judul": "Cinta Dalam Diam", "gambar": "assets/CintaDalamDiam.png"},
    {"judul": "Our Secret Love", "gambar": "assets/OurSecretLove.jpeg"},
    {"judul": "Kebangkitan Dewi Api", "gambar": "assets/KebangkitanDewiApi.jpeg"},
    {"judul": "Istri Cantik Sang Panglima", "gambar": "assets/IstriCantikSangPanglima.jpeg"},
    {"judul": "Celestia Menjadi Pengantin Kaisar", "gambar": "assets/CelestiaMenjadiPengantinKaisar.jpeg"},
  ];

  HomeController() {
    filteredList = List.from(bukuPilihan[selectedGenre]!);
  }

  void onGenreSelected(String genre) {
    selectedGenre = genre;
    searchController.clear();
    filterSearchResults();
  }

void filterSearchResults() {
  final query = searchController.text.toLowerCase();

  if (query.isEmpty) {
    // Jika kosong, tetap tampilkan sesuai genre terpilih
    filteredList = List.from(bukuPilihan[selectedGenre]!);
  } else {
    // Gabungkan semua buku dari semua genre
    final allBooks = bukuPilihan.values.expand((list) => list).toList();

    filteredList = allBooks
        .where((buku) => buku["judul"]!.toLowerCase().contains(query))
        .toList();
  }
}

}