// lib/app/modules/survey/home/controllers/survey_home_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/home/models/newtask_model.dart';
import 'package:sufi_one/app/modules/survey/features/home/services/newtask_service.dart';

class SurveyHomeController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  final RxList<SurveyNewtaskModel> tasks = <SurveyNewtaskModel>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadNewTasks();
    searchController.addListener(() {
      print("Search text: ${searchController.text}");
    });
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
      final result = await SurveyNewTaskService.getNewTaskList(
        token: "dummy-token",
      );
      tasks.assignAll(result);

      for (var task in result) {
        print("Task ID: ${task.submissionId}");
        for (var data in task.data ?? []) {
          print("Data code: ${data?.code}");
          print("Data Label: ${data?.label}");
          print("Data Name: ${data?.value}");
        }
        print("-----");
      }
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
