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
}
