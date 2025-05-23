import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/features/finish/bindings/finish_binding.dart';
import 'package:sufi_one/app/modules/survey/features/finish/bindings/finish_detail_binding.dart';
import 'package:sufi_one/app/modules/survey/features/finish/views/finish_detail_view.dart';
import 'package:sufi_one/app/modules/survey/features/finish/views/finish_view.dart';
import 'package:sufi_one/app/modules/survey/features/home/bindings/detail_binding.dart';
import 'package:sufi_one/app/modules/survey/features/home/bindings/home_binding.dart';
import 'package:sufi_one/app/modules/survey/features/home/views/form_detail_view.dart';
import 'package:sufi_one/app/modules/survey/features/process/bindings/input_binding.dart';
import 'package:sufi_one/app/modules/survey/features/process/bindings/process_binding.dart';
import 'package:sufi_one/app/modules/survey/features/process/views/form_input_view.dart';
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
  static const surveyFormInput = '/survey/formInput';
  static const surveyFinishDetail = '/survey/finishDetail';

  static final routes = [
    GetPage(
      name: survey,
      transition: Transition.zoom,
      page: () => SurveySplashView(),
      binding: SurveySplashBinding(),
    ),
    GetPage(
      name: surveyHome,
      transition: Transition.fadeIn,
      page: () => SurveyHomeView(),
      binding: SurveyHomeBinding(),
    ),
    GetPage(
      name: surveyProcess,
      transition: Transition.fadeIn,
      page: () => SurveyProcessView(),
      binding: SurveyProcessBinding(),
    ),
    GetPage(
      name: surveyUpload,
      transition: Transition.fadeIn,
      page: () => SurveyUploadView(),
      binding: SurveyUploadBinding(),
    ),
    GetPage(
      name: surveyFinish,
      transition: Transition.fadeIn,
      page: () => SurveyFinishView(),
      binding: SurveyFinishBinding(),
    ),
    GetPage(
      name: surveyFinishDetail,
      transition: Transition.zoom,
      page: () => SurveyFinishDetailView(),
      binding: SurveyFinishDetailBinding(),
    ),
    GetPage(
      name: surveyFormDetail,
      // transition: Transition.,
      page: () => SurveyFormDetailView(),
      binding: SurveyFormDetailBinding(),
    ),
    GetPage(
      name: surveyFormInput,
      // transition: Transition.,
      page: () => SurveyFormInputView(),
      binding: SurveyInputBinding(),
    ),
  ];
}
