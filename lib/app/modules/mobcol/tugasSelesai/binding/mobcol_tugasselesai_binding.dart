import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/tugasSelesai/controller/mobcol_tugasselesai_controller.dart';


class MobcolTugasSelesaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobcolTugasSelesaiController());
  }
}