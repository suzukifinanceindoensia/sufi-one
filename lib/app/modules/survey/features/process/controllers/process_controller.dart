// lib/app/modules/survey/home/controllers/survey_home_controller.dart
import 'dart:async';

import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/widgets/circular_loader/circular_loader_controller.dart';

class SurveyProcessController extends GetxController {
  RxInt selectedTabIndex = 1.obs;
  final CircularLoaderController loaderController = CircularLoaderController();
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

  void simulateLoadingProcess() {
    loaderController.startLoading(message: "Loading data...");

    // Simulate API delay
    Timer(Duration(seconds: 1), () {
      // You can toggle between success or error here:
      final isError = false; // Change to true to simulate error

      if (isError) {
        loaderController.stopLoading(
          message: "Failed to load data.",
          isError: true,
          duration: Duration(seconds: 2),
          onClose: () => print("Error message closed"),
        );
      } else {
        loaderController.stopLoading(
          message: "Data loaded successfully!",
          // icon: const Icon(Icons.check_circle, color: Colors.green, size: 50),
          duration: Duration(seconds: 2),
          onClose: () => print("Success message closed"),
        );
      }
    });
  }
}
