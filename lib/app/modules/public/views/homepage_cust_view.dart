import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/homepage_cust_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';

class HomepageCustView extends GetView<HomepageCustController> {
  const HomepageCustView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: 240,
                    child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.onPageChanged,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final images = [
                          'res/images/suzuki_iklan1.jpg',
                          'res/images/suzuki_iklan2.jpg',
                          'res/images/suzuki_iklan3.jpg',
                          'res/images/suzuki_iklan4.jpg',
                        ];
                        return Image.asset(
                          images[index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              controller.currentPage.value == index
                                  ? AppColors.snack
                                  : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.bg1,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(bottom: 0.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 3.0,
                mainAxisSpacing: 3.0,
                children: [
                  _buildIconColumn(Icons.directions_car, 'Opsi Pembayaran'),
                  _buildIconColumn(Icons.local_offer, 'Promo'),
                  _buildIconColumn(Icons.category, 'Produk'),
                  _buildIconColumn(Icons.location_on, 'Cabang'),
                  _buildIconColumn(Icons.calculate, 'Simulasi Kredit'),
                  _buildIconColumn(Icons.assignment, 'Fasilitas'),
                ],
              ),
            ),
            Container(
              color: AppColors.bg1,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(top: 4.0),
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
                    child: Image.asset(
                      'res/images/suzuki_iklan5.jpg',
                      height: 150,
                      width: 270,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.snack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Order Sekarang',
                        style: TextStyle(color: AppColors.bg1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.bg1,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(top: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'res/images/suzuki_iklan6.jpg',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 0),
    );
  }

  Column _buildIconColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.bg1,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(10.0),
          child: Icon(icon, color: AppColors.snack, size: 24),
        ),
        SizedBox(height: 6.0),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyles.smallBody,
        ),
      ],
    );
  }
}
