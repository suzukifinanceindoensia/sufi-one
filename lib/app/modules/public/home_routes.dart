import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/profile_page/bindings/forgot_password_binding.dart';
import 'package:sufi_one/app/modules/public/profile_page/bindings/login_binding.dart';
import 'package:sufi_one/app/modules/public/profile_page/bindings/register_binding.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/forgot_password_view.dart';
import 'package:sufi_one/app/modules/public/homepage/views/home_view.dart';
import 'package:sufi_one/app/modules/public/homepage/views/homepage_cust_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/login_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/register_view.dart';
import 'package:sufi_one/app/modules/public/homepage/splash/splash_view.dart';
import 'package:sufi_one/app/modules/public/homepage/bindings/homepage_cust_binding.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/profile_page_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/bindings/profile_page_binding.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/profile_edit_view.dart';
import 'package:sufi_one/app/modules/public/homepage/views/promo_view.dart';
import 'package:sufi_one/app/modules/public/about/views/about_view.dart';
import 'package:sufi_one/app/modules/public/about/bindings/about_binding.dart';
import 'package:sufi_one/app/modules/public/about/views/contact_view.dart';
import 'package:sufi_one/app/modules/public/about/bindings/contact_binding.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/ubah_password_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/transaksi_point_view.dart';
import 'package:sufi_one/app/modules/public/produk/views/produk_kategori_view.dart';
import 'package:sufi_one/app/modules/public/produk/bindings/produk_binding.dart';
import 'package:sufi_one/app/modules/public/produk/views/produk_tipe_view.dart';
import 'package:sufi_one/app/modules/public/produk/views/produk_harga_view.dart';
import 'package:sufi_one/app/modules/public/produk/views/produk_detail_view.dart';
import 'package:sufi_one/app/modules/public/webview/views/pengajuan_kredit_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/bindings/pengajuan_kredit_binding.dart';
import 'package:sufi_one/app/modules/public/cabang/views/cabang_view.dart';
import 'package:sufi_one/app/modules/public/cabang/bindings/cabang_binding.dart';
import 'package:sufi_one/app/modules/public/webview/views/simulasi_kredit_view.dart';
import 'package:sufi_one/app/modules/public/webview/views/opsi_pembayaran_view.dart';
import 'package:sufi_one/app/modules/public/webview/views/fasilitas_view.dart';

class HomeRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const homepageCust = '/public/homepage_cust_view';
  static const catalog = '/public/catalog';
  static const login = '/public/login';
  static const register = '/public/register';
  static const forgotPassword = '/public/forgot_password';
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

  static final routes = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: publicHome, page: () => PublicHomePage()),
    GetPage(
      name: homepageCust,
      page: () => const HomepageCustView(),
      binding: HomepageCustBinding(),
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
      name: profilePage,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: profileEdit,
      page: () => ProfileEditView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(name: promo, page: () => const PromoView()),
    GetPage(
      name: about,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: contact,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: ubahPassword,
      page: () => const UbahPasswordView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: transaksiPoint,
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
      name: pengajuanKredit,
      page: () => PengajuanKreditView(),
      binding: PengajuanKreditBinding(),
    ),
    GetPage(name: cabang, page: () => CabangView(), binding: CabangBinding()),
    GetPage(name: simulasiKredit, page: () => const SimulasiKreditView()),
    GetPage(
      name: opsiPembayaranAsuransi,
      page: () => const OpsiPembayaranAsuransiView(),
    ),
    GetPage(name: fasilitasWebView, page: () => const FasilitasWebView()),
  ];
}
