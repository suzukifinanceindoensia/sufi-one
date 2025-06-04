import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/controller/ceknopol_controller.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';

class CeknopolBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CeknopolController>(() => CeknopolController());
    Get.lazyPut<ZeushomeService>(() => ZeushomeService());
  }
}
