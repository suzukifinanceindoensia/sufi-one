import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/routes/app_routes.dart';

class PromoView extends StatelessWidget {
  const PromoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> promoImages = [
      'res/images/suzuki_iklan1.jpg',
      'res/images/suzuki_iklan2.jpg',
      'res/images/suzuki_iklan3.jpg',
      'res/images/suzuki_iklan4.jpg',
      'res/images/suzuki_iklan3.jpg',
      'res/images/suzuki_iklan2.jpg',
    ];

    return Scaffold(
      appBar: SuzukiFinanceAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: promoImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(promoImages[index]),
            ),
          );
        },
      ),
    );
  }
}
