import 'dart:io';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';
import 'package:sufi_one/app/services/check_app_model.dart';

// Pengecekan aplikasi akan running jika melakukan perpindahan page/module melalui side bar dan ter print di terminal
class CheckingInstalledAppService {
  Future<void> checkInstalledApps() async {
    if (Platform.isAndroid) {
      try {
        List<AppModel> appModels = [];
        List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
        for (var app in apps) {
          appModels.add(
            AppModel(
              appName: app.name.isNotEmpty ? app.name : "unknown",
              packageName:
                  app.packageName.isNotEmpty ? app.packageName : "unknown",
              versionName:
                  app.versionName.isNotEmpty ? app.versionName : "unknown",
              versionCode: app.versionCode,
            ),
          );
        }

        // Pilihan output: hanya nama aplikasi dengan nomor urut
        /*print("Daftar aplikasi terinstall:");
        for (int i = 0; i < appModels.length; i++) {
          print("${i + 1}. ${appModels[i].appName}");
        }*/

        // Pilihan output: lengkap nama + packageName + versi
        print("Detail list aplikasi terinstall:");
        for (int i = 0; i < appModels.length; i++) {
          final app = appModels[i];
          print(
            "${i + 1}. ${app.appName} (Package: ${app.packageName}, Version: ${app.versionName} - Code: ${app.versionCode})",
          );
        }
      } catch (e) {
        print("Error checking installed apps: $e");
      }
    } else if (Platform.isIOS) {
      print("Fitur ini belum didukung untuk iOS");
    }
  }
}
