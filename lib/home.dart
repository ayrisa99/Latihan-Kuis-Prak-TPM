import 'package:flutter/material.dart';
import 'package:latihankuis/login.dart';
import 'package:latihankuis/order.dart';

class Home extends StatelessWidget {
  final String username;

  const Home({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    //List Menu Apa Saja
    List<Map<String, dynamic>> daftarMenu = [
      {
        "gambar": "/image/piring.jpeg",
        "nama": "Nasi Goreng",
        "harga": "Rp15000",
      },
      {"gambar": "/image/piring.jpeg", "nama": "Mie Ayam", "harga": "Rp12000"},
      {"gambar": "/image/piring.jpeg", "nama": "Sate Ayam", "harga": "Rp20000"},
      {"gambar": "/image/piring.jpeg", "nama": "Bakso", "harga": "Rp10000"},
      {"gambar": "/image/piring.jpeg", "nama": "Soto Ayam", "harga": "Rp7000"},
      {"gambar": "/image/piring.jpeg", "nama": "Gado-gado", "harga": "Rp12000"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hallo @$username!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Mau makan apa hari ini?",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              Image.asset('/image/makanan2.jpeg'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Daftar Menu : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //dalam 1baris ada berapa kolom
                    crossAxisSpacing: 10, //jarak antar kolom
                    mainAxisSpacing: 10, //jarak antar baris
                    childAspectRatio: 0.9,
                  ),
                  itemCount: daftarMenu.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              daftarMenu[index]["gambar"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  daftarMenu[index]["nama"]!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  daftarMenu[index]["harga"]!,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            // width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => OrderPage(
                                            namaMakanan:
                                                daftarMenu[index]["nama"],
                                            gambarMakanan:
                                                daftarMenu[index]["gambar"],
                                            hargaMakanan: double.parse(
                                              daftarMenu[index]["harga"]
                                                  .replaceAll("Rp", "")
                                                  .trim(),
                                            ),
                                          ),
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Pesan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
