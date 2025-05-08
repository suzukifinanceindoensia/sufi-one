import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sufi_one/app/modules/public/views/faq_view.dart';

class AboutController extends GetxController {
  // Method untuk membuka URL eksternal atau halaman WebView jika URL FAQ
  void launchUrlExternal(String url, {bool isFaq = false}) async {
    if (isFaq) {
      // Navigasi ke WebView untuk FAQ
      Get.to(() => FaqWebView());
    } else {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar('Error', 'Tidak bisa membuka tautan: $url');
      }
    }
  }

  // Method untuk membuka email
  void launchEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar('Error', 'Tidak bisa membuka email: $email');
    }
  }
}
