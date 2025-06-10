import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/widgets/zeus_sidebar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/zeus/feature/serah-terimaSK/controllers/serahterimask_controller.dart';

class SerahterimaskView extends GetView<serahterimaskController> {
  const SerahterimaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: const Drawer(child: ZeusSidebar()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.assignment, size: 150, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Tidak ada Task !',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                width: double.infinity,
                child: Obx(() {
                  return ElevatedButton(
                    onPressed:
                        controller.isLoading.value
                            ? null
                            : () async {
                              await controller.fetchAgents();
                            },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 11),
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
                              'REFRESH',
                              style: TextStyle(
                                color: AppColors.bg1,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
