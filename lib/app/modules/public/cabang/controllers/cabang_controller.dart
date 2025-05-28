import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sufi_one/app/modules/public/cabang/models/cabang_model.dart';

class CabangController extends GetxController {
  final RxList<CabangModel> cabangList = <CabangModel>[].obs;
  RxString selectedCabang = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCabangFromJson();
    _requestLocationPermission();
  }

  Future<void> loadCabangFromJson() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'res/dummyData/cabang/daftar_cabang.json',
      );
      final List<dynamic> jsonData = json.decode(jsonString);

      final List<CabangModel> loadedCabang =
          jsonData
              .map((item) => CabangModel.fromJson(item as Map<String, dynamic>))
              .toList();

      cabangList.assignAll(loadedCabang);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data cabang: $e');
    }
  }

  void updateSelectedCabang(String cabangName) async {
    selectedCabang.value = cabangName;
    await calculateDistance(cabangName);
  }

  Future<void> calculateDistance(String cabangName) async {
    try {
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final index = cabangList.indexWhere((c) => c.name == cabangName);

      if (index == -1) {
        Get.snackbar('Error', 'Cabang tidak ditemukan');
        return;
      }

      final cabang = cabangList[index];

      final distance =
          Geolocator.distanceBetween(
            currentPosition.latitude,
            currentPosition.longitude,
            cabang.latitude,
            cabang.longitude,
          ) /
          1000; // km

      // Update jarak dan refresh list
      cabangList[index] = CabangModel(
        name: cabang.name,
        address: cabang.address,
        latitude: cabang.latitude,
        longitude: cabang.longitude,
        distance: "${distance.toStringAsFixed(2)} km",
      );
      cabangList.refresh();
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat menghitung jarak: $e');
    }
  }

  Future<void> goToMap(String name) async {
    final cabang = cabangList.firstWhere(
      (c) => c.name == name,
      orElse:
          () => CabangModel(name: '', address: '', latitude: 0, longitude: 0),
    );

    if (cabang.latitude != 0 && cabang.longitude != 0) {
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=${cabang.latitude},${cabang.longitude}';
      final Uri uri = Uri.parse(googleMapsUrl);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        Get.snackbar('Error', 'Tidak dapat membuka Google Maps.');
      }
    } else {
      Get.snackbar('Error', 'Koordinat cabang tidak ditemukan.');
    }
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        Get.snackbar('Error', 'Izin lokasi diperlukan untuk menghitung jarak.');
      }
    }
  }
}
