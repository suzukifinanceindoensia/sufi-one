import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/controllers/splash_controller.dart';

class SurveySplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SurveySplashController());
  }
}
