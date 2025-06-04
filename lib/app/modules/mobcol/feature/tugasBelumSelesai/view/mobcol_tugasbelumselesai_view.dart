import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBelumSelesai/controller/mobcol_tugasbelumselesai_controller.dart';
import 'package:sufi_one/app/modules/mobcol/mobcol_routes.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_showtask.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_sidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBelumSelesai_model.dart'; // Pastikan import model ini ada

class MobcolTugasbelumselesaiView extends GetView<MobcolTugasbelumselesaiController> {
  const MobcolTugasbelumselesaiView({super.key});

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
          ),Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.filteredTugasBelumSelesai.length,
              itemBuilder: (context, index) {
                final TugasBelumSelesaiModel tugas = controller.filteredTugasBelumSelesai[index];
                final DateTime? taskDateTime = tugas.dateTime;
                final DateTime now = DateTime.now();
                final Duration? difference = taskDateTime?.difference(now);
                final int differenceInDays = difference?.inDays ?? 0; // Handle null difference

                String priorityText = '';
                Color priorityColor = Colors.black;

                if (differenceInDays < 10) {
                  priorityText = 'Low';
                  priorityColor = Colors.green;
                } else if (differenceInDays >= 10 && differenceInDays <= 30) {
                  priorityText = 'Mid Prio';
                  priorityColor = Colors.yellow[700]!;
                } else {
                  priorityText = 'Hi Prio';
                  priorityColor = Colors.red;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(MobcolRoutes.mobileCollectionTugasBelumSelesaiDetail, arguments: tugas);
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
                                  Text("${controller.monthsInYear[tugas.dateTime?.month]}", style: AppTextStyles.medBody,),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 240,
                                    child: Row(
                                      children: [
                                        Text("${tugas.name}", style: AppTextStyles.medBody),
                                        const Expanded(child: SizedBox()),
                                        Text(
                                          priorityText,
                                          style: AppTextStyles.medBody.copyWith(color: priorityColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text('id: ${tugas.id}', style: AppTextStyles.medBody),
                                  Text('Rp. ${tugas.money}', style: AppTextStyles.medBody),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text("kel. ${tugas.kelurahan}",
                                          style: AppTextStyles.medBody,
                                          softWrap: true,
                                          textAlign: TextAlign.left,),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text("kec. ${tugas.kecamatan}",
                                          style: AppTextStyles.medBody,
                                          softWrap: true,
                                          textAlign: TextAlign.right,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]
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