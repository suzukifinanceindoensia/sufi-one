import 'package:get/get.dart';
import 'package:sufi_one/app/modules/locationTest/binding/locationtrack_binding.dart';
import 'package:sufi_one/app/modules/locationTest/view/locationtrack_view.dart';

class LocationRoutes {
  static const trackLocation = '/trackLocation/dashboard';
  static final routes = [
    GetPage(
      name: trackLocation,
      page: () => LocationTrackView(),
      binding: LocationTrackBinding(),
    ),
  ];
}
