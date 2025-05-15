// lib/app/modules/survey/home/controllers/survey_home_controller.dart
import 'package:get/get.dart';

class SurveyUploadController extends GetxController {
  RxInt selectedTabIndex = 2.obs;

  // For now it's empty — just to confirm binding works
  void refreshData() {
    print("Refreshing data...");
  }
}
