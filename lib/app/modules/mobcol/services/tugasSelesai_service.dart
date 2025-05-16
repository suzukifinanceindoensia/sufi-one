import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasSelesai_model.dart';

class TugasSelesaiService {
  Future<List<AllTugasSelesaiModel>> getAllTugasSelesaiFromJson() async {
    try {
      final String rawJson = await rootBundle.loadString(
        'res/dummyData/mobcol/tugasselesai.json',
      );
      final List<dynamic> decoded = json.decode(rawJson);
      return decoded.map((e) => AllTugasSelesaiModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading or decoding JSON (Tugas Selesai): $e');
      return [];
    }
  }
}