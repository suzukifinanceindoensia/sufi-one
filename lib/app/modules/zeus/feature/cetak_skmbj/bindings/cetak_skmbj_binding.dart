import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/cetak_skmbj/controllers/cetak_skmbj_controller.dart';

class CetakSkmbjBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CetakSkmbjController>(() => CetakSkmbjController());
  }
}
