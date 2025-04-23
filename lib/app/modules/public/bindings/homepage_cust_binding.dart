import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/homepage_cust_controller.dart';

class HomepageCustBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageCustController>(() => HomepageCustController());
  }
}
