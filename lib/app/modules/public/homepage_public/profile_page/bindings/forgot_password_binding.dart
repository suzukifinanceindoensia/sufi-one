import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/homepage_public/profile_page/controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
