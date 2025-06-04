import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/modules/public/homepage/controllers/homepage_cust_controller.dart';
import 'package:sufi_one/app/modules/public/homepage/controllers/homepage_cust_controller.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';

class PromoView extends GetView<HomepageCustController> {
  const PromoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    final List<String> promoImages = [
      'res/images/suzuki_iklan1.jpg',
      'res/images/suzuki_iklan2.jpg',
      'res/images/suzuki_iklan3.jpg',
      'res/images/suzuki_iklan4.jpg',
      'res/images/suzuki_iklan3.jpg',
      'res/images/suzuki_iklan2.jpg',
    ];

    return Obx(() {
      final isLoggedIn = authController.user.value != null;

      return Scaffold(
        appBar: SuzukiFinanceAppBarWsidebar(),
        drawer: isLoggedIn ? Drawer(child: AppSidebar()) : null,
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: promoImages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: controller.openPromoWebsite,
                child: GestureDetector(
                  onTap: controller.openPromoWebsite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(promoImages[index]),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
