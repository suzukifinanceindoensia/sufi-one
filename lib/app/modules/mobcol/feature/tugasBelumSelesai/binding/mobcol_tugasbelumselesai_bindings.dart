import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBelumSelesai/controller/mobcol_tugasbelumselesai_controller.dart';


class MobcolTugasbelumselesaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobcolTugasbelumselesaiController());
  }
}