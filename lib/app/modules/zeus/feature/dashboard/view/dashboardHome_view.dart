import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart'; // Assuming this is your AppBar with sidebar button
import 'package:sufi_one/app/modules/zeus/feature/dashboard/controller/zeusdashboard_controller.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeus_sidebar.dart'; // Your sidebar content
import 'package:sufi_one/app/modules/zeus/widgets/zeusmenucreate.dart'; // Your ZeusMenuCreate widget
import 'package:sufi_one/app/modules/zeus/widgets/zeusmenucreate2.dart';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart'; // Your GetX routes
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ZeusDashboardView extends GetView<ZeusDashboardController> {
  const ZeusDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for 12 menus - replace with your actual data source
    final List<Map<String, dynamic>> menuItems = [
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Request SKMBJ',
        'count': 5,
        'route': ZeusRoute.permohonansk
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Print SKMBJ',
        'count': 0,
        'route': ZeusRoute.cetakSkmbj
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 3 Long Title Example',
        'count': 12,
        'route': '/some_route_3'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 4',
        'count': 3,
        'route': '/some_route_4'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 5',
        'count': 7,
        'route': '/some_route_5'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 6',
        'count': 0,
        'route': '/some_route_6'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 7',
        'count': 2,
        'route': '/some_route_7'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 8',
        'count': 0,
        'route': '/some_route_8'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 9',
        'count': 9,
        'route': '/some_route_9'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 10',
        'count': 1,
        'route': '/some_route_10'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 11',
        'count': 4,
        'route': '/some_route_11'
      },
      {
        'image': "res/images/mobcol/tugasbaru.png",
        'title': 'Menu Item 12',
        'count': 6,
        'route': '/some_route_12'
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Welcome to Zeus!',
                        style: AppTextStyles.bigBody.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      TextButton(
                        onPressed: () {
                          controller.refreshDashboardData();
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // For the refresh button's column
                          children: [
                            const Icon(Icons.refresh, size: 35, color: Colors.blueAccent,),
                            Text('Refresh', style: AppTextStyles.medBodyBold.copyWith(color: Colors.blueAccent),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Quick access to your most important tasks.',
                    style: AppTextStyles.bigBody.copyWith(
                      fontSize: 16,
                      color: Colors.grey[700],
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
                  'Your Quick Links',
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
                    itemCount: item['count'],
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
            const SizedBox(height: 20), // Spacing at the bottom of the scroll view
          ],
        ),
      ),
    );
  }
}