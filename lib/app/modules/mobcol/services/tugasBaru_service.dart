import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBaru_model.dart';

class AllTugasBaruService {
  Future<List<AllTugasBaruModel>> getAllTugasBaruFromJson() async {
    try {
      final String rawJson = await rootBundle.loadString(
        'res/dummyData/mobcol/tugasbaru.json',
      );
      final List<dynamic> decoded = json.decode(rawJson);
      return decoded.map((e) => AllTugasBaruModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading or decoding JSON (Tugas Baru): $e');
      return [];
    }
  }
}