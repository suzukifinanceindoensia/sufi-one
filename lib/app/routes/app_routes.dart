import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobcol_detailcust_controller.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobcol_kunjungan_binding.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobcol_tugasbaru_binding.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobcol_tugasbelumselesai_bindings.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobcol_tugasselesai_binding.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobcol_uploadbukti_binding.dart';
import 'package:sufi_one/app/modules/mobcol/bindings/mobcol_uploadbukti_detail_binding.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_detailcust_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_kunjungan_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_tugasbaru_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_tugasbaru_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_tugasbelumselesai_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_tugasbelumselesai_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_tugasselesai_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_uploadbukti_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_uploadbukti_view.dart';
import 'package:sufi_one/app/modules/mobcol/views/mobcol_tugasselesai_view.dart';
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

class AppRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const homepageCust = '/public/homepage_cust_view';
  //MOBCOL
  static const mobileCollection = '/public/mobile_collection';
  static const mobileCollectionTugasBaru = '/mobile_collection/tugas_baru'; 
  static const mobileCollectionTugasBaruDetail = '/mobile_collection/tugas_baru/detail'; 
  static const mobileCollectionDetailCust = '/mobile_collection/tugas_baru/detail/customer';
  static const mobileCollectionKunjungan = '/mobile_collection/tugas_baru/kunjungan';
  static const mobileCollectionTugasBelumSelesai = '/mobile_collection/tugas_belum_selesai';
  static const mobileCollectionTugasBelumSelesaiDetail = '/mobile_collection/tugas_belum_selesai/detail';
  static const mobileCollectionUploadBukti = '/mobile_collection/upload_bukti';
  static const mobileCollectionUploadBuktiDetail = '/mobile_collection/upload_bukti/detail';
  static const mobileCollectionTugasSelesai = '/mobile_collection/tugas_selesai';
  static const mobileCollectionTugasSelesaiDetail = '/mobile_collection/tugas_selesai/detail';
  //MOBILE SURVEY
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
  static const profileEdit =
      '/public/profile_edit_view'; // Add Profile Edit route

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
    // MOBILE COLLECTION
    GetPage(name: mobileCollection, page: () => MobileCollection(), binding: MobileCollectionBinding()),
    GetPage(name: mobileCollectionTugasBaru, page: () => MobcolTugasbaruView(),binding: MobcolTugasbaruBinding()),
    GetPage(name: mobileCollectionTugasBaruDetail, page: () => MobcolTugasbaruDetailView()),
    GetPage(name: mobileCollectionDetailCust, page: () => MobcolDetailCustView(), binding: MobcolDetailCustBinding()),
    GetPage(name: mobileCollectionKunjungan, page: () => MobcolKunjunganView(), binding: KunjunganBinding()),
    GetPage(name: mobileCollectionTugasBelumSelesai, page: () => MobcolTugasbelumselesaiView(), binding: MobcolTugasbelumselesaiBinding()),
    GetPage(name: mobileCollectionTugasBelumSelesaiDetail, page: () => MobcolTugasBelumSelesaiDetailView()),
    GetPage(name: mobileCollectionUploadBukti, page: () => MobcolUploadBuktiView(), binding: MobcolUploadbuktiBinding()),
    GetPage(name: mobileCollectionUploadBuktiDetail, page: () => MobcolUploadbuktiDetailView(), binding: MobcolUploadbuktiDetailBinding()),
    GetPage(name: mobileCollectionTugasSelesai, page: () => MobcolTugasSelesaiView(), binding: MobcolTugasSelesaiBinding()),
    GetPage(name: mobileCollectionTugasSelesaiDetail, page: () => MobcolTugasselesaiDetailView()),
    // --------------------------------------------------------------------------------------------------------------------------------//
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
  ];
}
