import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_tugasbelumselesai_controller.dart';


class MobcolTugasbelumselesaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobcolTugasbelumselesaiController());
  }
}