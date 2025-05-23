import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageCustController extends GetxController {
  var currentPage = 0.obs;
  Timer? _timer;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void startAutoSlide(PageController pageController) {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!pageController.hasClients) return;

      final nextPage = (currentPage.value + 1) % 4;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
