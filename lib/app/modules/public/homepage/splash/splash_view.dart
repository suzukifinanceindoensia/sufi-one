import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(HomeRoutes.mainnavigation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.splashStart, AppColors.splashEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              FractionallySizedBox(
                child: Image.asset('res/images/splashscreen.png'),
                widthFactor: 0.8,
              ),
              const SizedBox(height: 50),
              const CircularProgressIndicator(color: Colors.white),
              const Expanded(child: SizedBox()),
              FractionallySizedBox(
                child: Image.asset('res/images/ojk1.png'),
                widthFactor: 0.6,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
