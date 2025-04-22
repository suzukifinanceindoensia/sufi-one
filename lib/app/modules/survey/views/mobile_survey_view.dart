import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/modules/survey/controllers/mobile_survey_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobileSurveyPage extends GetView<MobileSurveyController> {
  const MobileSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(30),
                color: AppColors.splashStart,
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f5f4c733-9aac-456e-b68e-5cf05486b6a4/ddqau7l-892cd3c2-21a3-48fa-8757-ddd2da769604.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2Y1ZjRjNzMzLTlhYWMtNDU2ZS1iNjhlLTVjZjA1NDg2YjZhNFwvZGRxYXU3bC04OTJjZDNjMi0yMWEzLTQ4ZmEtODc1Ny1kZGQyZGE3Njk2MDQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ca4z_NA9SHTdzn8TSMNddhAxkq8TN-Q-Rz-US0tjDZA"),
                      radius: 100,
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "JON SUZUKI",
                            style: AppTextStyles.bigBody,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "@jon.suzuki",
                            style: AppTextStyles.medBody,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Profesional Surveyor",
                            style: AppTextStyles.medBody,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
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
            ),
            SingleChildScrollView(
              child: Center(
                child: Obx(() => controller.pages[controller.selectedIndex.value]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}