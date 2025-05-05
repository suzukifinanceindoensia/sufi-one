import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
