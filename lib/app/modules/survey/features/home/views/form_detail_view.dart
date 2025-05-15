import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/home/controllers/detail_controller.dart';

class SurveyFormDetailView extends GetView<SurveyFormDetailController> {
  const SurveyFormDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Form Detail'),
          bottom: TabBar(
            controller: controller.tabController,
            tabs:
                controller.tabs
                    .map((tab) => Tab(text: tab['name'].toString()))
                    .toList(),
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children:
              controller.tabs.map((tab) {
                return Center(child: Text('Content of ${tab['name']}'));
              }).toList(),
        ),
      );
    });
  }
}
