import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/controllers/homepage_cust_controllers.dart';

class HomepageCust extends StatelessWidget {
  const HomepageCust({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageCustControllers());

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: AppBar(
        backgroundColor: AppColors.snack,
        centerTitle: false,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            PopupMenuButton<String>(
              icon: Icon(Icons.menu, color: AppColors.bg1),
              color: AppColors.bg1,
              onSelected: controller.onMenuSelected,
              itemBuilder:
                  (BuildContext context) => const [
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
            const SizedBox(width: 12),
            Image.asset('res/images/logo_suzuki.png', height: 40),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Suzuki Finance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.bg1,
                  ),
                ),
                Text(
                  'Kredit Resmi Suzuki',
                  style: TextStyle(fontSize: 14, color: AppColors.bg1),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.bg1,
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('res/images/baleno.jpg', height: 150),
            ),
            Container(
              color: AppColors.bg1,
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 24,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildIconColumn(Icons.directions_car, 'Opsi Pembiayaan'),
                    _buildIconColumn(Icons.local_offer, 'Promo'),
                    _buildIconColumn(Icons.category, 'Produk'),
                    _buildIconColumn(Icons.location_on, 'Cabang'),
                    _buildIconColumn(Icons.calculate, 'Simulasi Kredit'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Katalog Produk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Image.asset('res/images/baleno.jpg', height: 150),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: Image.asset('res/images/baleno.jpg', height: 150),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button,
                        foregroundColor: AppColors.bg1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text('Order Kendaraan'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.bg1,
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 16.0),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.snack,
        selectedItemColor: AppColors.bg1,
        unselectedItemColor: AppColors.bg1,
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
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.bg1,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.iconDefault,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(child: Icon(icon, color: AppColors.snack, size: 28)),
        ),
        const SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }
}
