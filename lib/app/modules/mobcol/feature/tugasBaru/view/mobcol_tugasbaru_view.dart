import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/controller/mobcol_tugasbaru_controller.dart';
import 'package:sufi_one/app/modules/mobcol/mobcol_routes.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_showtask.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_sidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:intl/intl.dart';

class MobcolTugasbaruView extends GetView<MobcolTugasbaruController> {
  const MobcolTugasbaruView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: const Drawer(
        child: MobcolSidebar(),
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
                  itemCount: controller.filteredtugasbaru.length,
                  itemBuilder: (context, index) {
                    final tugas = controller.filteredtugasbaru[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(MobcolRoutes.mobileCollectionTugasBaruDetail, arguments: tugas);
                        },
                        child: Mobcol_showtask(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 75,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${tugas.dateTime?.day}", style: AppTextStyles.MobcolNum),
                                      Text(
                                        "${controller.monthsInYear[tugas.dateTime?.month]}",
                                        style: AppTextStyles.medBody,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${tugas.name}", style: AppTextStyles.medBody),
                                      Text('id: ${tugas.id}', style: AppTextStyles.medBody),
                                      Text('Rp. ${NumberFormat('#,###', 'id_ID').format(tugas.money)}', style: AppTextStyles.medBody),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "kel. ${tugas.kelurahan}",
                                              style: AppTextStyles.medBody,
                                              softWrap: true,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "kec. ${tugas.kecamatan}",
                                              style: AppTextStyles.medBody,
                                              softWrap: true,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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