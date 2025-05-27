import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/homepage/models/homepage_model.dart';
import 'package:sufi_one/app/modules/public/home_routes.dart';

class HomepageCustController extends GetxController {
  var currentPage = 0.obs;
  Timer? _timer;

  List<ImageContentModel> bannerImages = [
    ImageContentModel(imagePath: 'res/images/suzuki_iklan1.jpg'),
    ImageContentModel(imagePath: 'res/images/suzuki_iklan2.jpg'),
    ImageContentModel(imagePath: 'res/images/suzuki_iklan3.jpg'),
    ImageContentModel(imagePath: 'res/images/suzuki_iklan4.jpg'),
  ];

  List<ImageContentModel> newsImages = [
    ImageContentModel(imagePath: 'res/images/suzuki_iklan1.jpg'),
    ImageContentModel(imagePath: 'res/images/suzuki_iklan4.jpg'),
    ImageContentModel(imagePath: 'res/images/suzuki_iklan2.jpg'),
    ImageContentModel(imagePath: 'res/images/suzuki_iklan5.jpg'),
    ImageContentModel(imagePath: 'res/images/suzuki_iklan3.jpg'),
  ];

  List<MenuItemModel> menuItems = [
    MenuItemModel(
      iconPath: 'res/images/ic_icon_wop.png',
      label: 'Promo',
      route: HomeRoutes.promo,
    ),
    MenuItemModel(
      iconPath: 'res/images/ic_icon_product.png',
      label: 'Produk',
      route: HomeRoutes.produkKategori,
    ),
    MenuItemModel(
      iconPath: 'res/images/ic_icon_credit_simulation.png',
      label: 'Simulasi Kredit',
      route: HomeRoutes.simulasiKredit,
    ),
    MenuItemModel(
      iconPath: 'res/images/ic_icon_promo.png',
      label: 'Fasilitas',
      route: HomeRoutes.fasilitasWebView,
    ),
    MenuItemModel(
      iconPath: 'res/images/ic_icon_branch.png',
      label: 'Cabang',
      route: HomeRoutes.cabang,
    ),
    MenuItemModel(
      iconPath: 'res/images/ic_icon_installment_status.png',
      label: 'Opsi Pembayaran & Asuransi',
      route: HomeRoutes.opsiPembayaranAsuransi,
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void startAutoSlide(PageController pageController) {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!pageController.hasClients) return;
      final nextPage = (currentPage.value + 1) % bannerImages.length;
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
