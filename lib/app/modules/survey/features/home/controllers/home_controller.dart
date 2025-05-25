import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/models/application_model.dart';
import 'package:sufi_one/app/modules/survey/services/tasklist_service.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_controller.dart';

class SurveyHomeController extends GetxController {
  final CircularLoaderController loaderController = CircularLoaderController();
  RxInt selectedTabIndex = 0.obs;
  final RxList<SurveyApplicationModel> tasks = <SurveyApplicationModel>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // loadNewTasks();
    simulateLoadingProcess();

    searchController.addListener(() {
      print("Search text: ${searchController.text}");
    });
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

  // For now it's empty — just to confirm binding works
  Future<void> refreshData() async {
    print("Refreshing data...");
    await Future.delayed(const Duration(seconds: 2));
    await loadNewTasks();
    print("Done");
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

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
