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
import 'package:sufi_one/app/modules/mobcol/dashboard/view/mobile_collection_view.dart';
import 'package:sufi_one/app/modules/mobcol/dashboard/binding/mobile_collection_binding.dart';
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
import 'package:sufi_one/app/modules/public/views/ubah_password_view.dart';
import 'package:sufi_one/app/modules/public/views/transaksi_point_view.dart';
import 'package:sufi_one/app/modules/public/views/produk_kategori_view.dart';
import 'package:sufi_one/app/modules/public/bindings/produk_binding.dart';
import 'package:sufi_one/app/modules/public/views/produk_tipe_view.dart';
import 'package:sufi_one/app/modules/public/views/produk_harga_view.dart';
import 'package:sufi_one/app/modules/public/views/produk_detail_view.dart';
import 'package:sufi_one/app/modules/public/views/pengajuan_kredit_view.dart';
import 'package:sufi_one/app/modules/public/bindings/pengajuan_kredit_binding.dart';
import 'package:sufi_one/app/modules/public/views/cabang_view.dart';
import 'package:sufi_one/app/modules/public/bindings/cabang_binding.dart';
import 'package:sufi_one/app/modules/public/views/simulasi_kredit_view.dart';
import 'package:sufi_one/app/modules/public/views/opsi_pembayaran_view.dart';
import 'package:sufi_one/app/modules/public/views/fasilitas_view.dart';

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
  static const profileEdit = '/public/profile_edit_view';
  static const promo = '/public/public/promo';
  static const about = '/public/public/about';
  static const contact = '/public/public/contact';
  static const ubahPassword = '/public/ubah-password';
  static const transaksiPoint = '/public/public/transaksi-point';
  static const pengajuanKredit = '/public/pengajuan-kredit';
  static const cabang = '/public/cabang';
  static const produkKategori = '/public/public/produk_kategori';
  static const produkTipe = '/public/public/produk_tipe';
  static const produkHarga = '/public/public/produk_harga';
  static const produkDetail = '/public/public/produk_detail';
  static const simulasiKredit = '/public/simulasi-kredit';
  static const opsiPembayaranAsuransi = '/public/opsi-pembayaran-asuransi';
  static const String fasilitasWebView = '/public/fasilitas-webview';

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
  ];
}
