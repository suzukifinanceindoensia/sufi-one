import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/views/survey_finish.dart';
import 'package:sufi_one/app/modules/survey/views/survey_newtask.dart';
import 'package:sufi_one/app/modules/survey/views/survey_process.dart';
import 'package:sufi_one/app/modules/survey/views/survey_upload.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> dummyData_newtask = [
  {
    'id': 1,
    'name': 'Alice Smith',
    'date': DateTime(2024, 1, 15),
  },
  {
    'id': 2,
    'name': 'Bob Johnson',
    'date': DateTime(2024, 2, 20),
  },
  {
    'id': 3,
    'name': 'Charlie Brown',
    'date': DateTime(2024, 3, 10),
  },
  {
    'id': 4,
    'name': 'Diana Miller',
    'date': DateTime(2024, 4, 5),
  },
  {
    'id': 5,
    'name': 'Ethan Davis',
    'date': DateTime(2024, 5, 12),
  },
  {
    'id': 6,
    'name': 'Grady Simanjaya',
    'date': DateTime(2025, 3, 12),
  },
];

List<Map<String, dynamic>> dummyDataProcess = [
  {
    'id': 1,
    'name': 'Asep Saepudin',
    'date': DateTime(2024, 5, 10),
  },
  {
    'id': 2,
    'name': 'Maria Renata',
    'date': DateTime(2024, 6, 17),
  },
  {
    'id': 3,
    'name': 'Budi Santoso',
    'date': DateTime(2024, 7, 22),
  },
];

List<Map<String, dynamic>> dummyDataUpload = [
  {
    'id': 1,
    'name': 'Siti Aminah',
    'date': DateTime(2024, 8, 15),
  },
  {
    'id': 2,
    'name': 'Andi Wijaya',
    'date': DateTime(2024, 9, 20),
  },
];

List<Map<String, dynamic>> dummyDataFinish = [
  {
    'id': 1,
    'name': 'Zhang Wei',
    'date': DateTime(2024, 5, 10),
  },
  {
    'id': 2,
    'name': 'Wang Li',
    'date': DateTime(2024, 6, 17),
  },
  {
    'id': 3,
    'name': 'Li Ming',
    'date': DateTime(2024, 7, 22),
  },
  {
    'id': 4,
    'name': 'Lin Yan',
    'date': DateTime(2024, 8, 01),
  },
];



class MobileSurveyController extends GetxController {
  final selectedIndex = 0.obs;
  final buttonLabels = ['New Task', 'Process', 'Upload', 'Finish'];
  final pages = <Widget>[
    const SurveyNewtask(),
    const SurveyProcess(),
    const SurveyUpload(),
    const SurveyFinish(),
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}