import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/survey/models/collection_model.dart';

class SurveyCollectionService {
  Future<List<SurveyCollectionModel>> getCollectionsFromJson() async {
    final String rawJson = await rootBundle.loadString(
      'res/dummyData/survey/collections.json',
    );
    final List<dynamic> decoded = json.decode(rawJson);
    return decoded.map((e) => SurveyCollectionModel.fromJson(e)).toList();
  }

  Future<void> syncCollections({
    required Function(String message) onSync,
    required Function(bool done) onDone,
  }) async {
    try {
      onSync("Reading dummy data...");
      final collections = await getCollectionsFromJson();

      for (final item in collections) {
        onSync("Simulating sync: ${item.name}");
        await Future.delayed(const Duration(milliseconds: 500));
      }

      onSync("Finished sync from dummy.");
      onDone(true);
    } catch (e) {
      onDone(false);
    }
  }
}
