import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBaru/binding/mobcol_detailcust_controller.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBaru/binding/mobcol_kunjungan_binding.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBaru/binding/mobcol_tugasbaru_binding.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBelumSelesai/binding/mobcol_tugasbelumselesai_bindings.dart';
import 'package:sufi_one/app/modules/mobcol/tugasSelesai/binding/mobcol_tugasselesai_binding.dart';
import 'package:sufi_one/app/modules/mobcol/uploadBukti/binding/mobcol_uploadbukti_binding.dart';
import 'package:sufi_one/app/modules/mobcol/uploadBukti/binding/mobcol_uploadbukti_detail_binding.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBaru/view/mobcol_detailcust_view.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBaru/view/mobcol_kunjungan_view.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBaru/view/mobcol_tugasbaru_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBaru/view/mobcol_tugasbaru_view.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBelumSelesai/view/mobcol_tugasbelumselesai_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/tugasBelumSelesai/view/mobcol_tugasbelumselesai_view.dart';
import 'package:sufi_one/app/modules/mobcol/tugasSelesai/view/mobcol_tugasselesai_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/uploadBukti/view/mobcol_uploadbukti_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/uploadBukti/view/mobcol_uploadbukti_view.dart';
import 'package:sufi_one/app/modules/mobcol/tugasSelesai/view/mobcol_tugasselesai_view.dart';
import 'package:sufi_one/app/modules/mobcol/dashboard/view/mobile_collection_view.dart';
import 'package:sufi_one/app/modules/mobcol/dashboard/binding/mobile_collection_binding.dart';
import 'package:sufi_one/app/modules/survey/survey_routes.dart';
import 'package:sufi_one/app/modules/zeus/views/zeus_view.dart';
import 'package:sufi_one/app/modules/zeus/views/zeus_detail_view.dart';
import 'package:sufi_one/app/modules/zeus/bindings/zeus_binding.dart';
import 'package:sufi_one/app/modules/public/homepage_public/widgets/home_routes.dart';

class AppRoutes {
  //MOBCOL
  static const mobileCollection = '/public/mobile_collection';
  static const survey = '/survey/splash';
  static const surveyHome = '/survey/home';
  static const mobileCollectionTugasBaru = '/mobile_collection/tugas_baru';
  static const mobileCollectionTugasBaruDetail =
      '/mobile_collection/tugas_baru/detail';
  static const mobileCollectionDetailCust =
      '/mobile_collection/tugas_baru/detail/customer';
  static const mobileCollectionKunjungan =
      '/mobile_collection/tugas_baru/kunjungan';
  static const mobileCollectionTugasBelumSelesai =
      '/mobile_collection/tugas_belum_selesai';
  static const mobileCollectionTugasBelumSelesaiDetail =
      '/mobile_collection/tugas_belum_selesai/detail';
  static const mobileCollectionUploadBukti = '/mobile_collection/upload_bukti';
  static const mobileCollectionUploadBuktiDetail =
      '/mobile_collection/upload_bukti/detail';
  static const mobileCollectionTugasSelesai =
      '/mobile_collection/tugas_selesai';
  static const mobileCollectionTugasSelesaiDetail =
      '/mobile_collection/tugas_selesai/detail';
  static const newtaskConfirm = '/public/mobile_survey/newtask';
  static const uploadChecking = '/public/mobile_survey/upload';
  static const finishChecking = '/public/mobile_survey/finish';
  static const processSurvey = '/public/mobile_survey/process';
  static const zeus = '/public/zeus';
  static const zeusDetail = '/public/zeus_detail_view';

  static final pages = [
    GetPage(name: zeus, page: () => ZeusView(), binding: ZeusBinding()),
    GetPage(
      name: zeusDetail,
      page: () => const ZeusDetailView(),
      binding: ZeusBinding(),
    ),
    GetPage(name: mobileCollection, page: () => MobileCollection()),
    // MOBILE COLLECTION
    GetPage(
      name: mobileCollection,
      page: () => MobileCollection(),
      binding: MobileCollectionBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasBaru,
      page: () => MobcolTugasbaruView(),
      binding: MobcolTugasbaruBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasBaruDetail,
      page: () => MobcolTugasbaruDetailView(),
    ),
    GetPage(
      name: mobileCollectionDetailCust,
      page: () => MobcolDetailCustView(),
      binding: MobcolDetailCustBinding(),
    ),
    GetPage(
      name: mobileCollectionKunjungan,
      page: () => MobcolKunjunganView(),
      binding: KunjunganBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasBelumSelesai,
      page: () => MobcolTugasbelumselesaiView(),
      binding: MobcolTugasbelumselesaiBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasBelumSelesaiDetail,
      page: () => MobcolTugasBelumSelesaiDetailView(),
    ),
    GetPage(
      name: mobileCollectionUploadBukti,
      page: () => MobcolUploadBuktiView(),
      binding: MobcolUploadbuktiBinding(),
    ),
    GetPage(
      name: mobileCollectionUploadBuktiDetail,
      page: () => MobcolUploadbuktiDetailView(),
      binding: MobcolUploadbuktiDetailBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasSelesai,
      page: () => MobcolTugasSelesaiView(),
      binding: MobcolTugasSelesaiBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasSelesaiDetail,
      page: () => MobcolTugasselesaiDetailView(),
    ),

    // --------------------------------------------------------------------------------------------------------------------------------//
    ...SurveyRoutes.routes,
    ...HomeRoutes.routes,
  ];
}
