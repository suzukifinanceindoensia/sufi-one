import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_tugasselesai_controller.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobcolTugasSelesaiView extends GetView<MobcolTugasSelesaiController> {
  const MobcolTugasSelesaiView({super.key});

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
                  itemCount: controller.filteredtugasselesai.length,
                  itemBuilder: (context, index) {
                    final tugas = controller.filteredtugasselesai[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.mobileCollectionTugasSelesaiDetail, arguments: tugas);
                        },
                        child: MobcolContainer(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 75,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${tugas['dateTime'].day}", style: AppTextStyles.MobcolNum),
                                      Text("${controller.monthsInYear[tugas['dateTime'].month]}", style: AppTextStyles.medBody,),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${tugas['name']}", style: AppTextStyles.medBody),
                                    Text('id: ${tugas['id']}', style: AppTextStyles.medBody),
                                    Text('Rp. ${tugas['money']}', style: AppTextStyles.medBody),
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
                                Expanded(child: SizedBox())
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
