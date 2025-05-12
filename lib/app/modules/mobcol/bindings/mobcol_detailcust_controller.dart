import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_detailcust_controller.dart';

class MobcolDetailCustBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobcolDetailCustController());
  }
}