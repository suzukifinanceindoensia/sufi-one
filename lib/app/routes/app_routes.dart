import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/bindings/forgot_password_binding.dart';
import 'package:sufi_one/app/modules/public/bindings/login_binding.dart';
import 'package:sufi_one/app/modules/public/bindings/register_binding.dart';
import 'package:sufi_one/app/modules/public/views/forgot_password_view.dart';
import 'package:sufi_one/app/modules/survey/bindings/mobile_survey_binding.dart';
import 'package:sufi_one/app/modules/survey/bindings/process_survey_binding.dart';
import 'package:sufi_one/app/modules/survey/views/finish_checking_view.dart';
import 'package:sufi_one/app/modules/survey/views/mobile_survey_view.dart';
import 'package:sufi_one/app/modules/public/views/home_view.dart';
import 'package:sufi_one/app/modules/public/views/homepage_cust_view.dart';
import 'package:sufi_one/app/modules/public/views/login_view.dart';
import 'package:sufi_one/app/modules/public/views/register_view.dart';
import 'package:sufi_one/app/modules/public/views/splash_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobile_collection_view.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobile_collection_binding.dart';
import 'package:sufi_one/app/modules/survey/views/newtask_confirm_view.dart';
import 'package:sufi_one/app/modules/survey/views/upload_checking_view.dart';
import 'package:sufi_one/app/modules/survey/views/process_survey_view.dart';
import 'package:sufi_one/app/modules/zeus/views/zeus_view.dart';
import 'package:sufi_one/app/modules/zeus/views/zeus_detail_view.dart';
import 'package:sufi_one/app/modules/zeus/bindings/zeus_binding.dart';
import 'package:sufi_one/app/modules/public/bindings/homepage_cust_binding.dart';
import 'package:sufi_one/app/modules/public/views/profile_page_view.dart';
import 'package:sufi_one/app/modules/public/bindings/profile_page_binding.dart';
import 'package:sufi_one/app/modules/public/views/profile_edit_view.dart';
import 'package:sufi_one/app/modules/public/views/promo_view.dart';
import 'package:sufi_one/app/modules/public/views/about_view.dart';
import 'package:sufi_one/app/modules/public/bindings/about_binding.dart';
import 'package:sufi_one/app/modules/public/views/contact_view.dart';
import 'package:sufi_one/app/modules/public/bindings/contact_binding.dart';

class AppRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const homepageCust = '/public/homepage_cust_view';
  static const mobileCollection = '/public/mobile_collection';
  static const mobileSurvey = '/public/mobile_survey';
  static const newtaskConfirm = '/public/mobile_survey/newtask';
  static const uploadChecking = '/public/mobile_survey/upload';
  static const finishChecking = '/public/mobile_survey/finish';
  static const processSurvey = '/public/mobile_survey/process';
  static const catalog = '/public/catalog';
  static const login = '/public/login';
  static const register = '/public/register';
  static const forgotPassword = '/public/forgot_password';
  static const zeus = '/public/zeus';
  static const zeusDetail = '/public/zeus_detail_view';
  static const profilePage = '/public/profile_page_view';
  static const profileEdit = '/public/profile_edit_view';
  static const promo = '/public/promo';
  static const about = '/public/about';
  static const contact = '/public/contact';

  static final pages = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: publicHome, page: () => PublicHomePage()),
    GetPage(
      name: homepageCust,
      page: () => const HomepageCustView(),
      binding: HomepageCustBinding(),
    ),
    GetPage(name: zeus, page: () => ZeusView(), binding: ZeusBinding()),
    GetPage(
      name: zeusDetail,
      page: () => const ZeusDetailView(),
      binding: ZeusBinding(),
    ),
    GetPage(name: mobileCollection, page: () => MobileCollection()),
    GetPage(
      name: mobileSurvey,
      page: () => MobileSurveyPage(),
      binding: MobileSurveyBinding(),
    ),
    GetPage(name: newtaskConfirm, page: () => NewtaskConfirmView()),
    GetPage(name: uploadChecking, page: () => UploadCheckingView()),
    GetPage(name: finishChecking, page: () => FinishCheckingView()),
    GetPage(
      name: processSurvey,
      page: () => ProcessSurveyView(),
      binding: ProcessSurveyBinding(),
    ),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
      name: register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.profilePage,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: AppRoutes.profileEdit,
      page: () => ProfileEditView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(name: AppRoutes.promo, page: () => const PromoView()),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
  ];
}
