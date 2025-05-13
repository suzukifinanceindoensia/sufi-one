import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/home/bindings/home_binding.dart';
import 'package:sufi_one/app/modules/survey/features/process/bindings/process_binding.dart';
import 'package:sufi_one/app/modules/survey/features/process/views/process_view.dart';
import 'package:sufi_one/app/modules/survey/features/splashscreen/splash_binding.dart';
import 'package:sufi_one/app/modules/survey/features/splashscreen/splash_view.dart';
import 'package:sufi_one/app/modules/survey/features/home/views/home_view.dart';

class SurveyRoutes {
  static const survey = '/survey/splash';
  static const surveyHome = '/survey/home';
  static const surveyProcess = '/survey/process';

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
  ];
}
