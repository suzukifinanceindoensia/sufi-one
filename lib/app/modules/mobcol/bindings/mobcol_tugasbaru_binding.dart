import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_tugasbaru_controller.dart';


class MobcolTugasbaruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobcolTugasbaruController());
  }
}