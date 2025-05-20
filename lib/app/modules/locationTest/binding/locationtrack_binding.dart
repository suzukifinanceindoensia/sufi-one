import 'package:get/get.dart';
import 'package:sufi_one/app/modules/locationTest/controller/locationtrack_controller.dart';
import 'package:sufi_one/app/modules/locationTest/service/locationtrack_service.dart';

class LocationTrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationTrackController());
    Get.lazyPut<LocationtrackService>(() => LocationtrackService());
  }
}