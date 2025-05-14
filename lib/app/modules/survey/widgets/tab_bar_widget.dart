import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/survey_routes.dart';
import 'package:sufi_one/app/modules/survey/widgets/tab_menu_widget.dart';

class TabBarWidget {
  static Widget tabBar(RxInt selectedIndex) {
    final tabs = [
      {
        'icon': Icons.assignment,
        'label': 'New',
        'route': SurveyRoutes.surveyHome,
      },
      {
        'icon': Icons.playlist_add_check,
        'label': 'Process',
        'route': SurveyRoutes.surveyProcess,
      },
      {
        'icon': Icons.cloud_upload,
        'label': 'Upload',
        'route': SurveyRoutes.surveyUpload,
      },
      {
        'icon': Icons.check_circle,
        'label': 'Finish',
        'route': SurveyRoutes.surveyFinish,
      },
    ];

    return Obx(
      () => Container(
        color: Colors.white,
        child: Row(
          children: List.generate(tabs.length, (index) {
            return TabMenu(
              icon: tabs[index]['icon'] as IconData,
              label: tabs[index]['label'] as String,
              route: tabs[index]['route'] as String,
              isSelected: selectedIndex.value == index,
              onTap: () {
                selectedIndex.value = index;
                Get.offNamed(tabs[index]['route'] as String);
              },
            );
          }),
        ),
      ),
    );
  }
}
