import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sufi_one/app/modules/survey/models/application_model.dart';

class SurveyNewTaskService {
  static Future<List<SurveyApplicationModel>> getNewTaskList({
    required String? token,
  }) async {
    try {
      final String rawResponse = await rootBundle.loadString(
        'res/dummyData/survey/newTasks.json',
      );

      final Map<String, dynamic> jsonMap = json.decode(rawResponse);
      final List<dynamic> mainDataList = jsonMap['data'] ?? [];

      return mainDataList
          .map((e) => SurveyApplicationModel.fromJson(e))
          .toList();
    } catch (error) {
      print('Error loading tasks: $error');
      rethrow;
    }
  }
}
