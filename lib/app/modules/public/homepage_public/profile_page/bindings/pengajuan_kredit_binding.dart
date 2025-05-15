import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/homepage_public/profile_page/controllers/pengajuan_kredit_controller.dart';

class PengajuanKreditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanKreditController>(() => PengajuanKreditController());
  }
}
