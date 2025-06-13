import 'package:get/get.dart';
import '../controllers/serahterimask_controller.dart';

class serahterimaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<serahterimaskController>(() => serahterimaskController());
  }
}
