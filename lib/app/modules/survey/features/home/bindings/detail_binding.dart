// bindings/form_binding.dart

import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/home/controllers/detail_controller.dart';

class SurveyFormDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyFormDetailController>(() => SurveyFormDetailController());
  }
}
