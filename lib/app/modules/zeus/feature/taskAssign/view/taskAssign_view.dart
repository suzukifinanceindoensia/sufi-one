import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/zeus/feature/taskAssign/controller/taskAssign_controller.dart';
import 'package:sufi_one/app/modules/zeus/widgets/taskAssignpopup.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class TaskAssignView extends GetView<TaskAssignController> {
  const TaskAssignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by Plat Nomor or Tipe Mobil...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              ),
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.errorMessage.isNotEmpty) {
                return Center(
                  child: Text(
                    'Error: ${controller.errorMessage.value}',
                    style: AppTextStyles.bigBody.copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (controller.allTasks.isEmpty && controller.searchQuery.isNotEmpty) {
                return Center(
                  child: Text(
                    'No matching tasks found for "${controller.searchQuery.value}".',
                    style: AppTextStyles.bigBody,
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (controller.allTasks.isEmpty) {
                return Center(
                  child: Text(
                    'No tasks found.',
                    style: AppTextStyles.bigBody,
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.allTasks.length,
                  itemBuilder: (context, index) {
                    final task = controller.allTasks[index];
                    return GestureDetector(
                      onTap: () {
                        Get.dialog(
                          TaskAssignDetailPopup(taskDetail: task),
                          barrierDismissible: true,
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Plat Nomor: ${task.platNomor}',
                                style: AppTextStyles.bigBody.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Divider(height: 16, thickness: 1),
                              Text('Tipe Mobil: ${task.tipeMobil}', style: AppTextStyles.bigBody),
                              Text('Status: ${task.status}', style: AppTextStyles.bigBody),
                              Text('SKMBJ: ${task.skmbj}', style: AppTextStyles.bigBody),
                              Text('No SKMBJ: ${task.noSkmbj}', style: AppTextStyles.bigBody),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
