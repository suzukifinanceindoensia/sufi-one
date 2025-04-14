import 'package:onesignal_flutter/onesignal_flutter.dart';
// INI MASUKIN KE MAIN SAJA
void pushNotif() {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("INI KODE DARI ONESIGNAL");
  OneSignal.Notifications.requestPermission(true);
}
