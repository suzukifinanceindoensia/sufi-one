import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/zeus/feature/cetak_stmbj/controllers/cetak_stmbj_controller.dart';

class CetakStmbjView extends GetView<CetakStmbjController> {
  CetakStmbjView({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pilih Cabang", style: AppTextStyles.medBody),
                const SizedBox(height: 8),
                Obx(
                  () => Theme(
                    data: Theme.of(
                      context,
                    ).copyWith(canvasColor: AppColors.navBackground),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value:
                          controller.selectedCabang.value == ''
                              ? null
                              : controller.selectedCabang.value,
                      hint: const Text("All-Branch"),
                      items:
                          controller.listCabang
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                      onChanged: (val) {
                        controller.selectedCabang.value = val ?? '';
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (val) => controller.nomorKontrak.value = val,
                        decoration: const InputDecoration(
                          labelText: 'Nomor Kontrak',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (val) => controller.nomorPolisi.value = val,
                        decoration: const InputDecoration(
                          labelText: 'Nomor Polisi',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed:
                          controller.isLoading.value
                              ? null
                              : () async {
                                await controller.searchData();
                              },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child:
                          controller.isLoading.value
                              ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                              : Text(
                                "SEARCH",
                                style: TextStyle(color: AppColors.bg1),
                              ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.dataStmbj.isEmpty && !controller.isLoading.value) {
                return const Center(child: Text('Data tidak ditemukan'));
              }
              return RefreshIndicator(
                color: AppColors.bg1,
                backgroundColor: AppColors.button,
                onRefresh: controller.searchData,
                child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.dataStmbj.length,
                  itemBuilder: (_, index) {
                    final item = controller.dataStmbj[index];
                    return Card(
                      color: AppColors.navBackground,
                      child: ListTile(
                        leading: const Icon(Icons.insert_drive_file),
                        title: Text(item.kontrak),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nopol : ${item.nopol}"),
                            Text(item.cabang),
                            Text(item.kode),
                            Text("Tanggal : ${item.tanggal.toString()}"),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (_) => AlertDialog(
                                    backgroundColor: AppColors.bg1,
                                    title: Text(
                                      'Konfirmasi',
                                      style: AppTextStyles.medBodyBold,
                                    ),
                                    content: Text(
                                      'Ingin submit data ini?',
                                      style: AppTextStyles.bigBody,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                          Get.snackbar(
                                            'Berhasil',
                                            'Submit berhasil!',
                                            backgroundColor: Colors.green,
                                            colorText: AppColors.bg1,
                                          );
                                        },
                                        child: Text(
                                          'Submit',
                                          style: AppTextStyles.buttonFont
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () => Get.back(),
                                        child: Text(
                                          'Cancel',
                                          style: AppTextStyles.buttonFont
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
