import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarColor {
  static const Color background = Color.fromRGBO(245, 245, 245, 1);
  static const Color icon = Color.fromRGBO(0, 38, 113, 1); // alpha 1.0 = 100%
}

class PublicHomePage extends StatefulWidget {
  const PublicHomePage({super.key});

  @override
  State<PublicHomePage> createState() => _PublicHomePageState();
}

class _PublicHomePageState extends State<PublicHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Produk')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Akun')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Welcome to SuperApp')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Public Home - No Login Required'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/public/homepage_cust_view');
              },
              child: Text('Browse Catalog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/public/login');
              },
              child: Text('Cobain Login'),
            ),
          ],
        ),

      ),
    );
  }
}
