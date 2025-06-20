import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/controller/mobcol_detailcust_controller.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBaru_service.dart';

class MobcolDetailCustBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => AllTugasBaruService());
    Get.lazyPut(() => MobcolDetailCustController());
    Get.putAsync<AllTugasBaruService>(() async {
      await Future.delayed(Duration(seconds: 2));
      return AllTugasBaruService();
    });
  }
}