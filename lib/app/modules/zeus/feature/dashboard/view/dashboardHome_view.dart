import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/zeus/feature/dashboard/controller/zeusdashboard_controller.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeus_sidebar.dart'; 
import 'package:sufi_one/app/modules/zeus/widgets/zeusmenucreate2.dart';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ZeusDashboardView extends GetView<ZeusDashboardController> {
  const ZeusDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // data for menu
    final List<Map<String, dynamic>> menuItems = [
      {
        'image': "res/images/zeus/fotonopol.png",
        'title': 'Foto Plat Nomor',
        'route': ZeusRoute.fotonopol
      },
      {
        'image': "res/images/zeus/ceknopol.png",
        'title': 'Cek Plat Nomor',
        'route': ZeusRoute.ceknopol
      },
      {
        'image': "res/images/zeus/taskassign.png",
        'title': 'Task Assign',
        'route': ZeusRoute.taskassign
      },
      {
        'image': "res/images/zeus/cetak.png",
        'title': 'Print STMBJ',
        'route': ZeusRoute.cetakStmbj
      },
      {
        'image': "res/images/zeus/cetak.png",
        'title': 'Print SKMBJ',
        'route': ZeusRoute.cetakSkmbj
      },
      {
        'image': "res/images/zeus/listanggota.png",
        'title': 'List Anggota',
        'route': ZeusRoute.listanggota
      },
      {
        'image': "res/images/zeus/permohonansk.png",
        'title': 'Permohonan SK',
        'route': ZeusRoute.permohonansk
      },
      {
        'image': "res/images/zeus/serahterimask.png",
        'title': 'Serah Terima SK',
        'route': ZeusRoute.serahterimask
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: const Drawer(
        child: ZeusSidebar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: AppColors.bg2,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Zeus!',
                        style: AppTextStyles.bigBody.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Good Morning, User',
                        style: AppTextStyles.bigBody.copyWith(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  TextButton(
                    onPressed: () {
                      controller.refreshDashboardData();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.refresh, size: 35, color: Colors.blueAccent,),
                        Text('Refresh', style: AppTextStyles.medBodyBold.copyWith(color: Colors.blueAccent),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Menu',
                  style: AppTextStyles.bigBody.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), 
              child: GridView.builder(
                shrinkWrap: true, // Important: makes GridView take only required space
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0, 
                  mainAxisSpacing: 10.0, 
                  childAspectRatio: 0.9, 
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return ZeusMenuCreate2(
                    image: item['image'],
                    menuTitle: item['title'],
                    onTap: () {
                      if (item['route'] != null) {
                        Get.toNamed(item['route']);
                      } else {
                        Get.snackbar(
                          'Error',
                          'Route not defined for ${item['title']}',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.withOpacity(0.8),
                          colorText: Colors.white,
                        );
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20), 
          ],
        ),
      ),
    );
  }
}