import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    // Binding the ProfilePageController to be used in ProfilePageView
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}
