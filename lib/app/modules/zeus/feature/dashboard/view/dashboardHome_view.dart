import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/modules/zeus/feature/dashboard/controller/zeusdashboard_controller.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeus_sidebar.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeusmenucreate.dart';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ZeusDashboardView extends GetView<ZeusDashboardController> {
  const ZeusDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1, 
      appBar: SuzukiFinanceAppBarWsidebar(), 
      drawer: const Drawer(
        child: ZeusSidebar(), 
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,), 
          Container(
            padding: const EdgeInsets.all(20), 
            margin: const EdgeInsets.symmetric(horizontal: 15.0), 
            height: 120,
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
                    const Expanded(child: SizedBox(),), 
                    TextButton(
                        onPressed: () {
                          controller.refreshDashboardData();                         
                        },
                        child: Column(
                          children: [
                            const Icon(Icons.refresh, size: 35,),
                            Text('Refresh', style: AppTextStyles.medBodyBold,),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ZeusMenuCreate(
            image: "res/images/mobcol/tugasbaru.png", 
            menuTitle: 'Request SKMBJ', 
            itemCount: 0, 
            onTap: () {Get.offNamed(ZeusRoute.taskassign);}
          ),
          const SizedBox(height: 10,),
          ZeusMenuCreate(
            image: "res/images/mobcol/tugasbaru.png", 
            menuTitle: 'Print SKMBJ', 
            itemCount: 0, 
            onTap: () {Get.offNamed('/zeus/print skmbj');}
          ),
        ],
      ),
    );
  }
}
