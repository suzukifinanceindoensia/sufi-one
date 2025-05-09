import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/splashscreen/splash_binding.dart';
import 'package:sufi_one/app/modules/survey/splashscreen/splash_view.dart';
import 'package:sufi_one/app/modules/survey/home/home_view.dart';

class SurveyRoutes {
  static const survey = '/survey/splash';
  static const surveyHome = '/survey/home';

  static final routes = [
    GetPage(
      name: survey,
      page: () => SurveySplashView(),
      binding: SurveySplashBinding(),
    ),
    GetPage(name: surveyHome, page: () => SurveyHome()),
  ];
}
