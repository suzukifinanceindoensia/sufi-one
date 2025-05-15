import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/produk/controllers/produk_controller.dart';

class ProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdukController>(() => ProdukController());
  }
}
