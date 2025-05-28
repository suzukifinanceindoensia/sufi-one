import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sufi_one/app/modules/public/about/models/about_icon_item_model.dart';
import 'package:sufi_one/app/modules/public/about/models/contact_info_model.dart';
import 'package:sufi_one/app/modules/public/about/models/social_media_model.dart';
import 'package:sufi_one/app/modules/public/about/views/faq_view.dart';

class AboutController extends GetxController {
  // List kontak info
  List<ContactInfo> contactInfos = [];
  List<AboutIconItemModel> iconItems = [];
  List<SocialMediaModel> socialMediaItems = [];

  @override
  void onInit() {
    super.onInit();
    setupItems();
  }

  void setupItems() {
    contactInfos = [
      ContactInfo(
        title: 'Call Center',
        value: '(021)80607000',
        onTap: () => launchUrlExternal('tel:02180607000'),
      ),
      ContactInfo(
        title: 'Email',
        value: 'customercare@sfi.co.id',
        onTap: () => launchEmail('customercare@sfi.co.id'),
      ),
      ContactInfo(
        title: 'Website',
        value: 'https://www.sfi.co.id/',
        onTap: () => launchUrlExternal('https://www.sfi.co.id/'),
      ),
    ];

    iconItems = [
      AboutIconItemModel(
        title: 'Komunitas',
        icon: FontAwesomeIcons.users,
        onTap: () => launchUrlExternal('https://komunitas.example.com'),
      ),
      AboutIconItemModel(
        title: 'FAQ',
        icon: FontAwesomeIcons.chevronRight,
        onTap: () => launchUrlExternal('https://faq.example.com', isFaq: true),
      ),
    ];

    socialMediaItems = [
      SocialMediaModel(
        icon: FontAwesomeIcons.instagram,
        color: Colors.pink,
        url: 'https://www.instagram.com/sfigroup.id/',
      ),
      SocialMediaModel(
        icon: FontAwesomeIcons.whatsapp,
        color: Colors.green,
        url:
            'https://api.whatsapp.com/send?phone=6281119209998&text=Hello%20saya%20mau%20tanya%20',
      ),
      SocialMediaModel(
        icon: FontAwesomeIcons.youtube,
        color: Colors.red,
        url: 'https://youtube.com/@suzukifinance?si=i_SKnZW3bhxAw8WP',
      ),
      SocialMediaModel(
        icon: FontAwesomeIcons.twitter,
        color: Colors.blue,
        url: 'https://twitter.com/yourpage',
      ),
      SocialMediaModel(
        icon: FontAwesomeIcons.facebook,
        color: Colors.indigo,
        url: 'https://www.facebook.com/suzukifinanceindonesia',
      ),
    ];
  }

  /// Method untuk membuka URL eksternal atau WebView jika FAQ
  void launchUrlExternal(String url, {bool isFaq = false}) async {
    if (isFaq) {
      Get.to(() => FaqWebView());
    } else {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar('Error', 'Tidak bisa membuka tautan: $url');
      }
    }
  }

  /// Method untuk membuka aplikasi email
  void launchEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar('Error', 'Tidak bisa membuka email: $email');
    }
  }
}
