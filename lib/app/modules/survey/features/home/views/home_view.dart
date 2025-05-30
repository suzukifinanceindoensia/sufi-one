import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/home/controllers/home_controller.dart';
import 'package:sufi_one/app/modules/survey/features/home/widgets/home_search_widget.dart';
import 'package:sufi_one/app/modules/survey/models/menu_model.dart';
import 'package:sufi_one/app/modules/survey/survey_routes.dart';
import 'package:sufi_one/app/modules/survey/widgets/app_bar_widget.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_widget.dart';
import 'package:sufi_one/app/modules/survey/widgets/tab_bar_widget.dart';
import 'package:sufi_one/app/modules/survey/widgets/tile_widget.dart';

class SurveyHomeView extends GetView<SurveyHomeController> {
  const SurveyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SurveyAppBarWidget(
        menus: [
          SurveyMenuModel(
            title: "Reload",
            iconData: FontAwesomeIcons.arrowsRotate,
            onTap: controller.simulateLoadingProcess,
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F4F4),
      body: CircularLoaderWidget(
        controller: controller.loaderController,
        child: Column(
          children: [
            TabBarWidget.buildTabBar(controller.selectedTabIndex),
            SurveyHomeSearchBox(),
            SizedBox(height: 5),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await controller.refreshData();
                },
                child: Obx(() {
                  if (controller.tasks.isEmpty) {
                    return const Center(child: Text('No tasks available'));
                  }

                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.tasks.length,
                    itemBuilder: (context, taskIndex) {
                      final task = controller.tasks[taskIndex];
                      final submissionId = task.submissionId;
                      return SurveyTile(
                        task: task,
                        onTap: () {
                          Get.toNamed(
                            SurveyRoutes.surveyFormDetail,
                            arguments: {'submissionId': submissionId},
                          );
                        },
                      );
                    },
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
