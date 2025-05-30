import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/zeushome/controllers/zeus_controller.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';

class ZeusBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeusController>(() => ZeusController());
    Get.lazyPut<ZeushomeService>(() => ZeushomeService());
  }
}
