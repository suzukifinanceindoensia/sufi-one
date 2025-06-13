import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/controller/mobcol_kunjungan_controller.dart';
import 'package:sufi_one/app/modules/mobcol/services/tugasBaru_service.dart';


class KunjunganBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => AllTugasBaruService());
    Get.lazyPut(() => KunjunganController());
    Get.putAsync<AllTugasBaruService>(() async {
      await Future.delayed(Duration(seconds: 2));
      return AllTugasBaruService();
    });
  }
}
