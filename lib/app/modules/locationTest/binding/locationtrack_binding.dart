import 'package:get/get.dart';
import 'package:sufi_one/app/modules/locationTest/controller/locationtrack_controller.dart';

class LocationTrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationTrackController());
  }
}