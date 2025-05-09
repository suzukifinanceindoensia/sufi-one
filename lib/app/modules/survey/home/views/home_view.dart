import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/home/controllers/home_controller.dart';
import 'package:sufi_one/app/modules/survey/models/menu_model.dart';
import 'package:sufi_one/app/modules/survey/widgets/appBar_widget.dart';

class SurveyHomeView extends GetView<SurveyHomeController> {
  const SurveyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyHomeController>(
      init:
          SurveyHomeController(), // Temporary for direct injection (we'll move this to bindings)
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: SurveyAppBar(
            menus: [
              SurveyMenuModel(
                title: "Refresh",
                iconData: FontAwesomeIcons.arrowsRotate,
                onTap: controller.refreshData,
              ),
            ],
          ),
          backgroundColor: const Color(0xFFF5F4F4),
        );
      },
    );
  }
}
