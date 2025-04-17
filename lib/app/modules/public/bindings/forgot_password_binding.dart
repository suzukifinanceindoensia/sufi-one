import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/forgot_password.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}