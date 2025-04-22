import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'app/theme/fontstyle.dart';
import 'app/modules/mobcol/views/mobile_collection_view.dart';

void main() {
  runApp(MyApp());
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("INI KODE DARI ONESIGNAL");
  OneSignal.Notifications.requestPermission(true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SuperApp (Public)',
      debugShowCheckedModeBanner: false,
      //home: MobileCollection(),
      //initialRoute: AppRoutes.mobileCollection,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splash,
    );
  }
}
