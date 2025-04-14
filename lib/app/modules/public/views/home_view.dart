import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicHomePage extends StatelessWidget {
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
                Get.toNamed('/public/catalog');
              },
              child: Text('Browse Catalog'),
            ),
          ],
        ),
      ),
    );
  }
}
