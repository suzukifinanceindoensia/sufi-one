import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/modules/survey/widgets/profile_card_survey.dart';
import 'package:sufi_one/app/modules/survey/controllers/mobile_survey_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class MobileSurveyPage extends GetView<MobileSurveyController> {
  const MobileSurveyPage({super.key});

  Widget _buildTabButtons() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: controller.buttonLabels.asMap().entries.map((entry) {
          final int index = entry.key;
          final String label = entry.value;
          final bool isActive = controller.selectedIndex.value == index;

          return GestureDetector(
            onTap: () {
              controller.changeTabIndex(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey[800],
                  ),
                ),
                if (isActive)
                  Container(
                    height: 2,
                    width: label.length * 8.0,
                    color: AppColors.snack,
                    margin: const EdgeInsets.only(top: 2),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(
        child: AppSidebar(),
      ), 
      body: Stack(
        children: [
          const ProfileCard(),
          Positioned(
            top: 160, // Adjust based on ProfileCard height
            left: 0,
            right: 0,
            child: _buildTabButtons(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 190, 10, 10), // Adjust top padding
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Obx(() => controller.pages[controller.selectedIndex.value]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}