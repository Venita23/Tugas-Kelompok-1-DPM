import 'package:flutter/material.dart';
import 'payment.dart';
import 'payment_1.dart';
import 'payment_2.dart';

class LanggananPage extends StatefulWidget {
  const LanggananPage({super.key});

  @override
  State<LanggananPage> createState() => _LanggananPageState();
}

class _LanggananPageState extends State<LanggananPage> {
  String selectedPaket = "";
  bool showPembayaran = false;

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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Paket pilihan
          Row(
            children: [
              Expanded(
                child: PaketPilihan(
                  durasi: "Per minggu",
                  hargaDiskon: "Rp 4.250",
                  hargaAsli: "Rp 5.000",
                  selected: selectedPaket == "minggu",
                  onTap: () {
                    setState(() {
                      selectedPaket = "minggu";
                      showPembayaran = false;
                    });
                  },
                ),
              ),
              Expanded(
                child: PaketPilihan(
                  durasi: "Per bulan",
                  hargaDiskon: "Rp 12.750",
                  hargaAsli: "Rp 15.000",
                  selected: selectedPaket == "bulan",
                  onTap: () {
                    setState(() {
                      selectedPaket = "bulan";
                      showPembayaran = false;
                    });
                  },
                ),
              ),
              Expanded(
                child: PaketPilihan(
                  durasi: "Per kuartal",
                  hargaDiskon: "Rp 34.000",
                  hargaAsli: "Rp 40.000",
                  selected: selectedPaket == "kuartal",
                  onTap: () {
                    setState(() {
                      selectedPaket = "kuartal";
                      showPembayaran = false;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Tombol langganan
          if (selectedPaket == "minggu" ||
              selectedPaket == "bulan" ||
              selectedPaket == "kuartal") ...[
            GestureDetector(
              onTap: () {
                setState(() {
                  showPembayaran = true;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedPaket == "minggu"
                          ? "Rp 4.250 / Per minggu"
                          : selectedPaket == "bulan"
                              ? "Rp 12.750 / Per bulan"
                              : "Rp 34.000 / Per kuartal",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Langganan Sekarang!!!",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (showPembayaran) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "GOOGLE PLAY",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    const Text("Mulai dengan menambahkan metode Pembayaran"),
                    const SizedBox(height: 16),

                    buildPaymentOption(Icons.phone_android, "Tambahkan penagihan Telkomsel"),
                    buildPaymentOption(Icons.credit_card, "Tambahkan kartu kredit atau debit"),
                    buildPaymentOption(Icons.qr_code, "Tukar kode"),
                    buildPaymentOption(Icons.account_balance_wallet, "Tambahkan DOKU"),

                    const SizedBox(height: 12),

                    buildPromoCard(
                      "Tambahkan GoPay",
                      "Cashback 50% (hingga Rp 20.000) dari GoPay setelah pembelian pertama Anda sebesar Rp 5.000 atau lebih. Persyaratan GoPay berlaku.",
                      icon: Icons.account_balance_wallet,
                      color: Colors.blue.shade50,
                    ),

                    const SizedBox(height: 12),

                    buildPromoCard(
                      "Tambahkan ShopeePay",
                      "Cashback 75% (hingga Rp 24.000) dari ShopeePay saat pembelian pertama Anda sebesar Rp 15.000 atau lebih. Persyaratan ShopeePay berlaku.",
                      icon: Icons.shopping_cart,
                      color: Colors.orange.shade50,
                    ),
                  ],
                ),
              ),
            ],
          ],

          const SizedBox(height: 24),
          const Text(
            "Manfaat pembaca VIP",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(
                child: PaketBenefitCard(
                  title: "Paket Gratis",
                  items: ["Jeda iklan", "Unduh terbatas", "Kunci konten: "],
                  isVip: false,
                ),
              ),
              Expanded(
                child: PaketBenefitCard(
                  title: "Paket VIP 👑",
                  items: [
                    "Bebas iklan",
                    "Unduh tak terbatas",
                    "Kunci konten terbuka",
                    "Lencana VIP eksklusif"
                  ],
                  isVip: true,
                ),
              ),
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

  Widget buildPaymentOption(IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "Tambahkan penagihan Telkomsel") {
          if (selectedPaket == "minggu") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelkomselGooglePayment2()),
            );
          } else if (selectedPaket == "bulan") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelkomselGooglePayment1()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelkomselGooglePayment()),
            );
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget buildPromoCard(String title, String desc,
      {required IconData icon, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaketPilihan extends StatelessWidget {
  final String durasi;
  final String hargaDiskon;
  final String hargaAsli;
  final bool selected;
  final VoidCallback onTap;

  const PaketPilihan({
    super.key,
    required this.durasi,
    required this.hargaDiskon,
    required this.hargaAsli,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF4E0),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? Colors.deepOrange : Colors.orange.shade200,
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [BoxShadow(color: Colors.orange.withOpacity(0.2), blurRadius: 8)]
              : [],
        ),
        child: Column(
          children: [
            Text(durasi, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(hargaDiskon,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
              child: const Text("Disc 15%", style: TextStyle(color: Colors.red, fontSize: 12)),
            ),
          ],
        ),
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
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isVip ? const Color(0xFFFFF8E1) : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isVip ? Colors.amber : Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text("\u2022 $item"),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
