import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/controllers/about_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sufi_one/app/modules/public/widgets/bottomnavbar.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final AboutController controller = Get.put(AboutController());
  String? strVersion;

  Future<void> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    strVersion = packageInfo.version;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset('res/images/sufismart.png', height: 100, width: 100),
            const SizedBox(height: 10),
            Text(
              'Sufi-One',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              'Versi: ${strVersion ?? "-"}',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _sosmedIcon(
                  FontAwesomeIcons.instagram,
                  Colors.pink,
                  'https://www.instagram.com/sfigroup.id/',
                ),
                _sosmedIcon(
                  FontAwesomeIcons.whatsapp,
                  Colors.green,
                  'https://api.whatsapp.com/send?phone=6281119209998&text=Hello%20saya%20mau%20tanya%20',
                ),
                _sosmedIcon(
                  FontAwesomeIcons.youtube,
                  Colors.red,
                  'https://youtube.com/@suzukifinance?si=i_SKnZW3bhxAw8WP',
                ),
                _sosmedIcon(
                  FontAwesomeIcons.twitter,
                  Colors.blue,
                  'https://twitter.com/yourpage',
                ),
                _sosmedIcon(
                  FontAwesomeIcons.facebook,
                  Colors.indigo,
                  'https://www.facebook.com/suzukifinanceindonesia',
                ),
              ],
            ),
            const SizedBox(height: 30),
            _infoTile('Call Center', '(021)80607000', () {
              controller.launchUrlExternal('tel: 02180607000');
            }),
            _infoTile('Email', 'customercare@sfi.co.id', () {
              controller.launchEmail('customercare@sfi.co.id');
            }),
            _infoTile('Website', 'https://www.sfi.co.id/', () {
              controller.launchUrlExternal('https://www.sfi.co.id/');
            }),
            _infoTileWithIcon('Komunitas', FontAwesomeIcons.users, () {
              controller.launchUrlExternal('https://komunitas.example.com');
            }),
            _infoTileWithIcon('FAQ', FontAwesomeIcons.chevronRight, () {
              controller.launchUrlExternal(
                'https://faq.example.com',
                isFaq: true,
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 1),
    );
  }

  Widget _infoTile(String title, String value, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, color: AppColors.iconDefault),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 16, color: AppColors.snack),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _infoTileWithIcon(String title, IconData icon, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, color: AppColors.iconDefault),
              ),
              Icon(icon, color: AppColors.snack),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _sosmedIcon(IconData icon, Color color, String url) {
    return GestureDetector(
      onTap: () => controller.launchUrlExternal(url),
      child: Icon(icon, color: color, size: 30),
    );
  }
}
