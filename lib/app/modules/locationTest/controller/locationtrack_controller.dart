import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart'; // Import for device info
import 'package:flutter/foundation.dart'; // Import for kIsWeb

class LocationTrackController extends GetxController {
  final RxString latitude = 'Loading...'.obs;
  final RxString longitude = 'Loading...'.obs;
  final RxString timestamp = 'Loading...'.obs;
  final RxString deviceId = 'Loading...'.obs; // Add RxString for device ID
  StreamSubscription<Position>? _positionStreamSubscription;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _getDeviceId(); // Get device ID on initialization
    _startLocationTracking();
  }

  // Get the device ID
  Future<void> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    try {
      if (kIsWeb) {
        deviceId.value = 'Web Device'; // No device ID for web.
      } else if (GetPlatform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId.value = androidInfo.id; // Use androidInfo.id
      } else if (GetPlatform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId.value = iosInfo.identifierForVendor ??
            'Unknown'; // Use identifierForVendor on iOS
      } else {
        deviceId.value = 'Unsupported Platform';
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting device ID: $e");
      }
      deviceId.value =
          'Error: ${e.toString()}'; // Keep the error, but don't crash.
    }
  }

  // Get the current location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request them.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _startLocationTracking() {
    _updateLocation();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _updateLocation();
    });
  }

  void _updateLocation() async {
    try {
      Position position = await _determinePosition();
      latitude.value = position.latitude.toString();
      longitude.value = position.longitude.toString();
      timestamp.value = _dateFormat.format(
          position.timestamp != null ? position.timestamp! : DateTime.now());
    } catch (error) {
      latitude.value = 'Error: ${error.toString()}';
      longitude.value = 'Error: ${error.toString()}';
      timestamp.value = 'Error: ${error.toString()}';
    }
  }

  @override
  void onClose() {
    _positionStreamSubscription?.cancel();
    _timer?.cancel();
    super.onClose();
  }

  void getLocation() {
    _determinePosition().then((position) {
      latitude.value = position.latitude.toString();
      longitude.value = position.longitude.toString();
      timestamp.value = _dateFormat.format(
          position.timestamp != null ? position.timestamp! : DateTime.now());
    }).catchError((error) {
      latitude.value = 'Error: ${error.toString()}';
      longitude.value = 'Error: ${error.toString()}';
      timestamp.value = 'Error: ${error.toString()}';
    });
  }
}

