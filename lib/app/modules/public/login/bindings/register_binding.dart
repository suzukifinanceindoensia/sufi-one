import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/login/controllers/register_controller.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
