import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_uploadbukti_view.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobcolUploadBuktiView extends GetView<MobcolUploadBuktiController> {
  const MobcolUploadBuktiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: const Drawer(
        child: AppSidebar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.searchController,
              decoration: const InputDecoration(
                labelText: 'Search Name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.filtereduploadbukti.length,
                  itemBuilder: (context, index) {
                    final tugas = controller.filtereduploadbukti[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.mobileCollectionUploadBuktiDetail, arguments: tugas);
                        },
                        child: MobcolContainer(
                          children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("${tugas['name']}", style: AppTextStyles.Navybodymed),
                                        Expanded(child: SizedBox()),
                                        Text("${tugas['Progress']}", style: AppTextStyles.Navybodymed),
                                      ],
                                    ),
                                    Text('${tugas['id']}', style: AppTextStyles.medBody),
                                    Text('Tanggal Go live ${tugas['dateTime'].day}-${tugas['dateTime'].month}-${tugas['dateTime'].year}', style: AppTextStyles.medBody),
                                    Text('Email : ${tugas['email']}', style: AppTextStyles.medBody),
                                    SizedBox(
                                      width: 240,
                                      child: Row(
                                        children: [
                                          Text("kel. ${tugas['kelurahan']}", style: AppTextStyles.medBody),
                                          Expanded(child: SizedBox()),
                                          Text("kec. ${tugas['kecamatan']}", style: AppTextStyles.medBody),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                          ]
                        )
                      ),
                    );
                  },
                )), 
          ),
        ],
      ),
    );
  }
}
