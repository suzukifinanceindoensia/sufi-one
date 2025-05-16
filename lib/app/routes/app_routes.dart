import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/mobcol_routes.dart';
import 'package:sufi_one/app/modules/survey/survey_routes.dart';
import 'package:sufi_one/app/modules/zeus/views/zeus_view.dart';
import 'package:sufi_one/app/modules/zeus/views/zeus_detail_view.dart';
import 'package:sufi_one/app/modules/zeus/bindings/zeus_binding.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';

class AppRoutes {
  //MOBCOL
  static const mobileCollection = '/mobile_collection';
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
    GetPage(
      name: AppRoutes.ubahPassword,
      page: () => const UbahPasswordView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: AppRoutes.transaksiPoint,
      page: () => TransaksiPointView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: produkKategori,
      page: () => ProdukKategoriView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: produkTipe,
      page: () => ProdukTipeView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: produkHarga,
      page: () => ProdukHargaView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: produkDetail,
      page: () => ProdukDetailView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: AppRoutes.pengajuanKredit,
      page: () => PengajuanKreditView(),
      binding: PengajuanKreditBinding(),
    ),
    GetPage(
      name: AppRoutes.cabang,
      page: () => CabangView(),
      binding: CabangBinding(),
    ),
    GetPage(
      name: AppRoutes.simulasiKredit,
      page: () => const SimulasiKreditView(),
    ),
    GetPage(
      name: AppRoutes.opsiPembayaranAsuransi,
      page: () => const OpsiPembayaranAsuransiView(),
    ),
    GetPage(
      name: AppRoutes.fasilitasWebView,
      page: () => const FasilitasWebView(),
    ),
    ...SurveyRoutes.routes,
    ...HomeRoutes.routes,
    ...MobcolRoutes.routes,
  ];
}
