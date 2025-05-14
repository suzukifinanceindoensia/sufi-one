import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Map<String, dynamic>> alluploadbukti = [
  {
    'id': '00013',
    'name': 'Eve',
    'dateTime': DateTime(2025, 7, 20, 11, 15),
    'money': 320000,
    'coordinate': const {'latitude': -6.2140, 'longitude': 106.8320},
    'email': 'eve@example.com',
    'phoneNumber': '081345678901',
    'kelurahan': 'Kebon Sirih KEBON SIRIH KEBON SIRIH',
    'kecamatan': 'Menteng',
    'alamatLengkap': 'Jl. Sabang No. 78, Kebon Sirih, Jakarta Pusat',
    'typeUnit': 'Toyota Calya',
    'policeNumber': 'B 2233 RS',
    'colorOfCar': 'Hitam',
    'angsuranKe': 5,
    'kondisi': 'Baru',
    'Progress': 2,
  },
  {
    'id': '00014',
    'name': 'Frank',
    'dateTime': DateTime(2025, 9, 1, 18, 0),
    'money': 480000,
    'coordinate': const {'latitude': -6.2460, 'longitude': 106.8010},
    'email': 'frank@example.com',
    'phoneNumber': '087890123456',
    'kelurahan': 'Petojo Selatan',
    'kecamatan': 'Gambir',
    'alamatLengkap': 'Jl. Tanah Abang I No. 23, Petojo Selatan, Jakarta Pusat',
    'typeUnit': 'Daihatsu Sigra',
    'policeNumber': 'B 7788 YZ',
    'colorOfCar': 'Silver',
    'angsuranKe': 10,
    'kondisi': 'Bekas',
    'Progress': 1,
  },
].obs;


class MobcolUploadBuktiController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString searchText = ''.obs;
  
  final Map<int, String> monthsInYear = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December",
  };
  final RxList<Map<String, dynamic>> filtereduploadbukti = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filtereduploadbukti.value = alluploadbukti;
    searchController.addListener(_onSearchChanged);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void _onSearchChanged() {
    searchText.value = searchController.text;
    if (searchText.isEmpty) {
      filtereduploadbukti.value = alluploadbukti;
    } else {
      filtereduploadbukti.value = alluploadbukti
          .where((tugas) => tugas['name']
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    }
  }
}