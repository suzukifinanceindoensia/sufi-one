import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/profile_page/controllers/profile_page_controller.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
