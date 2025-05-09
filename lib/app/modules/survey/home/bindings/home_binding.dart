// lib/app/modules/survey/home/bindings/survey_home_binding.dart
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/home/controllers/home_controller.dart';

class SurveyHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyHomeController>(() => SurveyHomeController());
  }
}
