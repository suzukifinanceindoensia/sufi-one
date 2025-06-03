import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/zeusdetail/controllers/zeusdetail_contorller.dart';

class DetailZeusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailZeusController>(() => DetailZeusController(),
    );
  }
}