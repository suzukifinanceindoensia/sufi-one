// lib/app/modules/survey/home/bindings/survey_home_binding.dart
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/finish/controllers/finish_controller.dart';

class SurveyFinishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyFinishController>(() => SurveyFinishController());
  }
}
