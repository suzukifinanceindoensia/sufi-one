import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class ZeusUtilsService {
  /// Memuat daftar cabang dari file JSON cabang lokal
  static Future<List<String>> loadDaftarCabang() async {
    final String jsonString = await rootBundle.loadString(
      'res/dummyData/cabang/daftar_cabang.json',
    );
    final List<dynamic> data = json.decode(jsonString);
    return data.map((e) => e['name'].toString()).toList();
  }

  /// Memuat daftar cabang dari file JSON skmbj lokal
  static Future<List<T>> loadJsonData<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => fromJson(e)).toList();
  }

  /// Menampilkan snackbar jika data kosong
  static void showEmptyDataSnackbar() {
    Get.snackbar(
      'Info',
      'Data kosong',
      backgroundColor: AppColors.navBackground,
      colorText: AppColors.iconDefault,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }
}
