import 'package:get/get.dart';
import '../controllers/cetak_stmbj_controller.dart';

class CetakStmbjBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CetakStmbjController>(() => CetakStmbjController());
  }
}
