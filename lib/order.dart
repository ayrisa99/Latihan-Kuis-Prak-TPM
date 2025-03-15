import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String namaMakanan;
  final String gambarMakanan;
  final double hargaMakanan;

  const OrderPage({
    super.key,
    required this.namaMakanan,
    required this.gambarMakanan,
    required this.hargaMakanan,
  });

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int jumlah = 1;
  double totalHarga = 0; // Tambahkan variabel total harga
  final TextEditingController jumlahController = TextEditingController();

  @override
  void dispose() {
    jumlahController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Order"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(widget.gambarMakanan, width: 200),
              Text(
                widget.namaMakanan,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Harga: Rp ${widget.hargaMakanan.toStringAsFixed(0)}"),

              // Input Jumlah Pesanan
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // width: 150, // Tambahkan lebar lebih besar
                  // height: 50, // Tambahkan tinggi agar lebih nyaman
                  child: TextField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Masukkan Jumlah',
                    ),
                  ),
                ),
              ),

              // Tombol Submit
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        jumlah = int.tryParse(jumlahController.text) ?? 1;
                        totalHarga = widget.hargaMakanan * jumlah;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              if (totalHarga > 0)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total Harga: Rp ${totalHarga.toStringAsFixed(0)}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
