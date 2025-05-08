import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobcol_kunjungan_controller.dart';


class KunjunganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KunjunganController());
  }
}
