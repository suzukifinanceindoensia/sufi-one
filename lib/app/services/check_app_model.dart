class AppModel {
  final String appName;
  final String packageName;
  final String versionName;
  final int versionCode;

  AppModel({
    required this.appName,
    required this.packageName,
    required this.versionName,
    required this.versionCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'appName': appName,
      'packageName': packageName,
      'versionName': versionName,
      'versionCode': versionCode,
    };
  }

  //daftar package name aplikasi fakeGPS
  static const List<String> fakeGpsPackages = [
    'com.lexa.fakegps',
    'com.blogspot.newapphorizons.fakegps',
    'com.just4funtools.fakegpslocationprofessional',
    'com.hopefactory2021.fakegpslocation',
    'com.mobile.fakelocation',
    'fake.gps.location.emulator',
    'top.tinysoft.fakegps',
    'project.listick.fakegps',
    'fakegps.fakelocation.mocklocation.gpsfaker',
    'com.gsmartstudio.fakegps',
    'com.evezzon.fakegps',
    'com.discipleskies.mock_location_spoofer',
    'com.mock.cartage',
    'com.locationchanger',
  ];
}
