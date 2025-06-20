import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBelumSelesai/controller/mobcol_tugasbelumselesai_controller.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBelumSelesai_service.dart';


class MobcolTugasbelumselesaiBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<TugasBelumSelesaiService>(() => TugasBelumSelesaiService());
    Get.lazyPut(() => MobcolTugasbelumselesaiController());
    Get.putAsync<TugasBelumSelesaiService>(() async {
      await Future.delayed(Duration(seconds: 2));
      return TugasBelumSelesaiService();
    });
  }
}