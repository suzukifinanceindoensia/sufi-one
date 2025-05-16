import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/uploadBukti/controller/mobcol_uploadbukti_view.dart';

class MobcolUploadbuktiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobcolUploadBuktiController>(() => MobcolUploadBuktiController());
  }
}