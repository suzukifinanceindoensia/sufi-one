import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_tugasbelumselesai_controller.dart';
import 'package:sufi_one/app/modules/mobcol/widgets/mobcol_container.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobcolTugasbelumselesaiView extends GetView<MobcolTugasbelumselesaiController> {
  const MobcolTugasbelumselesaiView({super.key});

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
          ),Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.filteredtugasbelumselesai.length,
                itemBuilder: (context, index) {
                  final tugas = controller.filteredtugasbelumselesai[index];
                  final DateTime taskDateTime = tugas['dateTime'] as DateTime;
                  final DateTime now = DateTime.now();
                  final Duration difference = taskDateTime.difference(now);
                  final int differenceInDays = difference.inDays;

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
                        Get.toNamed(AppRoutes.mobileCollectionTugasBelumSelesaiDetail, arguments: tugas);
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
                                  SizedBox(
                                    width: 240,
                                    child: Row(
                                      children: [
                                        Text("${tugas['name']}", style: AppTextStyles.medBody),
                                        const Expanded(child: SizedBox()),
                                        Text(
                                          priorityText,
                                          style: AppTextStyles.medBody.copyWith(color: priorityColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text('id: ${tugas['id']}', style: AppTextStyles.medBody),
                                  Text('Rp. ${tugas['money']}', style: AppTextStyles.medBody),
                                  SizedBox(
                                    width: 240,
                                    child: Row(
                                      children: [
                                        Text("kel. ${tugas['kelurahan']}", style: AppTextStyles.medBody),
                                        const Expanded(child: SizedBox()),
                                        Text("kec. ${tugas['kecamatan']}", style: AppTextStyles.medBody),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox())
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
