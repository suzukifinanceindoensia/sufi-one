import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/controllers/zeus_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ZeusView extends StatelessWidget {
  const ZeusView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ZeusController());

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: AppBar(
        backgroundColor: AppColors.snack,
        centerTitle: false,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('res/images/logo_suzuki.png', height: 40),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Suzuki Finance',
                  style: AppTextStyles.bigBody.copyWith(
                    color: AppColors.bg1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Kredit Resmi Suzuki',
                  style: AppTextStyles.medBody.copyWith(color: AppColors.bg1),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.bg1,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.bg3,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Zeus',
                    style: AppTextStyles.bigBody.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.bg3),
                    ),
                    child:
                        controller.imagePath.value.isEmpty
                            ? Center(
                              child: Text(
                                'Belum ada gambar',
                                style: AppTextStyles.medBody,
                              ),
                            )
                            : Image.asset(
                              controller.imagePath.value,
                              fit: BoxFit.cover,
                            ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: controller.scanPlatNomor,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button,
                      foregroundColor: AppColors.bg1,
                    ),
                    child: Text(
                      'Scan Plat Nomor',
                      style: AppTextStyles.medBody.copyWith(
                        color: AppColors.bg1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (controller.nomorPolisi.value.isNotEmpty) ...[
                    buildInfoRow('Nomor Polisi', controller.nomorPolisi.value),
                    buildInfoRow('Status', controller.status.value),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('SKMBJ', style: AppTextStyles.medBody),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.bg1,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.bg2),
                                  ),
                                  child: Text(
                                    '${controller.skmbj.value}.pdf',
                                    style: AppTextStyles.medBody,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: controller.shareOptions,
                            color: AppColors.iconDefault,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                        ),
                        onPressed: () => Get.toNamed(AppRoutes.zeusDetail),
                        child: Text(
                          'Detail',
                          style: AppTextStyles.smallBody.copyWith(
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          }
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.snack,
        selectedItemColor: AppColors.bg1,
        unselectedItemColor: AppColors.bg1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_device_information),
            label: 'About',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.medBody),
          Text(
            value,
            style: AppTextStyles.medBody.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
