import 'package:flutter/material.dart';

class IsibabPage4 extends StatelessWidget {
  final String bab;

  const IsibabPage4({super.key, required this.bab});

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
                      'Santriwati berlarian menuju pagar pembatas antara Ndalem dan gedung sekolah karena mendengar kabar kalau Gus tampan sejuta pesona pulang dari studinya di Mesir. Para santriwati penasaran apakah Gus idola mereka itu semakin tampan atau sebaliknya.\n\n'
                      '"Ada apa itu, Za?"\n\n'
                      '"Kamu nggak denger ya? Tadi Santri bilang apa?" jawab Khanza atas pertanyaan Alsyafara.\n\n'
                      '"Enggak? Apaan emang?" tanya Alsyafara.\n\n'
                      '"Makanya, kuping tuh dipakai, jangan dibuat pajangan doang," sahut Khanza.\n\n'
                      '"Apaan sih, Za? Kupingku bukan lukisan yang dijadikan pajangan. Aneh kamu," jawab Alsyafara sambil mencubit lengan Khanza.\n\n'
                      '"Sakit, Syafa," ringis Khanza.\n\n'
                      '"Rasain," jawab Alsyafara dan langsung pergi dari sana.\n\n'
                      'Khanza pun menyusul Alsyafara ke arah asrama putri karena Alsyafara bukan tipe cewek yang suka kepo dengan hal-hal yang tidak ia anggap penting.\n\n'
                      'Sedangkan di sisi lain, seorang Gus muda sedang dalam perjalanan menuju Pesantren Al-Mukmin. Dia adalah Gus Alraz Al-Ghifari Maulana, putra kedua dari Kyai Zainuddin dan Nyai Sindi.\n\n'
                      'Sekarang Gus Al dalam perjalanan menuju rumahnya bersama sang kakak, Ammar Al-Ghifari Maulana, yang menjemput Gus Al di bandara.\n\n'
                      '"Bagaimana keadaan pesantren selama Al tidak ada, Mas?" tanya Gus Al.\n\n'
                      '"Alhamdulillah, berkembang," jawab Gus Ammar.\n\n'
                      '"Alhamdulillah, Al ikut senang mendengarnya."\n\n'
                      '"Mas belum menemukan gadis yang bisa menggantikan posisi Wanni," lanjut Gus Ammar.\n\n'
                      '"Tapi dia berkhianat, Mas."\n\n'
                      '"Mas masih menunggunya, Al, karena dia wanita yang Mas cintai."\n\n'
                      '"Sekarang gantian, kapan kamu nikah?" tanya Gus Ammar.\n\n'
                      '"Tidak ada yang cocok, Mas."\n\n'
                      '"Sebenarnya Al sedang mencari seseorang, Mas," ucap Gus Al dalam hati.\n\n'
                      'Tak lama, mobil mereka memasuki kawasan pesantren. Para kang santri dan santriwati sudah menanti. Ketika Gus Al turun dari mobil, suara kagum pun terdengar dari santriwati:\n\n'
                      '"Masya Allah, Gus Al kok tambah ganteng sih?"\n\n'
                      '"Calon laki aku itu..." dan berbagai bisikan kagum lainnya.\n\n'
                      '"Assalamu\'alaikum Abah, Umma," sapa Gus Al.\n\n'
                      '"Wa\'alaikumsalam. Ya Allah, Le, Umma kangen banget sama kamu," jawab Umma Sindi memeluknya erat.\n\n'
                      '"Al juga kangen sama Umma dan Abah."\n\n'
                      'Setelah itu, mereka masuk dan berbincang di ruang tengah.\n\n'
                      '"Bagaimana bisnismu di sana, Le?"\n\n'
                      '"Alhamdulillah, lancar Bah."\n\n'
                      '"Le, mau makan atau istirahat dulu?"\n\n'
                      '"Istirahat dulu, Umma. Capek banget habis perjalanan jauh."\n\n'
                      '"Ya sudah, nanti sore kita bahas CV ta\'aruf dari anak Kyai Saleh," ucap Umma Sindi membuat Gus Al menghela napas.\n\n'
                      '"Umma," tegur Abah Zainuddin.\n\n'
                      '"Iya, iya Bah."\n\n'
                      'Gus Al pun masuk ke kamarnya yang sudah lama dirindukannya. Ia rebah, menatap langit-langit kamar sambil mengingat sesuatu yang sangat membekas.\n\n'
                      '"Di mana kamu ya, Ukhty? Mengapa setiap malam kamu selalu hadir dalam mimpiku?"\n\n'
                      '"Ya Allah, jika dia gadis yang Kau kirimkan untuk menjadi jodohku, maka pertemukanlah aku dengannya. Dan jika dia hanya pemanis dalam mimpiku, maka hilangkanlah dia dalam mimpiku, karena kehadirannya sangat mengganggu perasaanku."\n\n'
                      'Gus Al pun terlelap dalam tidurnya. Lalu, dalam mimpinya...\n\n'
                      '"Wa\'alaikumsalam."\n\n'
                      'Deg.\n\n'
                      '"Kamu..."\n\n'
                      '"Gus..."\n\n'
                      '"K-kamu, k-kenapa kamu ada di sini?" tanya Gus Al saat bertemu gadis dalam mimpinya itu.\n\n'
                      '"Saya datang untuk menemuimu, Gus," jawab gadis itu sambil menundukkan pandangan.',
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
                  // Aksi untuk tombol "Selanjutnya"
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
