import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  // Method untuk membuka URL eksternal
  void launchUrlExternal(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Tidak bisa membuka tautan: $url');
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
