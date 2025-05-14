import 'package:flutter/material.dart';
import 'package:get/get.dart';


final List<Map<String, dynamic>> alltugasbaru = [
  {
    'id': '00001',
    'name': 'Alice',
    'dateTime': DateTime(2025, 2, 10, 10, 30),
    'money': 100000,
    'coordinate': const {'latitude': -6.2088, 'longitude': 106.8456},
    'email': 'alice@example.com',
    'phoneNumber': '081234567890',
    'kelurahan': 'Menteng',
    'kecamatan': 'Menteng',
    'alamatLengkap': 'Jl. Kenangan No. 1, Menteng, Jakarta Pusat',
    'typeUnit': 'Toyota Avanza',
    'policeNumber': 'B 1234 AB',
    'colorOfCar': 'Silver',
    'angsuranKe': 1, 
    'kondisi': 'Baru', 
  },
  {
    'id': '00002',
    'name': 'Bob',
    'dateTime': DateTime(2025, 3, 10, 12, 0),
    'money': 150000,
    'coordinate': const {'latitude': -6.1754, 'longitude': 106.8272},
    'email': 'bob@example.com',
    'phoneNumber': '082234567891',
    'kelurahan': 'Gambir',
    'kecamatan': 'Gambir',
    'alamatLengkap': 'Jl. Kebahagiaan No. 2, Gambir, Jakarta Pusat',
    'typeUnit': 'Honda Jazz',
    'policeNumber': 'B 5678 CD',
    'colorOfCar': 'Merah',
    'angsuranKe': 3, 
    'kondisi': 'Bekas', 
  },
  {
    'id': '00003',
    'name': 'Charlie',
    'dateTime': DateTime(2025, 12, 9, 14, 45),
    'money': 200000,
    'coordinate': const {'latitude': -6.2299, 'longitude': 106.8228},
    'email': 'charlie@example.com',
    'phoneNumber': '083234567892',
    'kelurahan': 'Senen',
    'kecamatan': 'Senen',
    'alamatLengkap': 'Jl. Ceria No. 3, Senen, Jakarta Pusat',
    'typeUnit': 'Daihatsu Xenia',
    'policeNumber': 'B 9012 EF',
    'colorOfCar': 'Hitam',
    'angsuranKe': 2, 
    'kondisi': 'Baru', 
  },
  {
    'id': '00004',
    'name': 'David',
    'dateTime': DateTime(2025, 6, 4, 16, 15),
    'money': 250000,
    'coordinate': const {'latitude': -6.1886, 'longitude': 106.8105},
    'email': 'david@example.com',
    'phoneNumber': '084234567893',
    'kelurahan': 'Cikini',
    'kecamatan': 'Menteng',
    'alamatLengkap': 'Jl. Damai No. 4, Cikini, Jakarta Pusat',
    'typeUnit': 'Suzuki Ertiga',
    'policeNumber': 'B 3456 GH',
    'colorOfCar': 'Putih',
    'angsuranKe': 5,
    'kondisi': 'Bekas', 
  },
  {
    'id': '00005',
    'name': 'Eve',
    'dateTime': DateTime(2025, 8, 1, 18, 0),
    'money': 300000,
    'coordinate': const {'latitude': -6.2146, 'longitude': 106.8451},
    'email': 'eve@example.com',
    'phoneNumber': '085234567894',
    'kelurahan': 'Kebon Sirih',
    'kecamatan': 'Menteng',
    'alamatLengkap': 'Jl. Elok No. 5, Kebon Sirih, Jakarta Pusat',
    'typeUnit': 'Mitsubishi Xpander',
    'policeNumber': 'B 7890 IJ',
    'colorOfCar': 'Abu-abu',
    'angsuranKe': 12, 
    'kondisi': 'Baru', 
  },
  {
    'id': '00006',
    'name': 'Frank',
    'dateTime': DateTime(2025, 12, 13, 20, 30),
    'money': 350000,
    'coordinate': const {'latitude': -6.1956, 'longitude': 106.7982},
    'email': 'frank@example.com',
    'phoneNumber': '086234567895',
    'kelurahan': 'Tanah Abang',
    'kecamatan': 'Tanah Abang',
    'alamatLengkap': 'Jl. Fajar No. 6, Tanah Abang, Jakarta Pusat',
    'typeUnit': 'Nissan Livina',
    'policeNumber': 'B 2345 KL',
    'colorOfCar': 'Coklat',
    'angsuranKe': 7, 
    'kondisi': 'Bekas',
  },
  {
    'id': '00007',
    'name': 'Grace',
    'dateTime': DateTime(2025, 10, 22, 22, 0),
    'money': 400000,
    'coordinate': const {'latitude': -6.2308, 'longitude': 106.8618},
    'email': 'grace@example.com',
    'phoneNumber': '087234567896',
    'kelurahan': 'Rawasari',
    'kecamatan': 'Cempaka Putih',
    'alamatLengkap': 'Jl. Gemilang No. 7, Rawasari, Jakarta Pusat',
    'typeUnit': 'Wuling Confero',
    'policeNumber': 'B 6789 MN',
    'colorOfCar': 'Hitam',
    'angsuranKe': 9, 
    'kondisi': 'Baru',
  },
].obs;

class MobcolTugasbaruController extends GetxController {
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
  final RxList<Map<String, dynamic>> filteredtugasbaru = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredtugasbaru.value = alltugasbaru;
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
      filteredtugasbaru.value = alltugasbaru;
    } else {
      filteredtugasbaru.value = alltugasbaru
          .where((tugas) => tugas['name']
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    }
  }
}