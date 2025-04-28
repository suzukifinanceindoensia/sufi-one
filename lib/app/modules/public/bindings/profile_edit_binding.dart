import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/profile_edit_controller.dart'; // Import your controller

class ProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileEditController());
  }
}
