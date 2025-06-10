import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeus_sidebar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/zeus/feature/anggota&registrasi/controllers/registrasi_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  void _showCameraConfirmation(RegistrasiController controller) {
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Buka kamera untuk foto E-KTP?",
      textConfirm: "Ya",
      textCancel: "Cancel",
      onConfirm: () async {
        Get.back(); // Tutup dialog
        await controller.pickImageFromCamera();
      },
      onCancel: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final RegistrasiController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: const Drawer(child: ZeusSidebar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'SFI Scan E-KTP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.iconDefault,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pilih foto untuk melakukan konversi\nPastikan foto terlihat dengan jelas dan benar',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Foto hasil kamera
                Obx(() {
                  final file = controller.imageFile.value;
                  final isExist = file != null && file.existsSync();
                  return isExist
                      ? Image.file(file!, height: 350, fit: BoxFit.contain)
                      : Image.asset(
                        'res/images/zeus/ktp_placeholder.png',
                        height: 300,
                        fit: BoxFit.contain,
                      );
                }),
                const SizedBox(height: 32),
                const SizedBox(height: 32),

                // Tombol START atau Submit/Cancel
                Obx(() {
                  if (controller.imageFile.value == null) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            controller.isLoading.value
                                ? null
                                : () => _showCameraConfirmation(controller),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.button,
                          padding: const EdgeInsets.symmetric(vertical: 14),
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
                                : const Text(
                                  'START',
                                  style: TextStyle(
                                    color: AppColors.bg1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                      ),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.submitPhoto,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Submit"),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.cancelPhoto,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Cancel"),
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
