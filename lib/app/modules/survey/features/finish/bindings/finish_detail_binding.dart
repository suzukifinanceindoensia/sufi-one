// bindings/form_binding.dart

import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/finish/controllers/finish_detail_controller.dart';

class SurveyFinishDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyFinishDetailController>(
      () => SurveyFinishDetailController(),
    );
  }
}
