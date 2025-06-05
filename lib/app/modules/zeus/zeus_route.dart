import 'package:get/get.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/binding/detailnopol_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/view/detailnopol_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/binding/ceknopol_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/collectionTrack/view/ceknopol_view.dart';
import 'package:sufi_one/app/modules/zeus/feature/taskAssign/binding/taskAssign_binding.dart';
import 'package:sufi_one/app/modules/zeus/feature/taskAssign/view/taskAssign_view.dart';

class ZeusRoute {
  static const ceknopol = '/zeus/ceknopol';
  static const detailnopol = '/zeus/ceknopol/detail';
  static const taskassign = '/zeus/taskassign';

  static final routes = [
    GetPage(
      name: ZeusRoute.ceknopol,
      page: () => const CeknopolView(),
      binding: CeknopolBinding(),
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
  ];
}

