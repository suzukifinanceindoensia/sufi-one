// lib/app/modules/survey/home/bindings/survey_home_binding.dart
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/upload/controllers/upload_controller.dart';

class SurveyUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyUploadController>(() => SurveyUploadController());
  }
}
