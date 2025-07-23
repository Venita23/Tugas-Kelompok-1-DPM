import 'package:flutter/material.dart';

class IsibabPage3 extends StatelessWidget {
  final String bab;

  const IsibabPage3({super.key, required this.bab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 248, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D4FF),
        elevation: 0,
        title: Text(
          bab,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Text(
                      // Cerita panjang
                      '"Kamu dengar sendiri Wira, bapaknya Kinanti itu mata duitan. Hidup miskin tapi minta mahar lima puluh juta, memangnya dia siapa?" Sambil masuk ke dalam rumah, bu Asih mengomel.\n\n'
                      '"Cuma tamatan sekolah dasar tapi minta mahar lima puluh juta. Pak Hasan memeras kita, kamu sadar nggak?" timpal pak Wisnu, bapaknya Wira.\n\n'
                      '"Belum nikah aja udah minta mahar uang lima puluh juta, minta segala perabotan rumah tangga lengkap. Mereka pikir kita ini toko?"\n\n'
                      '"Gimana kalau udah nikah? Yang ada habis harta kita diporotin sama Kinan dan bapaknya." Wira hanya diam saja, apa yang dikatakan kedua orang tuanya benar, belum menikah saja kedua orang tua Kinan sudah minta hal yang sedikit tidak masuk di akal.\n\n'
                      'Kinan yang menguping dari teras rumah hanya bisa diam saja dengan perasaan bersalah dan tidak enak hati.\n\n'
                      '"Mas," panggilnya pada Wira setelah pak Wisnu dan bu Asih masuk ke kamar. Wira menghembuskan napas pelan kemudian menghampiri Kinan di luar.\n\n'
                      '"Mas, aku benar-benar minta maaf. Aku tidak tahu kalau bapak akan meminta sebanyak itu," ucap Kinan yang merasa tidak enak hati.\n\n'
                      '"Kalau seperti ini caranya, ibu dan bapakku semakin yakin tidak merestui pernikahan kita. Aku bukannya nggak mau ngasih, tapi permintaan bapakmu sangat banyak."\n\n'
                      '"Sudahlah mas, jangan hiraukan bapak. Aku nggak minta apa-apa sama kamu yang penting kita menikah," sahut Kinan hanya diiyakan Wira.\n\n'
                      'Wira mulai merasa risih kepada Kinan, meskipun calon istrinya sangat cantik tapi bapaknya mata duitan. Bahkan salah satu permintaan pak Hasan adalah motor baru lengkap dengan surat menyuratnya.\n\n'
                      '"Kamu pulang gih, aku mau bicara sama bapak dan ibu."\n\n'
                      '"Bilangin sama bapak dan ibu, aku minta maaf."\n\n'
                      '"Iya, cepat pulang sana!" Usir Wira yang sebenarnya merasa kecewa. Kinan pun memutuskan untuk pulang menggunakan sepeda ontel miliknya. Hanya keluarga Kinan yang hidup miskin bahkan rumahnya sudah reot nyaris roboh.\n\n'
                      'Di warung kopi dekat lapangan, biasanya pak Hasan nongkrong. Omongannya terdengar tinggi, ia membanggakan anak gadisnya yang akan dinikahi anak juragan bawang merah dan beras.\n\n'
                      '"Uang lima puluh juta, motor, perabotan rumah tangga, emas satu set dan masih banyak lagi. Anak gue nih bos, senggol dulu dong!" ucap pak Hasan dengan wajah angkuh.\n\n'
                      'Semua orang di sana mengiyakan karena sudah biasa dengan bualan pak Hasan.\n\n'
                      '"Kalau ngomong nggak usah tinggi-tinggi pak Hasan, kalau jatuh sakit nanti," ucap pak Bakti.\n\n'
                      '"Bilang aja pak Bakti iri karena sebentar lagi aku berbesan sama juragan Wisnu," sahut pak Hasan.\n\n'
                      '"Tentu saja tidak, anakku kuliah di kota dan pacaran dengan pemuda kota. Ngapain iri sama Kinan yang sekolah aja enggak." Pak Hasan terdiam, karena ucapan pak Bakti memang benar.\n\n'
                      'Tiga anak perempuan pak Hasan hanya tamat sekolah dasar. Kopi diteguk habis, yang tersisa hanya ampas. Selembar uang dua ribuan lusuh diletakkan di bawah gelas. Ia pulang sambil mengayuh sepeda ontel, berkhayal mengendarai motor baru hasil nikahkan Kinan.\n\n'
                      '"Dari mana aja, pak?" tanya Kinan cemberut.\n\n'
                      '"Ngopilah, kemana lagi?"\n\n'
                      '"Mending bapak kerja, nggak capek tiap hari ngopi mulu?"\n\n'
                      '"Pak, buat apa sih bapak minta mahar segitu banyaknya?"\n\n'
                      '"Menurut kamu buat apa? Ini kesempatan merubah nasib kita jadi orang kaya. Bapak senang kamu bisa nikah sama anak juragan Wisnu."\n\n'
                      '"Mereka marah-marah di rumah, permintaan bapak sangat banyak. Aku merasa tidak enak hati."\n\n'
                      '"Ah, kamu itu diam aja. Semua ini urusan orang tua. Kamu nggak capek hidup miskin?"\n\n'
                      '"Kita hidup miskin karena bapak malas bekerja. Lihat adik-adik bapak yang rajin jadi orang berada. Bapak kalau punya duit sedikit malah beli togel!"\n\n'
                      '"Kamu itu berani sama orang tua!" Sergah pak Hasan.\n\n'
                      '"Pak, apa yang dikatakan Kinan itu benar. Cobalah bapak bekerja, beras di dapur habis pak," ucap bu Lasmi yang letih.\n\n'
                      'Ia pontang-panting kerja dari satu kebun ke kebun lain milik tetangga. Sedangkan pak Hasan hanya ongkang-ongkang kaki.\n\n'
                      '"Punya istri satu bacotnya minta ampun. Tiap hari maksa kerja. Kamu pikir cari kerja gampang?"\n\n'
                      '"Bapak aja yang malas!" seru Kinan. "Mending bapak ke rumah pak Wisnu, ngomong kalau semua permintaan bapak itu cuma bercanda."\n\n'
                      '"Enak aja bercanda. Mereka itu orang kaya. Permintaan segitu mah kecil. Bahkan menurut bapak, itu masih murah."\n\n'
                      '"Pak, kalau sampai mereka batalkan pernikahan ini, kita akan malu besar. Mending nggak usah minta yang penting nikahnya tetap jalan," ucap bu Lasmi.\n\n'
                      '"Mending diam kalau nggak tahu urusan orang tua. Ribet bener jadi manusia!"\n\n'
                      'Setelah itu, pak Hasan masuk kamar. Kamar kecil, sesak, penuh debu, lantai masih tanah. Dua minggu lagi pernikahan Kinan dan Wira. Tapi tidak ada persiapan. Semua diserahkan ke keluarga Wira.\n\n'
                      'Pelaminan di rumah Wira. Tapi Kinan tetap bahagia. Ia sudah minta pernikahan sederhana, tapi bapaknya menuntut resepsi mewah.\n\n'
                      '"Aku dengar pak Wisnu dan bu Asih marah-marah. Gimana ini, bu?" tanya Kinan.\n\n'
                      'Bu Lasmi menghela napas panjang, tak tahu harus apa. "Bapakmu keras kepala. Mungkin sudah cerita ke mana-mana kamu mau dilamar dengan mahar besar dan motor."\n\n'
                      '"Aku malu sama mas Wira. Dia sepertinya marah sama aku." Bu Lasmi bingung mau menjawab apa. Semua sudah di luar kendalinya.',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003D82),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Selanjutnya",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
