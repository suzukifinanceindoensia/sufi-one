import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/bindings/auth_binding.dart';
import 'package:sufi_one/app/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthController(), permanent: true);
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("INI KODE DARI ONESIGNAL");
  OneSignal.Notifications.requestPermission(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SuperApp (Public)',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeRoutes.splash,
      initialBinding: AuthBinding(),
      getPages: AppRoutes.pages,
    );
  }
}
