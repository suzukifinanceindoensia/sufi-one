import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/dashboard/controllers/mobile_collection_controller.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBaru_service.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBelumSelesai_service.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasSelesai_service.dart';
import 'package:sufi_one/app/modules/mobcol/services/uploadBukti_service.dart';

class MobcolDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTugasBaruService>(() => AllTugasBaruService());
    Get.lazyPut<TugasBelumSelesaiService>(() => TugasBelumSelesaiService());
    Get.lazyPut<TugasSelesaiService>(() => TugasSelesaiService());
    Get.lazyPut<UploadBuktiService>(() => UploadBuktiService());
    // Get.putAsync<AllTugasBaruService>(() async {
    //   await Future.delayed(Duration(seconds: 0));
    //   return AllTugasBaruService();
    // });
    // Get.putAsync<TugasBelumSelesaiService>(() async {
    //   await Future.delayed(Duration(seconds: 0));
    //   return TugasBelumSelesaiService();
    // });
    // Get.putAsync<TugasSelesaiService>(() async {
    //   await Future.delayed(Duration(seconds: 0));
    //   return TugasSelesaiService();
    // });
    // Get.putAsync<UploadBuktiService>(() async {
    //   await Future.delayed(Duration(seconds: 0));
    //   return UploadBuktiService();
    // });
    Get.lazyPut<MobcolDashboardController>(
      () => MobcolDashboardController(
        // allTugasBaruService: Get.find<AllTugasBaruService>(),
        // tugasBelumSelesaiService: Get.find<TugasBelumSelesaiService>(),
        // tugasSelesaiService: Get.find<TugasSelesaiService>(),
        // uploadBuktiService: Get.find<UploadBuktiService>(),
      ),
    );
  }
}