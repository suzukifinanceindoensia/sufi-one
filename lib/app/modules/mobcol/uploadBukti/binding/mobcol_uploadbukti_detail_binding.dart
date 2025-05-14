import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/uploadBukti/controller/mobcol_uploadbukti_detail_controller.dart';

class MobcolUploadbuktiDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobcolUploadbuktiDetailController>(
      () => MobcolUploadbuktiDetailController(),
    );
  }
}