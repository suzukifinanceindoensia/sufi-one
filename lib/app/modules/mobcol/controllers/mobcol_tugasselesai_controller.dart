import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Map<String, dynamic>> alltugasselesai = [
  {
    'id': 'S001',
    'name': 'Citra Lestari',
    'dateTime': DateTime(2025, 5, 1, 09, 15),
    'money': 550000,
    'coordinate': const {'latitude': -6.1680, 'longitude': 106.8950},
    'email': 'citra.lestari@email.com',
    'phoneNumber': '081122334455',
    'kelurahan': 'Pegangsaan',
    'kecamatan': 'Menteng',
    'alamatLengkap': 'Jl. Sabang No. 15, Pegangsaan, Jakarta Pusat',
    'typeUnit': 'Toyota Rush',
    'policeNumber': 'B 3030 XYZ',
    'colorOfCar': 'Putih',
    'angsuranKe': 15,
    'kondisi': 'Bekas',
  },
  {
    'id': 'S002',
    'name': 'Budi Santoso',
    'dateTime': DateTime(2025, 5, 5, 11, 30),
    'money': 380000,
    'coordinate': const {'latitude': -6.2250, 'longitude': 106.8010},
    'email': 'budi.santoso@domain.net',
    'phoneNumber': '085678901234',
    'kelurahan': 'Petojo Utara',
    'kecamatan': 'Gambir',
    'alamatLengkap': 'Jl. Kamboja No. 8, Petojo Utara, Jakarta Pusat',
    'typeUnit': 'Honda CR-V',
    'policeNumber': 'B 777 ABC',
    'colorOfCar': 'Hitam',
    'angsuranKe': 8,
    'kondisi': 'Baru',
  },
  {
    'id': 'S003',
    'name': 'Dewi Ayu',
    'dateTime': DateTime(2025, 5, 9, 14, 00),
    'money': 290000,
    'coordinate': const {'latitude': -6.1990, 'longitude': 106.8520},
    'email': 'dewi.ayu@mymail.org',
    'phoneNumber': '087812345679',
    'kelurahan': 'Gondangdia',
    'kecamatan': 'Menteng',
    'alamatLengkap': 'Jl. Cemara No. 22, Gondangdia, Jakarta Pusat',
    'typeUnit': 'Suzuki Ignis',
    'policeNumber': 'B 1212 DEF',
    'colorOfCar': 'Merah',
    'angsuranKe': 3,
    'kondisi': 'Bekas',
  },
  {
    'id': 'S004',
    'name': 'Eko Prasetyo',
    'dateTime': DateTime(2025, 5, 12, 16, 45),
    'money': 420000,
    'coordinate': const {'latitude': -6.2350, 'longitude': 106.8150},
    'email': 'eko.prasetyo@work.com',
    'phoneNumber': '082299887766',
    'kelurahan': 'Kebon Kelapa',
    'kecamatan': 'Gambir',
    'alamatLengkap': 'Gg. Anggrek No. 5, Kebon Kelapa, Jakarta Pusat',
    'typeUnit': 'Daihatsu Terios',
    'policeNumber': 'B 5656 GHI',
    'colorOfCar': 'Silver',
    'angsuranKe': 11,
    'kondisi': 'Baru',
  },
  {
    'id': 'S005',
    'name': 'Farah Maulida',
    'dateTime': DateTime(2025, 5, 15, 10, 30),
    'money': 310000,
    'coordinate': const {'latitude': -6.1720, 'longitude': 106.8700},
    'email': 'farah.maulida@service.id',
    'phoneNumber': '089654321098',
    'kelurahan': 'Menteng Dalam',
    'kecamatan': 'Tebet', // Kecamatan berbeda untuk variasi
    'alamatLengkap': 'Jl. Bunga Mawar No. 10, Menteng Dalam, Jakarta Selatan', // Alamat berbeda
    'typeUnit': 'Nissan Magnite',
    'policeNumber': 'B 9090 JKL',
    'colorOfCar': 'Biru',
    'angsuranKe': 6,
    'kondisi': 'Bekas',
  },
];

class MobcolTugasSelesaiController extends GetxController {
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
  final RxList<Map<String, dynamic>> filteredtugasselesai = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredtugasselesai.value = alltugasselesai;
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
      filteredtugasselesai.value = alltugasselesai;
    } else {
      filteredtugasselesai.value = alltugasselesai
          .where((tugas) => tugas['name']
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    }
  }
}