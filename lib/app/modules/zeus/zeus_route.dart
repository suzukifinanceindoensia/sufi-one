import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/zeusdetail/bindings/zeusdetail_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/zeusdetail/views/zeusdetail_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/zeushome/bindings/zeus_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/zeushome/views/zeus_view.dart';

class ZeusRoute {
  static const zeus = '/zeus';
  static const zeusDetail = '/zeus/detail';

  static final routes = [
    GetPage(
      name: ZeusRoute.zeus,
      page: () => const ZeusView(),
      binding: ZeusBinding(),
    ),
    GetPage(
      name: ZeusRoute.zeusDetail,
      page: () => const DetailZeusView(),
      binding: DetailZeusBinding(),
    ),
  ];
}

