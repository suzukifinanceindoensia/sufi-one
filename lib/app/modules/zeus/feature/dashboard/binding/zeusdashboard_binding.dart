import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/dashboard/controller/zeusdashboard_controller.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';

class ZeusDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeusDashboardController>(() => ZeusDashboardController());
    Get.lazyPut<ZeushomeService>(() => ZeushomeService());
  }
}
