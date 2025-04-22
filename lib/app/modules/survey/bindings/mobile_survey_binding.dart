import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/controllers/mobile_survey_controller.dart';

class MobileSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileSurveyController>(() => MobileSurveyController());
  }
}