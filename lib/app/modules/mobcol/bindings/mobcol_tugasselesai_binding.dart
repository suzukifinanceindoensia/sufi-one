import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_tugasselesai_controller.dart';


class MobcolTugasSelesaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobcolTugasSelesaiController());
  }
}