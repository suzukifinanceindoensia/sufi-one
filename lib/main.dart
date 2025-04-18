import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';

import 'app/theme/fontstyle.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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
      theme: ThemeData(
        textTheme: TextTheme(
          bodySmall: AppTextStyles.smallBody,
          bodyMedium: AppTextStyles.medBody,
          bodyLarge: AppTextStyles.bigBody,
          titleSmall: AppTextStyles.smallTitle,
          titleMedium: AppTextStyles.medTitle,
          titleLarge: AppTextStyles.bigTitle,
          displaySmall: AppTextStyles.smallDisplay,
          displayMedium: AppTextStyles.medDisplay,
          displayLarge: AppTextStyles.bigDisplay,
          labelSmall: AppTextStyles.smallLabel, 
          labelMedium: AppTextStyles.medLabel,
          labelLarge: AppTextStyles.bigLabel,
          headlineSmall: AppTextStyles.smallHeadline,
          headlineMedium: AppTextStyles.medHeadline,
          headlineLarge: AppTextStyles.bigHeadline,
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
    );
  }
}
