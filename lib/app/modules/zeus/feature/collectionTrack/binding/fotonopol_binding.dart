import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/controller/fotonopol_controller.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';

class FotoNopolBingding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FotoNopolController>(() => FotoNopolController());
    Get.lazyPut<ZeushomeService>(() => ZeushomeService());
  }
}
