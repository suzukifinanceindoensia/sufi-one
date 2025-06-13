import 'package:get/get.dart';
import '../controllers/permohonansk_controller.dart';

class PermohonanSkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermohonanSkController>(() => PermohonanSkController());
  }
}
