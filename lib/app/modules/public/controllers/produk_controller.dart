import 'package:get/get.dart';

class ProdukController extends GetxController {
  final RxList<Map<String, String>> kategoriList =
      <Map<String, String>>[
        {'title': 'PASSENGER', 'image': 'res/images/produk/mobil3.png'},
        {'title': 'PICK UP', 'image': 'res/images/produk/carry.png'},
        {'title': 'MOTOR', 'image': 'res/images/produk/motor2.png'},
        {'title': 'OBM', 'image': 'res/images/produk/obm.png'},
      ].obs;

  final Map<String, List<Map<String, dynamic>>> produkData = {
    'PASSENGER': [
      {
        'name': 'Jimny',
        'price': 'Rp. 456.800.000',
        'image': 'res/images/produk/mobil1.png',
      },
      {
        'name': 'S-Presso',
        'price': 'Rp. 168.300.000',
        'image': 'res/images/produk/mobil6.png',
      },
      {
        'name': 'Baleno',
        'price': 'Rp. 265.500.000',
        'image': 'res/images/produk/mobil3.png',
      },
      {
        'name': 'XL7',
        'price': 'Rp. 256.100.000',
        'image': 'res/images/produk/mobil5.png',
      },
      {
        'name': 'APV',
        'price': 'Rp. 220.100.000',
        'image': 'res/images/produk/mobil7.png',
      },
      {
        'name': 'Ertiga',
        'price': 'Rp. 228.400.000',
        'image': 'res/images/produk/mobil2.png',
      },
    ],
    'PICK UP': [
      {
        'name': 'Carry Pick Up',
        'price': 'Rp. 159.100.000',
        'image': 'res/images/produk/carry.png',
      },
    ],
    'MOTOR': [
      {
        'name': 'Suzuki GSX R-150',
        'price': 'Rp. 30.600.000',
        'image': 'res/images/produk/motor8.png',
      },
      {
        'name': 'Suzuki GSX-S 150',
        'price': 'Rp. 27.400.000',
        'image': 'res/images/produk/motor1.png',
      },
      {
        'name': 'Satria F150',
        'price': 'Rp. 25.360.000',
        'image': 'res/images/produk/motor2.png',
      },
      {
        'name': 'Avenis 125',
        'price': 'Rp. 30.180.000',
        'image': 'res/images/produk/motor3.png',
      },
      {
        'name': 'NEX II',
        'price': 'Rp. 16.200.000',
        'image': 'res/images/produk/motor4.png',
      },
      {
        'name': 'ADDRESS',
        'price': 'Rp. 17.075.000',
        'image': 'res/images/produk/motor7.png',
      },
      {
        'name': 'VSTROM 250 SX',
        'price': 'Rp. 59.500.000',
        'image': 'res/images/produk/motor9.png',
      },
    ],
    'OBM': [
      {
        'name': 'Outboard Motor',
        'price': 'Rp. 336.600.000',
        'image': 'res/images/produk/obm.png',
      },
    ],
  };

  final RxString selectedKategori = ''.obs;
  final RxString selectedTipe = ''.obs;

  void setSelectedKategori(String kategori) {
    selectedKategori.value = kategori;
    selectedTipe.value = '';
  }

  void setSelectedTipe(String tipe) {
    selectedTipe.value = tipe;
  }

  List<Map<String, dynamic>> getTipeList() {
    return produkData[selectedKategori.value] ?? [];
  }

  Map<String, dynamic>? getProdukDetail() {
    if (selectedKategori.value.isNotEmpty && selectedTipe.value.isNotEmpty) {
      return produkData[selectedKategori.value]?.firstWhere(
        (item) => item['name'] == selectedTipe.value,
        orElse: () => <String, dynamic>{},
      );
    }
    return null;
  }

  void resetSelection() {
    selectedKategori.value = '';
    selectedTipe.value = '';
    kategoriList.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    print('Total Kategori Produk: ${kategoriList.length}');
  }
}
