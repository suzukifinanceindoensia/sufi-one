import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBaru/controller/mobcol_detailcust_controller.dart';

class MobcolDetailCustBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobcolDetailCustController());
  }
}