import 'package:flutter/material.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Material(
        color: AppColors.splashStart,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: _sidebarItems.length,
                  separatorBuilder: (BuildContext context, int index) => const Divider(
                    color: Colors.white60,
                    thickness: 0.8,
                  ),
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
    icon: const Icon(Icons.home, color: Colors.white),
    title: 'Home',
    onTap: () {
      Get.toNamed(AppRoutes.homepageCust);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.person, color: Colors.white),
    title: 'Mobile Collection',
    onTap: () {
      Get.toNamed(AppRoutes.mobileCollection);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.info, color: Colors.white),
    title: 'Mobile Survey',
    onTap: () {
      Get.toNamed(AppRoutes.survey);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.abc, color: Colors.white),
    title: 'Zeus',
    onTap: () {
      Get.toNamed(AppRoutes.zeus);
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
