import 'package:get/get.dart';
import '../controllers/zeus_controller.dart';

class ZeusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeusController>(() => ZeusController());
  }
}
