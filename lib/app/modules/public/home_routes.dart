import 'package:get/get.dart';

// Auth
import 'package:sufi_one/app/bindings/auth_binding.dart';

// Login & Register
import 'package:sufi_one/app/modules/public/login/views/login_view.dart';
import 'package:sufi_one/app/modules/public/login/views/register_view.dart';
import 'package:sufi_one/app/modules/public/login/views/forgot_password_view.dart';
import 'package:sufi_one/app/modules/public/login/bindings/login_binding.dart';
import 'package:sufi_one/app/modules/public/login/bindings/register_binding.dart';
import 'package:sufi_one/app/modules/public/login/bindings/forgot_password_binding.dart';

// Homepage
import 'package:sufi_one/app/modules/public/homepage/splash/splash_view.dart';
import 'package:sufi_one/app/modules/public/homepage/views/home_view.dart';
import 'package:sufi_one/app/modules/public/homepage/views/homepage_cust_view.dart';
import 'package:sufi_one/app/modules/public/homepage/views/promo_view.dart';
import 'package:sufi_one/app/modules/public/homepage/bindings/homepage_cust_binding.dart';

// Profile Page
import 'package:sufi_one/app/modules/public/profile_page/views/profile_page_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/profile_edit_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/ubah_password_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/views/transaksi_point_view.dart';
import 'package:sufi_one/app/modules/public/profile_page/bindings/profile_page_binding.dart';

// About & Contact
import 'package:sufi_one/app/modules/public/about/views/about_view.dart';
import 'package:sufi_one/app/modules/public/about/views/contact_view.dart';
import 'package:sufi_one/app/modules/public/about/bindings/about_binding.dart';
import 'package:sufi_one/app/modules/public/about/bindings/contact_binding.dart';

// Produk
import 'package:sufi_one/app/modules/public/produk/views/produk_kategori_view.dart';
import 'package:sufi_one/app/modules/public/produk/views/produk_tipe_view.dart';
import 'package:sufi_one/app/modules/public/produk/views/produk_harga_view.dart';
import 'package:sufi_one/app/modules/public/produk/views/produk_detail_view.dart';
import 'package:sufi_one/app/modules/public/produk/bindings/produk_binding.dart';

// Cabang
import 'package:sufi_one/app/modules/public/cabang/views/cabang_view.dart';
import 'package:sufi_one/app/modules/public/cabang/bindings/cabang_binding.dart';

// WebView
import 'package:sufi_one/app/services/generic_webview.dart';

// main navigation
import 'package:sufi_one/app/services/main_navigation/MainNavigationView.dart';
import 'package:sufi_one/app/services/main_navigation/main_navigation_binding.dart';

class HomeRoutes {
  static const splash = '/';
  static const publicHome = '/public/home';
  static const homepageCust = '/public/homepage/homepage_cust_view';

  static const login = '/public/profile_page/login';
  static const registerpage = '/public/profile_page/register';
  static const forgotPassword = '/public/profile_page/forgot_password';
  static const resetpassword = '/public/login/reset_password';

  static const profilePage = '/public/profile_page/profile_page_view';
  static const profileEdit = '/public/profile_page/profile_edit_view';
  static const ubahPassword = '/public/profile_page/ubah-password';
  static const transaksiPoint = '/public/profile_page/transaksi-point';

  static const promo = '/public/homepage/promo';
  static const about = '/public/about';
  static const contact = '/public/about/contact';

  static const produkKategori = '/public/produk/produk_kategori';
  static const produkTipe = '/public/produk/produk_tipe';
  static const produkHarga = '/public/produk/produk_harga';
  static const produkDetail = '/public/produk/produk_detail';

  static const cabang = '/public/cabang';
  static const genericWebView = '/public/webview';

  static const mainnavigation = '/public/main_navigation';

  static final routes = [
    GetPage(name: splash, page: () => SplashPage(), binding: AuthBinding()),

    // Home
    GetPage(name: publicHome, page: () => PublicHomePage()),
    GetPage(
      name: homepageCust,
      page: () => const HomepageCustView(),
      bindings: [AuthBinding(), HomepageCustBinding()],
    ),

    // Auth & Login
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
      name: registerpage,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),

    // Profile
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

    // Promo
    GetPage(name: promo, page: () => const PromoView()),

    // About & Contact
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

    // Produk
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

    // Cabang
    GetPage(name: cabang, page: () => CabangView(), binding: CabangBinding()),

    // WebView
    GetPage(name: genericWebView, page: () => const GenericWebView()),

    // main navigation
    GetPage(
      name: mainnavigation,
      page: () => MainNavigationView(),
      binding: MainNavigationBinding(),
    ),
  ];
}
