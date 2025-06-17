import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/about/controllers/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController(), fenix: true);
  }
}
