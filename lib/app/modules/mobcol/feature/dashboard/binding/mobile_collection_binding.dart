import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/dashboard/controllers/mobile_collection_controller.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBaru_service.dart';

class MobcolDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTugasBaruService>(() => AllTugasBaruService());
    Get.lazyPut<MobcolDashboardController>(() => MobcolDashboardController());
  }
}