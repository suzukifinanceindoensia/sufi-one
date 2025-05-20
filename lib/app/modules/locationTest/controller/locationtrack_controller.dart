import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:sufi_one/app/modules/locationTest/model/locationtrack_model.dart';
import 'package:sufi_one/app/modules/locationTest/service/locationtrack_service.dart';
import 'dart:convert'; // Import for JSON encoding

class LocationTrackController extends GetxController {
  final LocationtrackService _LocationTrackService = Get.find<LocationtrackService>();
  final RxString latitude = 'Loading...'.obs;
  final RxString longitude = 'Loading...'.obs;
  final RxString timestamp = 'Loading...'.obs;
  final RxString deviceId = 'Loading...'.obs;
  RxList<LocationTrackModel> listLocationTrack = <LocationTrackModel>[].obs;
  StreamSubscription<Position>? _positionStreamSubscription;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  Timer? _timer;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  // You'll need to get the userId from somewhere, e.g., an authentication service
  final RxString userId = 'your_user_id_here'.obs; // **Important: Replace with actual user ID logic**

  @override
  void onInit() {
    super.onInit();
    fetchTrackLocation();
    _startLocationTracking();
    _getDeviceId();
  }

  // Get the device ID
  Future<void> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    try {
      if (kIsWeb) {
        deviceId.value = 'Web Device';
      } else if (GetPlatform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId.value = androidInfo.id;
      } else if (GetPlatform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId.value = iosInfo.identifierForVendor ?? 'Unknown';
      } else {
        deviceId.value = 'Unsupported Platform';
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting device ID: $e");
      }
      deviceId.value = 'Error: ${e.toString()}';
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
      // Call the method to generate and potentially send JSON here
      generateAndSendLocationJson();
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

  Future<void> fetchTrackLocation() async {
    isLoading.value = true;
    try {
      final List<LocationTrackModel> dataUpload = await _LocationTrackService.getLocationTrackFromJson();
      listLocationTrack.assignAll(dataUpload);
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Gagal mengambil data: $e';
      isLoading.value = false;
    }
  }

  String generateLocationJson() {
    final Map<String, dynamic> locationData = {
      'coordinates': {
        'latitude': latitude.value,
        'longitude': longitude.value,
      },
      'phone_id': deviceId.value,
      'user_id': userId.value, // Ensure userId is properly set
      'timestamp': timestamp.value,
    };
    return jsonEncode(locationData);
  }

  Future<void> generateAndSendLocationJson() async {
    try {
      final String jsonData = generateLocationJson();
      if (kDebugMode) {
        print('Generated JSON: $jsonData');
      }
      print("JSON data to be sent: $jsonData");

    } catch (e) {
      if (kDebugMode) {
        print("Error generating or sending JSON: $e");
      }
    }
  }
}