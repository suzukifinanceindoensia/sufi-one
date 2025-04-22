import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

class HomepageCust extends StatelessWidget {
  const HomepageCust({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        centerTitle: false,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Menu Dropdown
            PopupMenuButton<String>(
              icon: Icon(Icons.menu, color: Colors.white),
              onSelected: (value) {
                print('Menu dipilih: $value');
                switch (value) {
                  case 'Zeus':
                    Get.toNamed(AppRoutes.zeus);
                    break;
                  case 'Mobile Collection':
                    Get.toNamed(AppRoutes.mobileCollection);
                    break;
                  // routing lain jika sudah tersedia
                  default:
                    Get.snackbar(
                      'Info',
                      'Fitur "$value" belum tersedia',
                      backgroundColor: Colors.orange.shade200,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                }
              },
              itemBuilder:
                  (BuildContext context) => [
                    PopupMenuItem(value: 'Zeus', child: Text('Zeus')),
                    PopupMenuItem(
                      value: 'Mobile Collection',
                      child: Text('Mobile Collection'),
                    ),
                    PopupMenuItem(
                      value: 'Mobile Survey',
                      child: Text('Mobile Survey'),
                    ),
                    PopupMenuItem(
                      value: 'Mobile Smile',
                      child: Text('Mobile Smile'),
                    ),
                    PopupMenuItem(
                      value: 'SDMS',
                      child: Text('Suzuki Dealer Management System'),
                    ),
                    PopupMenuItem(
                      value: 'SLIK',
                      child: Text('Sistem Layanan Informasi Keuangan'),
                    ),
                    PopupMenuItem(
                      value: 'BAPK',
                      child: Text('Berita Acara Penerimaan Kas'),
                    ),
                    PopupMenuItem(value: 'Promo', child: Text('Promo')),
                    PopupMenuItem(value: 'Berita', child: Text('Berita')),
                    PopupMenuItem(value: 'Fasilitas', child: Text('Fasilitas')),
                    PopupMenuItem(value: 'Cabang', child: Text('Cabang')),
                    PopupMenuItem(value: 'Kontak', child: Text('Kontak')),
                    PopupMenuItem(
                      value: 'Tentang Suzuki',
                      child: Text('Tentang Suzuki'),
                    ),
                  ],
            ),
            SizedBox(width: 12),

            // Logo Suzuki
            Image.asset('res/images/logo_suzuki.png', height: 40),
            SizedBox(width: 12),

            // Judul
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Suzuki Finance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Kredit Resmi Suzuki',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),

      // Isi Body
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
                    SizedBox(width: 16),
                    _buildIconColumn(Icons.local_offer, 'Promo'),
                    SizedBox(width: 16),
                    _buildIconColumn(Icons.category, 'Produk'),
                    SizedBox(width: 16),
                    _buildIconColumn(Icons.location_on, 'Cabang'),
                    SizedBox(width: 16),
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
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'res/images/baleno.jpg',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF0071C5),
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

  // Widget builder untuk ikon shortcut horizontal
  Column _buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
