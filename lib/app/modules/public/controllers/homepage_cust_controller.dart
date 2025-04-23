import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageCustController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _autoSlide();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void _autoSlide() {
    Future(() async {
      while (true) {
        await Future.delayed(const Duration(seconds: 3));
        if (!pageController.hasClients) continue;

        final nextPage = (currentPage.value + 1) % 4;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        currentPage.value = nextPage;
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
