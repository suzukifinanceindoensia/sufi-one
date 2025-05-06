import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/controllers/pengajuan_kredit_controller.dart';

class PengajuanKreditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanKreditController>(() => PengajuanKreditController());
  }
}
