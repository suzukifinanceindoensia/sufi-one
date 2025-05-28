// lib/app/modules/survey/home/bindings/survey_home_binding.dart
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/process/controllers/input_controller.dart';

class SurveyInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyFormInputController>(() => SurveyFormInputController());
  }
}
