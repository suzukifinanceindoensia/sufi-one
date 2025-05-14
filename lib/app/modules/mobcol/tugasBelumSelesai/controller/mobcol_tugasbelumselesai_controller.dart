import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Map<String, dynamic>> alltugasbelumselesai = [
  {
    'id': '00010',
    'name': 'Bob',
    'dateTime': DateTime(2025, 6, 15, 14, 45),
    'money': 250000,
    'coordinate': const {'latitude': -6.1754, 'longitude': 106.8272},
    'email': 'bob@example.com',
    'phoneNumber': '085112233445',
    'kelurahan': 'Gondangdia',
    'kecamatan': 'Menteng',
    'alamatLengkap': 'Jl. Mawar No. 12, Gondangdia, Jakarta Pusat',
    'typeUnit': 'Honda Brio',
    'policeNumber': 'B 9876 XY',
    'colorOfCar': 'Merah',
    'angsuranKe': 3,
    'kondisi': 'Bekas',
  },
  {
    'id': '00011',
    'name': 'Charlie',
    'dateTime': DateTime(2025, 3, 1, 9, 0),
    'money': 600000,
    'coordinate': const {'latitude': -6.2511, 'longitude': 106.8190},
    'email': 'charlie@example.com',
    'phoneNumber': '089988776655',
    'kelurahan': 'Senen',
    'kecamatan': 'Senen',
    'alamatLengkap': 'Jl. Kramat No. 34, Senen, Jakarta Pusat',
    'typeUnit': 'Daihatsu Xenia',
    'policeNumber': 'B 5432 ZW',
    'colorOfCar': 'Putih',
    'angsuranKe': 12,
    'kondisi': 'Baru',
  },
  {
    'id': '00012',
    'name': 'Diana',
    'dateTime': DateTime(2025, 11, 5, 16, 30),
    'money': 150000,
    'coordinate': const {'latitude': -6.1902, 'longitude': 106.8805},
    'email': 'diana@example.com',
    'phoneNumber': '082233445566',
    'kelurahan': 'Cikini',
    'kecamatan': 'Menteng',
    'alamatLengkap': 'Jl. Pegangsaan Timur No. 56, Cikini, Jakarta Pusat',
    'typeUnit': 'Suzuki Ertiga',
    'policeNumber': 'B 1122 PQ',
    'colorOfCar': 'Abu-abu',
    'angsuranKe': 6,
    'kondisi': 'Bekas',
  },
].obs;


class MobcolTugasbelumselesaiController extends GetxController {
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
  final RxList<Map<String, dynamic>> filteredtugasbelumselesai = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredtugasbelumselesai.value = alltugasbelumselesai;
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
      filteredtugasbelumselesai.value = alltugasbelumselesai;
    } else {
      filteredtugasbelumselesai.value = alltugasbelumselesai
          .where((tugas) => tugas['name']
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    }
  }
}