import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyFormDetailController extends GetxController
    with GetTickerProviderStateMixin {
  // Dummy data
  final applicationCode = "APP-2025001".obs;
  final submissionNumber = "SUB-0001".obs;
  final submissionDate = DateTime.now().subtract(Duration(days: 1)).obs;
  final finishedDate = DateTime.now().obs;
  final stateId = 101.obs;
  final duration = Duration(days: 1, hours: 5, minutes: 30).obs;

  // List<String> tabs = ['Form A', 'Form B', 'Form C'];
  late TabController tabController;
  // Dummy tabs data — no model needed yet
  final tabs =
      [
        {'id': 1, 'name': 'ORDERIN'},
        {'id': 1, 'name': 'SURVEY'},
      ].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
