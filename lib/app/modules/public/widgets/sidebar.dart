import 'package:flutter/material.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class AppSidebar extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = AppColors.splashStart;
    final List<bool> hasCredentials = [
      true,  // Home
      false, // Mobile Collection
      false, // Mobile Survey
      false, // Zeus
    ];
    final List<_SidebarItemData> filteredSidebarItems = _sidebarItems.where((item) {
      //  Always show Home.
      if (item.title == 'Home') return hasCredentials[0];
      //  Show "Mobile Collection" only if the user has credentials.
      if (item.title == 'Mobile Collection') return hasCredentials[1];
      if (item.title == 'Mobile Survey') return hasCredentials[2];
      if (item.title == 'Zeus') return hasCredentials[3];
      return false; // Don't show other items if the condition is not met.
    }).toList();

    return SizedBox(
      width: 200,
      child: Material(
        color: effectiveBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated( // Use ListView.separated
                  separatorBuilder: (context, index) => const Divider(  // Add a Divider
                    color: AppColors.bg1,
                    height: 1.0,       // Customize the height
                  ),
                  itemCount: filteredSidebarItems.length, // Use the filtered list
                  itemBuilder: (context, index) {
                    final item = filteredSidebarItems[index]; // Get item from filtered list
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

  // Define the list of items
  final List<_SidebarItemData> _sidebarItems = [
    _SidebarItemData(
      icon: const Icon(Icons.home, color: AppColors.bg1),
      title: 'Home',
      onTap: () {
        Get.toNamed(AppRoutes.homepageCust);
      },
    ),
    _SidebarItemData(
      icon: const Icon(Icons.person, color: AppColors.bg1),
      title: 'Mobile Collection',
      onTap: () {
        Get.toNamed(AppRoutes.mobileCollection);
      },
    ),
    _SidebarItemData(
      icon: const Icon(Icons.info, color: AppColors.bg1),
      title: 'Mobile Survey',
      onTap: () {
        Get.toNamed(AppRoutes.mobileSurvey);
      },
    ),
     _SidebarItemData(
      icon: const Icon(Icons.settings, color: AppColors.bg1),
      title: 'Zeus',
      onTap: () {
        Get.toNamed(AppRoutes.zeus);
      },
    ),
  ];
}

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
    final textStyle = AppTextStyles.appBar;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 12.0),
            ],
            Expanded(
              child: Text(
                title,
                style: textStyle,
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 12.0),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

class _SidebarItemData {
  final Widget? icon;
  final String title;
  final VoidCallback? onTap;

  _SidebarItemData({this.icon, required this.title, this.onTap});
}

