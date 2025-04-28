import 'package:flutter/material.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:get/get.dart';

class AppSidebar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = AppColors.splashStart;

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
                child: ListView(
                  children: [
                    SidebarItem(
                      icon: const Icon(Icons.home),
                      title: 'Home',
                      onTap: () {
                        Get.toNamed(AppRoutes.homepageCust);
                      },
                    ),
                    SidebarItem(
                      icon: const Icon(Icons.person),
                      title: 'Mobile Collection',
                      onTap: () {
                        Get.toNamed(AppRoutes.mobileCollection);
                      },
                    ),
                    SidebarItem(
                      icon: const Icon(Icons.info),
                      title: 'Mobile Survey',
                      onTap: () {
                        Get.toNamed(AppRoutes.mobileSurvey);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final Widget? icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? titleColor;
  const SidebarItem({
    super.key,
    this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color:
            titleColor ?? Theme.of(context).textTheme.bodyLarge?.color);
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

