import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasSelesai/controller/mobcol_tugasselesai_controller.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasSelesai_service.dart';


class MobcolTugasSelesaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>TugasSelesaiService());
    Get.lazyPut(() => MobcolTugasSelesaiController());
  }
}