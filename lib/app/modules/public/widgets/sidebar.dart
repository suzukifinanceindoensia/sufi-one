import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/locationTest/location_routes.dart';
import 'package:sufi_one/app/modules/mobcol/mobcol_routes.dart';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/services/checking_installed_app.dart';
import 'package:sufi_one/app/services/main_navigation/main_nav_controller.dart';
import 'package:sufi_one/app/services/main_navigation/MainNavigationView.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Material(
        color: AppColors.navIcon,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: _sidebarItems.length,
                  separatorBuilder:
                      (BuildContext context, int index) =>
                          const Divider(color: AppColors.bg1, thickness: 2),
                  itemBuilder: (BuildContext context, int index) {
                    final item = _sidebarItems[index];
                    return SidebarItem(
                      icon: item.icon,
                      title: item.title,
                      onTap: item.onTap,
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

class SidebarItemData {
  final Widget? icon;
  final String title;
  final VoidCallback? onTap;

  SidebarItemData({this.icon, required this.title, this.onTap});
}

final List<SidebarItemData> _sidebarItems = [
  SidebarItemData(
    icon: const Icon(Icons.home, color: AppColors.bg1),
    title: 'Home',
    onTap: () {
      // CheckingInstalledAppService().checkInstalledApps(); // Scan aplikasi
      final navController = Get.find<MainNavigationController>();
      navController.changeTabIndex(0); // Pastikan kembali ke tab Home
      Get.offAll(() => MainNavigationView());
      // Reset stack & kembali ke MainNavigationView // mengubah hompage menjadi main_navigation agar tidak rebuild ulang
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.person, color: AppColors.bg1),
    title: 'Mobile Collection',
    onTap: () {
      CheckingInstalledAppService().checkInstalledApps(); // Scan aplikasi
      Get.toNamed(MobcolRoutes.mobileCollection);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.info, color: AppColors.bg1),
    title: 'Mobile Survey',
    onTap: () {
      CheckingInstalledAppService().checkInstalledApps(); // Scan aplikasi
      Get.toNamed(AppRoutes.survey);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.abc, color: AppColors.bg1),
    title: 'Zeus',
    onTap: () {
      CheckingInstalledAppService().checkInstalledApps(); // Scan aplikasi
      Get.toNamed(ZeusRoute.zeusdashboard);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.location_on, color: AppColors.bg1),
    title: 'Track Location',
    onTap: () {
      Get.toNamed(LocationRoutes.trackLocation);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.home_work, color: AppColors.bg1),
    title: 'login/register page',
    onTap: () {
      Get.toNamed('/public/home');
    },
  ),
];

class SidebarItem extends StatelessWidget {
  final Widget? icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  const SidebarItem({
    super.key,
    this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.sidebar;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 12.0)],
            Expanded(child: Text(title, style: textStyle)),
            if (trailing != null) ...[const SizedBox(width: 12.0), trailing!],
          ],
        ),
      ),
    );
  }
}
