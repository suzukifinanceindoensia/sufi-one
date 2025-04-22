import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/views/survey_finish.dart';
import 'package:sufi_one/app/modules/survey/views/survey_newtask.dart';
import 'package:sufi_one/app/modules/survey/views/survey_process.dart';
import 'package:sufi_one/app/modules/survey/views/survey_upload.dart';
import 'package:flutter/material.dart';

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