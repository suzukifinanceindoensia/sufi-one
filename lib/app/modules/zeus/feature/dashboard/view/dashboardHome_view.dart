import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/zeus/feature/dashboard/controller/zeusdashboard_controller.dart';
import 'package:sufi_one/app/modules/zeus/widgets/profile_zeus.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeus_sidebar.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeusmenucreate.dart';
import 'package:sufi_one/app/modules/zeus/zeus_route.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

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
          ProfileCardZeus(
            image: "res/images/mobcol/blankprofile.jpg",
            name: "John Doe",
            username: "john.doe",
            profession: "Software Engineer",
            borders: 0,
          ),
          SizedBox(height: 20,),
          ZeusMenuCreate(
            image: "res/images/mobcol/tugasbaru.png", 
            menuTitle: 'Request SKMBJ', 
            itemCount: 0, 
            onTap: () {Get.offNamed(ZeusRoute.taskassign);}
          ),
          SizedBox(height: 10,),
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
