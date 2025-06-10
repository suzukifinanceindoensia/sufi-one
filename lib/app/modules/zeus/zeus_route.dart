import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/binding/detailnopol_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/binding/fotonopol_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/view/detailnopol_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/binding/ceknopol_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/view/ceknopol_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/view/fotonopol_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/dashboard/binding/zeusdashboard_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/dashboard/view/dashboardHome_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/taskAssign/binding/taskAssign_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/taskAssign/view/taskAssign_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/cetak_skmbj/bindings/cetak_skmbj_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/cetak_skmbj/views/cetak_skmbj_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/cetak_stmbj/bindings/cetak_stmbj_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/cetak_stmbj/views/cetak_stmbj_view.dart';

class ZeusRoute {
  static const zeusdashboard = '/zeus';
  static const ceknopol = '/zeus/ceknopol';
  static const fotonopol = '/zeus/fotonopol';
  static const detailnopol = '/zeus/nopol/detail';
  static const taskassign = '/zeus/taskassign';
  static const cetakSkmbj = '/zeus/cetak-skmbj';
  static const cetakStmbj = '/zeus/cetak-stmbj';

  static final routes = [
    GetPage(
      name: ZeusRoute.zeusdashboard,
      page: () => const ZeusDashboardView(),
      binding: ZeusDashboardBinding(),
    ),
    GetPage(
      name: ZeusRoute.ceknopol,
      page: () => const CeknopolView(),
      binding: CeknopolBinding(),
    ),
    GetPage(
      name: ZeusRoute.fotonopol,
      page: () => const FotoNopolView(),
      binding: FotoNopolBingding(),
    ),
    GetPage(
      name: ZeusRoute.detailnopol,
      page: () => const DetailnopolView(),
      binding: DetailnopolBinding(),
    ),
    GetPage(
      name: ZeusRoute.taskassign,
      page: () => const TaskAssignView(),
      binding: TaskAssignBinding(),
    ),
    GetPage(
      name: ZeusRoute.cetakSkmbj,
      page: () => CetakSkmbjView(),
      binding: CetakSkmbjBinding(),
    ),
    GetPage(
      name: cetakStmbj,
      page: () => CetakStmbjView(),
      binding: CetakStmbjBinding(),
    ),
  ];
}
