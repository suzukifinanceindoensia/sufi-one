import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/finish/bindings/finish_binding.dart';
import 'package:sufi_one/app/modules/survey/features/finish/views/finish_view.dart';
import 'package:sufi_one/app/modules/survey/features/home/bindings/detail_binding.dart';
import 'package:sufi_one/app/modules/survey/features/home/bindings/home_binding.dart';
import 'package:sufi_one/app/modules/survey/features/home/views/form_detail_view.dart';
import 'package:sufi_one/app/modules/survey/features/process/bindings/process_binding.dart';
import 'package:sufi_one/app/modules/survey/features/process/views/process_view.dart';
import 'package:sufi_one/app/modules/survey/features/splashscreen/splash_binding.dart';
import 'package:sufi_one/app/modules/survey/features/splashscreen/splash_view.dart';
import 'package:sufi_one/app/modules/survey/features/home/views/home_view.dart';
import 'package:sufi_one/app/modules/survey/features/upload/bindings/upload_binding.dart';
import 'package:sufi_one/app/modules/survey/features/upload/views/upload_view.dart';

class SurveyRoutes {
  static const survey = '/survey/splash';
  static const surveyHome = '/survey/home';
  static const surveyProcess = '/survey/process';
  static const surveyUpload = '/survey/upload';
  static const surveyFinish = '/survey/finish';
  static const surveyFormDetail = '/survey/formDetail';

  static final routes = [
    GetPage(
      name: survey,
      page: () => SurveySplashView(),
      binding: SurveySplashBinding(),
    ),
    GetPage(
      name: surveyHome,
      page: () => SurveyHomeView(),
      binding: SurveyHomeBinding(),
    ),
    GetPage(
      name: surveyProcess,
      page: () => SurveyProcessView(),
      binding: SurveyProcessBinding(),
    ),
    GetPage(
      name: surveyUpload,
      page: () => SurveyUploadView(),
      binding: SurveyUploadBinding(),
    ),
    GetPage(
      name: surveyFinish,
      page: () => SurveyFinishView(),
      binding: SurveyFinishBinding(),
    ),
    GetPage(
      name: surveyFormDetail,
      page: () => SurveyFormDetailView(),
      binding: SurveyFormDetailBinding(),
    ),
  ];
}
