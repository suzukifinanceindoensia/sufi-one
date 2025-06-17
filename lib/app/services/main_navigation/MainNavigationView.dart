import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/homepage/views/homepage_cust_view.dart';
import 'package:sufi_one/app/modules/public/about/views/about_view.dart';
import 'package:sufi_one/app/modules/public/about/views/contact_view.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';
import 'package:sufi_one/app/services/main_navigation/profile_wrapper.dart';
import 'package:sufi_one/app/services/main_navigation/main_nav_controller.dart';

class MainNavigationView extends StatelessWidget {
  // Ambil instance dari MainNavigationController
  final MainNavigationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // Gunakan IndexedStack untuk menjaga state setiap tab
        body: IndexedStack(
          index: controller.selectedIndex.value, // Tab aktif
          children: const [
            HomepageCustView(), // Index 0
            AboutView(), // Index 1
            ContactView(), // Index 2
            ProfileWrapper(), // Index 3
          ],
        ),
        // Bottom Navigation Bar (custom dengan ConvexAppBar)
        bottomNavigationBar: BottomNavbar(
          selectedIndex: controller.selectedIndex.value,
          onItemTapped: controller.changeTabIndex, // Ganti tab saat ditekan
        ),
      ),
    );
  }
}
