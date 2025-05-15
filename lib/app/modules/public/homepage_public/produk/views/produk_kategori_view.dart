import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/homepage_public/produk/controllers/produk_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/modules/public/homepage_public/produk/views/produk_tipe_view.dart';

class ProdukKategoriView extends StatefulWidget {
  @override
  State<ProdukKategoriView> createState() => _ProdukKategoriViewState();
}

class _ProdukKategoriViewState extends State<ProdukKategoriView> {
  final ProdukController controller = Get.put(ProdukController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(child: AppSidebar()),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 16 / 9,
        ),
        itemCount: controller.kategoriList.length,
        itemBuilder: (context, index) {
          final kategori = controller.kategoriList[index];
          return GestureDetector(
            onTap: () {
              controller.selectedKategori.value = kategori['title']!;
              Get.to(() => ProdukTipeView());
            },
            child: Card(
              color: AppColors.bg1,
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(kategori['image']!, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      kategori['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
