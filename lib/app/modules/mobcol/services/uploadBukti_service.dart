import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/mobcol/models/uploadBukti_model.dart';

class UploadBuktiService {
  Future<List<AllUploadBuktiModel>> getAllUploadBuktiFromJson() async {
    try {
      final String rawJson = await rootBundle.loadString(
        'res/dummyData/mobcol/uploadbukti.json',
      );
      final List<dynamic> decoded = json.decode(rawJson);
      return decoded.map((e) => AllUploadBuktiModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading or decoding JSON (Upload Bukti): $e');
      return [];
    }
  }
}