import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';

class ZeusSidebar extends StatelessWidget {
  const ZeusSidebar({super.key});

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
                  separatorBuilder:
                      (BuildContext context, int index) =>
                          const Divider(color: Colors.white60, thickness: 2),
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
    title: 'Dashboard',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.camera_alt, color: Colors.white),
    title: 'Foto Plat Nomor',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
      Get.toNamed(ZeusRoute.fotonopol);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.dataset_rounded, color: Colors.white),
    title: 'Cek Plat Nomor',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
      Get.toNamed(ZeusRoute.ceknopol);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.add_task_rounded, color: Colors.white),
    title: 'Task Assign',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
      Get.toNamed(ZeusRoute.taskassign);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.description, color: Colors.white),
    title: 'cetak skmbj',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
      Get.toNamed(ZeusRoute.cetakSkmbj);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.description, color: Colors.white),
    title: 'cetak stmbj',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
      Get.toNamed(ZeusRoute.cetakStmbj);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.groups, color: Colors.white),
    title: 'List Anggota & Registrasi',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
      Get.toNamed(ZeusRoute.listanggota);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.assignment, color: Colors.white),
    title: 'Permohonan SK',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
      Get.toNamed(ZeusRoute.permohonansk);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.assignment, color: Colors.white),
    title: 'Serah terima SK',
    onTap: () {
      Get.offAndToNamed(ZeusRoute.zeusdashboard);
      Get.toNamed(ZeusRoute.serahterimask);
    },
  ),
  SidebarItemData(
    icon: const Icon(Icons.home_work, color: Colors.white),
    title: 'homepage',
    onTap: () {
      Get.offAllNamed(HomeRoutes.homepageCust);
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
