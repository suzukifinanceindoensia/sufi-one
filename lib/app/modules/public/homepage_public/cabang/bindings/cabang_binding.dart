import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/homepage_public/cabang/controllers/cabang_controller.dart';

class CabangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CabangController());
  }
}
