import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/uploadBukti/controller/mobcol_uploadbukti_detail_controller.dart';
import 'package:sufi_one/app/modules/mobcol/services/uploadBukti_service.dart';

class MobcolUploadbuktiDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobcolUploadbuktiDetailController>(() => MobcolUploadbuktiDetailController());
    Get.putAsync<UploadBuktiService>(() async {
      await Future.delayed(Duration(seconds: 2));
      return UploadBuktiService();
    });
  }
}