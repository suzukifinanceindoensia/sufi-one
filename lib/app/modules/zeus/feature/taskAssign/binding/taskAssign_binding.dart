import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/taskAssign/controller/taskAssign_controller.dart';
import 'package:sufi_one/app/modules/zeus/services/zeushome_service.dart';

class TaskAssignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeushomeService>(() => ZeushomeService());
    // Get.putAsync<ZeushomeService>(() async {
    //   await Future.delayed(Duration(seconds: 2));
    //   return ZeushomeService();
    // });
    Get.lazyPut<TaskAssignController>(() => TaskAssignController());
  }
}
