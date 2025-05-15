import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/homepage_public/profile_page/controllers/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}
