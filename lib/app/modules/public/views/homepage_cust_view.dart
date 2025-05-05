import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/homepage_cust_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

class HomepageCustView extends StatefulWidget {
  const HomepageCustView({Key? key}) : super(key: key);

  @override
  State<HomepageCustView> createState() => _HomepageCustViewState();
}

class _HomepageCustViewState extends State<HomepageCustView> {
  final HomepageCustController controller = Get.find<HomepageCustController>();
  final PageController _newsPageController = PageController(
    viewportFraction: 0.7,
  );

  final List<String> bannerImages = [
    'res/images/suzuki_iklan1.jpg',
    'res/images/suzuki_iklan2.jpg',
    'res/images/suzuki_iklan3.jpg',
    'res/images/suzuki_iklan4.jpg',
  ];

  final List<String> newsImages = [
    'res/images/suzuki_iklan1.jpg',
    'res/images/suzuki_iklan4.jpg',
    'res/images/suzuki_iklan2.jpg',
    'res/images/suzuki_iklan5.jpg',
    'res/images/suzuki_iklan3.jpg',
  ];

  @override
  void dispose() {
    _newsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBanner(),
            _buildMenuGrid(),
            _OrderSection(),
            _NewsCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 0),
    );
  }

  Widget _buildBanner() {
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: bannerImages.length,
              itemBuilder:
                  (context, index) => Image.asset(
                    bannerImages[index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              bannerImages.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
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
    );
  }

  Widget _buildMenuGrid() {
    final List<Map<String, String>> menuItems = [
      {'icon': 'res/images/ic_icon_wop.png', 'label': 'Promo'},
      {'icon': 'res/images/ic_icon_product.png', 'label': 'Produk'},
      {
        'icon': 'res/images/ic_icon_credit_simulation.png',
        'label': 'Simulasi Kredit',
      },
      {'icon': 'res/images/ic_icon_promo.png', 'label': 'Fasilitas'},
      {'icon': 'res/images/ic_icon_branch.png', 'label': 'Cabang'},
      {
        'icon': 'res/images/ic_icon_installment_status.png',
        'label': 'Opsi Pembayaran & Asuransi',
      },
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fitur',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12.0),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            children:
                menuItems.map((item) {
                  return InkWell(
                    onTap: () {
                      if (item['label'] == 'Promo') {
                        Get.toNamed(AppRoutes.promo);
                      }
                      // tambahkan else if lain jika butuh navigasi ke fitur lain
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 54,
                            height: 54,
                            child: Image.asset(item['icon']!),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          item['label']!,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.smallBody,
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _OrderSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Ayo, Order Kendaraan Suzuki',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Handle apply press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.button,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text('Apply', style: TextStyle(color: AppColors.bg1)),
          ),
        ],
      ),
    );
  }

  Widget _NewsCarousel() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Berita Terbaru',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12.0),
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _newsPageController,
              itemCount: newsImages.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.asset(newsImages[index], fit: BoxFit.fill),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
