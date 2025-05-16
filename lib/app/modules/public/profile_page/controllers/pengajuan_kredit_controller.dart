import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengajuanKreditController extends GetxController {
  final tipePembiayaan = ''.obs;
  final namaLengkap = TextEditingController();
  final noKtp = TextEditingController();
  final alamat = TextEditingController();
  final provinsi = ''.obs;
  final noHp = TextEditingController();
  final email = TextEditingController();
  final referral1 = TextEditingController();
  final referral2 = TextEditingController();

  final List<String> tipePembiayaanList = [
    'Pembiayaan Mobil',
    'Pembiayaan Motor',
  ];
  final List<String> provinsiList = [
    'Aceh',
    'Sumatera Utara',
    'Sumatera Barat',
    'Riau',
    'Jambi',
    'Sumatera Selatan',
    'Bengkulu',
    'Lampung',
    'Bangka Belitung',
    'Kepulauan Riau',
    'DKI Jakarta',
    'Jawa Barat',
    'Jawa Tengah',
    'DI Yogyakarta',
    'Jawa Timur',
    'Banten',
    'Bali',
    'NTB',
    'NTT',
    'Kalimantan Barat',
    'Kalimantan Tengah',
    'Kalimantan Selatan',
    'Kalimantan Timur',
    'Kalimantan Utara',
    'Sulawesi Utara',
    'Sulawesi Tengah',
    'Sulawesi Selatan',
    'Sulawesi Tenggara',
    'Gorontalo',
    'Sulawesi Barat',
    'Maluku',
    'Maluku Utara',
    'Papua',
    'Papua Barat',
  ];
}
