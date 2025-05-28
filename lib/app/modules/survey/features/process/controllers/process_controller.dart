// lib/app/modules/survey/home/controllers/survey_home_controller.dart
import 'dart:async';

import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/models/application_model.dart';
import 'package:sufi_one/app/modules/survey/services/tasklist_service.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_controller.dart';

class SurveyProcessController extends GetxController {
  RxInt selectedTabIndex = 1.obs;
  final CircularLoaderController loaderController = CircularLoaderController();
  final RxList<SurveyApplicationModel> tasks = <SurveyApplicationModel>[].obs;
  // For now it's empty — just to confirm binding works
  void refreshData() {
    print("Refreshing data...");
    simulateLoadingProcess();
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize the loader controller
    simulateLoadingProcess();
  }

  Future<void> simulateLoadingProcess() async {
    loaderController.startLoading(message: "Loading data...");

    await Future.delayed(Duration(seconds: 1)); // simulate delay

    try {
      await loadNewTasks(); // ✅ properly awaited

      loaderController.stopLoading(
        message: "Data loaded successfully!",
        duration: Duration(seconds: 2),
        onClose: () => print("Success message closed"),
      );
    } catch (e) {
      loaderController.stopLoading(
        message: "Failed to load data.",
        isError: true,
        duration: Duration(seconds: 2),
        onClose: () => print("Error message closed"),
      );
    }
  }

  Future<void> loadNewTasks() async {
    try {
      final result = await SurveyTasklistService.getNewTaskList(
        token: "dummy-token",
      );
      tasks.assignAll(result);
    } catch (e) {
      print("Error loading tasks: $e");
    }
  }
}
