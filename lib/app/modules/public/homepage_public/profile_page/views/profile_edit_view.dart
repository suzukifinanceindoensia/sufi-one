import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/public/homepage_public/profile_page/controllers/profile_page_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/theme/color_constant.dart';

class ProfileEditView extends StatelessWidget {
  ProfileEditView({super.key});
  final controller = Get.find<ProfilePageController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ubah Profil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Terimakasih sudah bergabung dan menjadi bagian dari Suzuki Finance dan aplikasi Sufi Smart',
              ),
              const SizedBox(height: 24),
              _buildTextField(
                label: 'Nama Lengkap',
                controller: controller.nameController,
              ),
              _buildTextField(
                label: 'Nomor Telepon',
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                label: 'Tanggal Lahir',
                controller: controller.birthDateController,
                hint: 'YYYY-MM-DD',
              ),
              _buildDropdownField(
                label: 'Gender',
                value: controller.gender.value,
                items: ['male', 'female'],
                onChanged: (val) => controller.gender.value = val ?? '',
              ),
              _buildDropdownField(
                label: 'Pekerjaan',
                value: controller.job.value,
                items: ['pegawai swasta', 'wiraswasta', 'mahasiswa', 'lainnya'],
                onChanged: (val) => controller.job.value = val ?? '',
              ),
              const SizedBox(height: 16),
              const Text(
                'Isi informasi No KTP dan nomor kontrak jika anda nasabah Suzuki Finance',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                label: 'No KTP',
                controller: controller.ktpController,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                label: 'Nomor Kontrak 1',
                controller: controller.kontrak1Controller,
                keyboardType: TextInputType.number,
                validator: controller.validateOptionalContract,
              ),
              _buildTextField(
                label: 'Nomor Kontrak 2',
                controller: controller.kontrak1Controller,
                keyboardType: TextInputType.number,
                validator: controller.validateOptionalContract,
              ),
              _buildTextField(
                label: 'Nomor Kontrak 3',
                controller: controller.kontrak1Controller,
                keyboardType: TextInputType.number,
                validator: controller.validateOptionalContract,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    foregroundColor: AppColors.bg1,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.saveProfile();
                      Get.back();
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? hint,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator:
            validator ??
            (value) =>
                (value == null || value.isEmpty)
                    ? 'Field tidak boleh kosong'
                    : null,
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: value.isNotEmpty ? value : null,
        decoration: InputDecoration(
          labelText: label,
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        items:
            items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.toUpperCase()),
                  ),
                )
                .toList(),
        onChanged: onChanged,
        validator:
            (value) =>
                (value == null || value.isEmpty)
                    ? 'Pilih $label terlebih dahulu'
                    : null,
      ),
    );
  }
}
