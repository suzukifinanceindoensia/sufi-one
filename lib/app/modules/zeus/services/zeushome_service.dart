import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/zeus/models/zeushome_model.dart';

class ZeushomeService {
  Future<List<ZeushomeModel>> getAllTugasBaruFromJson() async {
    try {
      final String rawJson = await rootBundle.loadString(
        'res/dummyData/zeus/platnomor.json',
      );
      final List<dynamic> decoded = json.decode(rawJson);
      return decoded.map((e) => ZeushomeModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading or decoding JSON (Tugas Baru): $e');
      return [];
    }
  }
}