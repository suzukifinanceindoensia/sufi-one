import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';

Future<List<AppInfo>> getInstalledAppsList() async {
  try {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
    return apps;
  } catch (e) {
    print('Failed to fetch installed apps: $e');
    return [];
  }
}

// CONTOH PENGGUNAAN
//             ElevatedButton(
//               onPressed: _getInstalledApps,
//               child: Text('Show Installed Apps'),
//             ),
//             if (_isLoading)
//               CircularProgressIndicator()
//             else if (_errorMessage. )
//               Text(
//                 _errorMessage,
//                 style: TextStyle(color: Colors.red),
//               )
//             else if (_installedApps.isNotEmpty)
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _installedApps.length,
//                   itemBuilder: (context, index) {
//                     AppInfo app = _installedApps[index];
//                     return ListTile(
//                       leading: app.icon != null
//                           ? Image.memory(app.icon!)
//                           : Icon(Icons.android), // Default icon if no app icon
//                       title: Text(app.name),
//                       subtitle: Text(app.packageName),
//                     );
//                   },
//                 ),
//               )