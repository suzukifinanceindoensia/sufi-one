import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/mobcol/models/tugasBelumSelesai_model.dart';

class TugasBelumSelesaiService {
  Future<List<TugasBelumSelesaiModel>> getAllTugasBelumSelesaiFromJson() async {
    try {
      final String rawJson = await rootBundle.loadString(
        'res/dummyData/mobcol/tugasbelumselesai.json',
      );
      final List<dynamic> decoded = json.decode(rawJson);
      return decoded.map((e) => TugasBelumSelesaiModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading or decoding JSON (Tugas Belum Selesai): $e');
      return [];
    }
  }
}