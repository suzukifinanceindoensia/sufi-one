import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/controllers/process_survey_controller.dart';

class ProcessSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessSurveyController>(() => ProcessSurveyController());
  }
}
