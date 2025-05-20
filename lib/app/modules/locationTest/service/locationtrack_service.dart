import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/locationTest/model/locationtrack_model.dart';

class LocationtrackService {
  Future<List<LocationTrackModel>> getLocationTrackFromJson() async {
    try {
      final String rawJson = await rootBundle.loadString(
        'res/dummyData/tracklocation/userdata.json',
      );
      final List<dynamic> decoded = json.decode(rawJson);
      return decoded.map((e) => LocationTrackModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading or decoding JSON (Track Location): $e');
      return [];
    }
  }
}