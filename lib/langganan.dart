import 'package:flutter/material.dart';

class LanggananPage extends StatelessWidget {
  const LanggananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Langganan",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Nikmati pengalaman membaca dengan VIP ✨",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Pilihan Paket
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              PaketCard(
                durasi: "Per minggu",
                hargaDiskon: "Rp 4.250",
                hargaAsli: "Rp 5.000",
              ),
              PaketCard(
                durasi: "Per bulan",
                hargaDiskon: "Rp 12.750",
                hargaAsli: "Rp 15.000",
              ),
              PaketCard(
                durasi: "Per kuartal",
                hargaDiskon: "Rp 34.000",
                hargaAsli: "Rp 40.000",
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Manfaat VIP
          const Text(
            "Manfaat pembaca VIP",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(child: PaketBenefitCard(
                title: "Paket Gratis",
                items: [
                  "Jeda iklan",
                  "Unduh terbatas",
                  "Kunci konten: -"
                ],
                isVip: false,
              )),
              SizedBox(width: 12),
              Expanded(child: PaketBenefitCard(
                title: "Paket VIP 👑",
                items: [
                  "Bebas iklan",
                  "Unduh tak terbatas",
                  "Kunci konten terbuka",
                  "Lencana VIP eksklusif"
                ],
                isVip: true,
              )),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            "Akun VIP hanya dapat terhubung maksimal 3 perangkat",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 12),
          const Text(
            "Dengan melanjutkan, Anda menyetujui Ketentuan Penggunaan dan Ketentuan Langganan My novel’s, serta menerima kebijakan Privasi My novel’s",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class PaketCard extends StatelessWidget {
  final String durasi;
  final String hargaDiskon;
  final String hargaAsli;

  const PaketCard({
    super.key,
    required this.durasi,
    required this.hargaDiskon,
    required this.hargaAsli,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        children: [
          Text(
            durasi,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            hargaDiskon,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            hargaAsli,
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Disc 15%",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class PaketBenefitCard extends StatelessWidget {
  final String title;
  final List<String> items;
  final bool isVip;

  const PaketBenefitCard({
    super.key,
    required this.title,
    required this.items,
    required this.isVip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isVip ? Color(0xFFFFF8E1) : Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isVip ? Colors.amber : Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text("• $item"),
              )),
        ],
      ),
    );
  }
}
