import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/dashboard/controllers/mobile_collection_controller.dart';

class MobileCollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileCollectionController>(() => MobileCollectionController());
  }
}
