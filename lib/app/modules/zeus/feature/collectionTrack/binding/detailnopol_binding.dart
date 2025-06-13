import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/controller/detailnopol_controller.dart';

class DetailnopolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailnopolController>(() => DetailnopolController(),
    );
  }
}