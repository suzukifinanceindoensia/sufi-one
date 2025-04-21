import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/mobcol/controllers/mobile_collection_controller.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class MobileCollection extends StatelessWidget {
  const MobileCollection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MobileCollectionController());

    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: AppBar(
        backgroundColor: AppColors.snack,
        centerTitle: false,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('res/images/logo_suzuki.png', height: 40),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Suzuki Finance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.bg1,
                  ),
                ),
                Text(
                  'Kredit Resmi Suzuki',
                  style: TextStyle(fontSize: 14, color: AppColors.bg1),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => ElevatedButton(
                    onPressed: () => controller.toggleView(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          controller.showCustomerInfo.value
                              ? AppColors.snack
                              : AppColors.bg1,
                      foregroundColor:
                          controller.showCustomerInfo.value
                              ? AppColors.bg1
                              : AppColors.iconDefault,
                    ),
                    child: const Text('Customer Info'),
                  ),
                ),
                const SizedBox(width: 8),
                Obx(
                  () => ElevatedButton(
                    onPressed: () => controller.toggleView(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !controller.showCustomerInfo.value
                              ? AppColors.snack
                              : AppColors.bg1,
                      foregroundColor:
                          !controller.showCustomerInfo.value
                              ? AppColors.bg1
                              : AppColors.iconDefault,
                    ),
                    child: const Text('Collection Form'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(
              () =>
                  controller.showCustomerInfo.value
                      ? buildCustomerInfo(controller)
                      : buildCollectionForm(controller),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.snack,
        selectedItemColor: AppColors.bg1,
        unselectedItemColor: AppColors.bg1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_device_information),
            label: 'About',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget buildCustomerInfo(MobileCollectionController controller) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg1,
        boxShadow: [
          BoxShadow(
            color: AppColors.bg3,
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Customer Info',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          buildCustomerCard(),
          const SizedBox(height: 16),
          buildTextField('Alamat', 'Value'),
          buildTextField('No Telepon', 'Value'),
          buildTextField('Tanggal Janji Tempo', 'Value'),
          buildTextField('Angsuran Ke', 'Value'),
          buildTextField('Keterangan', 'Value'),
          buildTextField('Deskripsi Keterlambatan', 'Value'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: controller.submitCustomerInfo,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.button,
              foregroundColor: AppColors.bg1,
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildCollectionForm(MobileCollectionController controller) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg1,
        boxShadow: [
          BoxShadow(
            color: AppColors.bg3,
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Mobile Collection System',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          buildCustomerCard(),
          const SizedBox(height: 16),
          const Text(
            'Foto Lokasi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'res/images/lokasi_foto.jpg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          buildDropdown(
            'Apakah Bertemu Dengan Customer?',
            ['Ya', 'Tidak'],
            controller.isMeetCustomer,
            (value) => controller.updateDropdownValue('meetCustomer', value),
          ),
          buildDropdown(
            'Alamat yang Dikunjungi?',
            ['Alamat KTP', 'Alamat Rumah'],
            controller.visitedAddress,
            (value) => controller.updateDropdownValue('visitedAddress', value),
          ),
          buildDropdown(
            'Apakah Alamat Berubah',
            ['Tidak', 'Ya'],
            controller.isAddressChanged,
            (value) => controller.updateDropdownValue('addressChanged', value),
          ),
          buildDropdown(
            'Apakah Unit Ada?',
            ['Ya', 'Tidak'],
            controller.isUnitAvailable,
            (value) => controller.updateDropdownValue('unitAvailable', value),
          ),
          buildDropdown(
            'Apakah Customer Akan Membayar?',
            ['Ya', 'Tidak'],
            controller.willCustomerPay,
            (value) => controller.updateDropdownValue('customerWillPay', value),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bg2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfoRow('Tagihan Perbulan:', 'Rp 3.344.000'),
                buildInfoRow('Tagihan:', 'Rp 3.344.000'),
                buildInfoRow('Total Tagihan:', 'Rp 3.344.000'),
                buildInfoRow('Jumlah Pembayaran:', 'Rp 0'),
                buildInfoRow('Sisa Tagihan:', 'Rp 3.344.000'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: controller.submitCollectionForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.bg3,
              foregroundColor: AppColors.bg1,
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildCustomerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://placehold.co/50x50'),
            radius: 25,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Jajang Nurjaman',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Customer'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: placeholder,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildDropdown(
    String label,
    List<String> options,
    RxString selected,
    void Function(String) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Obx(
          () => DropdownButtonFormField<String>(
            value: selected.value.isEmpty ? null : selected.value,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items:
                options
                    .map(
                      (val) => DropdownMenuItem(value: val, child: Text(val)),
                    )
                    .toList(),
            onChanged: (value) {
              if (value != null) onChanged(value);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
