import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

class HomepageCust extends StatelessWidget {
  const HomepageCust({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: SuzukiFinanceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Image.asset('res/images/baleno.jpg', height: 150),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildIconColumn(Icons.directions_car, 'Opsi Pembiayaan'),
                    const SizedBox(width: 16),
                    _buildIconColumn(Icons.local_offer, 'Promo'),
                    const SizedBox(width: 16),
                    _buildIconColumn(Icons.category, 'Produk'),
                    const SizedBox(width: 16),
                    _buildIconColumn(Icons.location_on, 'Cabang'),
                    const SizedBox(width: 16),
                    _buildIconColumn(Icons.calculate, 'Simulasi Kredit'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Katalog Produk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Image.asset('res/images/baleno.jpg', height: 150),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Image.asset('res/images/baleno.jpg', height: 150),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text('Order Kendaraan'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(top: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  8.0,
                ), // opsional: sudut membulat
                child: Image.asset(
                  'res/images/baleno.jpg', // bisa diganti dengan iklan suzuki
                  height: 100, // lebih ramping dari katalog
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Tambahkan ini!
        backgroundColor: Color(
          0xFF0071C5,
        ), // Biru Suzuki, bisa diubah sesuai preferensi
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_device_information),
            label: 'About',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Column _buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.0),
          child: Icon(icon, color: Colors.blue[600], size: 30),
        ),
        SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }
}
