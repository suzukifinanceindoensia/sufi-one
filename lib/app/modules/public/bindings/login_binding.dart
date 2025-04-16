import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}