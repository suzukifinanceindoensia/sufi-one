import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:sufi_one/app/auth/controllers/auth_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
