import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/zeus/controllers/zeus_controller.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class ZeusDetailView extends StatelessWidget {
  const ZeusDetailView({super.key});

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
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.bg1),
              onPressed: () => Get.back(),
            ),
            Image.asset('res/images/logo_suzuki.png', height: 36),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SUZUKI FINANCE',
                  style: AppTextStyles.medBody.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.bg1,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'KREDIT RESMI SUZUKI',
                  style: AppTextStyles.smallBody.copyWith(
                    color: AppColors.bg1,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () => controller.showDelayNotification(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bg1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Obx(
              () => Column(
                children:
                    controller.detailData.entries
                        .map((entry) => buildField(entry.key, entry.value))
                        .toList(),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.snack,
        selectedItemColor: AppColors.bg1,
        unselectedItemColor: AppColors.bg1,
        selectedLabelStyle: AppTextStyles.smallBodyBold,
        unselectedLabelStyle: AppTextStyles.smallBody,
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

  Widget buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label :', style: AppTextStyles.smallBodyBold),
          const SizedBox(height: 4),
          TextField(
            readOnly: true,
            controller: TextEditingController(text: value),
            style: AppTextStyles.medBody,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.bg1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
