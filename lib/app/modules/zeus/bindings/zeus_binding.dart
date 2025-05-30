import 'package:get/get.dart';
import '../controllers/zeus_controller.dart';

class ZeusBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeusController>(() => ZeusController());
  }
}
