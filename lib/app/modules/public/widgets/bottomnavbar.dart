import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex; // Index aktif sekarang

  const BottomNavbar({Key? key, required this.selectedIndex}) : super(key: key);

  void _onItemTapped(int index) {
    if (index == selectedIndex) return;

    switch (index) {
      case 0:
        Get.offAllNamed(HomeRoutes.homepageCust); // Home Page
        break;
      case 1:
        Get.offAllNamed(HomeRoutes.about); // About Page
        break;
      case 2:
        Get.offAllNamed(HomeRoutes.contact); // contact Page
        break;
      case 3:
        Get.offAllNamed(HomeRoutes.profilePage); // Profile Page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.snack,
      selectedItemColor: AppColors.bg2,
      unselectedItemColor: AppColors.bg1,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_device_information),
          label: 'About',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Support'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
