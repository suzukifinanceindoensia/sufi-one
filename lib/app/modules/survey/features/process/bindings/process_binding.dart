// lib/app/modules/survey/home/bindings/survey_home_binding.dart
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/process/controllers/process_controller.dart';

class SurveyProcessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyProcessController>(() => SurveyProcessController());
  }
}
