import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/feature/dashboard/binding/mobile_collection_binding.dart';
import 'package:sufi_one/app/modules/mobcol/feature/dashboard/view/mobile_collection_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/binding/mobcol_detailcust_binding.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/binding/mobcol_kunjungan_binding.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/binding/mobcol_tugasbaru_binding.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/view/mobcol_detailcust_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/view/mobcol_kunjungan_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/view/mobcol_tugasbaru_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBaru/view/mobcol_tugasbaru_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBelumSelesai/binding/mobcol_tugasbelumselesai_bindings.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBelumSelesai/view/mobcol_tugasbelumselesai_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasBelumSelesai/view/mobcol_tugasbelumselesai_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasSelesai/binding/mobcol_tugasselesai_binding.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasSelesai/view/mobcol_tugasselesai_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/tugasSelesai/view/mobcol_tugasselesai_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/uploadBukti/binding/mobcol_uploadbukti_binding.dart';
import 'package:sufi_one/app/modules/mobcol/feature/uploadBukti/binding/mobcol_uploadbukti_detail_binding.dart';
import 'package:sufi_one/app/modules/mobcol/feature/uploadBukti/view/mobcol_uploadbukti_detail_view.dart';
import 'package:sufi_one/app/modules/mobcol/feature/uploadBukti/view/mobcol_uploadbukti_view.dart';

class MobcolRoutes {
  
  static const mobileCollection = '/mobile_collection';
  static const mobileCollectionTugasBaru = '/mobile_collection/tugas_baru';
  static const mobileCollectionTugasBaruDetail =
   '/mobile_collection/tugas_baru/detail';
  static const mobileCollectionDetailCust =
      '/mobile_collection/tugas_baru/detail/customer';
  static const mobileCollectionKunjungan =
      '/mobile_collection/tugas_baru/kunjungan';
  static const mobileCollectionTugasBelumSelesai =
      '/mobile_collection/tugas_belum_selesai';
  static const mobileCollectionTugasBelumSelesaiDetail =
      '/mobile_collection/tugas_belum_selesai/detail';
  static const mobileCollectionUploadBukti = '/mobile_collection/upload_bukti';
  static const mobileCollectionUploadBuktiDetail =
      '/mobile_collection/upload_bukti/detail';
  static const mobileCollectionTugasSelesai =
      '/mobile_collection/tugas_selesai';
  static const mobileCollectionTugasSelesaiDetail =
      '/mobile_collection/tugas_selesai/detail';

  static final routes = [
    GetPage(
      name: mobileCollection,
      page: () => MobcolDashboardView(),
      binding: MobcolDashboardBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasBaru,
      page: () => MobcolTugasbaruView(),
      binding: MobcolTugasbaruBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasBaruDetail,
      page: () => MobcolTugasbaruDetailView(),
    ),
    GetPage(
      name: mobileCollectionDetailCust,
      page: () => MobcolDetailCustView(),
      binding: MobcolDetailCustBinding(),
    ),
    GetPage(
      name: mobileCollectionKunjungan,
      page: () => MobcolKunjunganView(),
      binding: KunjunganBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasBelumSelesai,
      page: () => MobcolTugasbelumselesaiView(),
      binding: MobcolTugasbelumselesaiBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasBelumSelesaiDetail,
      page: () => MobcolTugasBelumSelesaiDetailView(),
    ),
    GetPage(
      name: mobileCollectionUploadBukti,
      page: () => MobcolUploadBuktiView(),
      binding: MobcolUploadbuktiBinding(),
    ),
    GetPage(
      name: mobileCollectionUploadBuktiDetail,
      page: () => MobcolUploadbuktiDetailView(),
      binding: MobcolUploadbuktiDetailBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasSelesai,
      page: () => MobcolTugasSelesaiView(),
      binding: MobcolTugasSelesaiBinding(),
    ),
    GetPage(
      name: mobileCollectionTugasSelesaiDetail,
      page: () => MobcolTugasselesaiDetailView(),
    ),
  ];
}
