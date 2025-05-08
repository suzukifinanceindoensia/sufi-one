import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class KunjunganController extends GetxController {
  
  final RxList<dynamic> answers = RxList<dynamic>([
    'Pilih', // 1. Tipe Follow Up (Default 'Pilih')
    null, // 2. Ambil Foto Lokasi
    null, // 3. Bertemu Dengan Siapa
    null, // 4. Apakah Nomor Telepon Customer Berubah
    null, // 5. Apakah Alamat Customer Berubah
    null, // 6. Apakah Debitur Ada
    null, // 7. Apakah Unit Ada
    null, // 8. Apakah Customer Akan Membayar
    null, // 9. Hasil Kunjungan
    null, // 10. Tentukan Janji Bayar
    'Tidak', // 11. Apakah ada Serah Terima Surat Peringatan (Default 'Tidak')
    null, // 12. Ambil Foto (Surat Peringatan)
  ]);


  final List<String> tipeFollowUpOptions = ['Pilih', 'Berkunjung'];
  final List<String> bertemuDenganSiapaOptions = [
    'Customer',
    'Bukan Customer',
    'Tidak Ketemu Siapa Siapa'
  ];
  final List<String> yaTidakOptions = ['Ya', 'Tidak'];


  final RxBool showSuratPeringatanQuestion = false.obs;
  final RxBool showQuestions =
      false.obs; 

  // Controller untuk input teks.
  final TextEditingController hasilKunjunganController = TextEditingController();
  final GlobalKey<FormState> kunjunganKey = GlobalKey<FormState>();

  // Function to handle image picking
  Future<void> pickImage(int questionNumber) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      File? compressedImageFile = await _compressImage(imageFile);

      if (compressedImageFile != null) {
        answers[questionNumber - 1] = compressedImageFile;
        update();
      } else {
        print('Image compression failed.'); // terminal
        Get.snackbar(
          'Error',
          'Failed to compress image. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      print('No image selected.'); // terminal
    }
  }


  Future<File?> _compressImage(File imageFile) async {
    try {
      // 1. Decode the image
      final image = img.decodeImage(await imageFile.readAsBytes());
      if (image == null) {
        return null; // Handle the null case
      }

      // 2. Resize the image (optional, for further compression)
      img.Image resizedImage =
          img.copyResize(image, width: 800); // Example: resize to 800px width

      // 3. Encode the image with desired quality
      final compressedBytes =
          img.encodeJpg(resizedImage, quality: 70); // Adjust quality as needed (0-100)

      // 4. Get the app's temporary directory
      final tempDir = await getTemporaryDirectory();
      final tempPath =
          '${tempDir.path}/compressed_image_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // 5. Create a new file for the compressed image
      File compressedFile = File(tempPath);
      await compressedFile.writeAsBytes(compressedBytes);

      return compressedFile;
    } catch (e) {
      print('Error compressing image: $e'); // Log any errors during compression
      return null; // Return null to indicate failure
    }
  }

  // Function to handle form submission
  void submitForm() {
    if (kunjunganKey.currentState!.validate()) {
      // Use Form validation
      _showDialog();
      // // Check if all answers are provided
      // if (answers.every((answer) =>
      //     answer != null)) { // Ubah kondisi, semua jawaban harus diisi
      //   _showDialog();
      // } else {
      //   // Show a message if any answer is missing
      //   Get.snackbar(
      //     'Peringatan',
      //     'Mohon jawab semua pertanyaan dan lengkapi foto.',
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      // }
    }
  }

  void _showDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Submitted Answers'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Tipe Follow Up: ${answers[0]}',
                  style: AppTextStyles.Navybodymed),
              Text(
                  'Foto Lokasi: ${answers[1] != null ? "Uploaded" : "Not Uploaded"}',
                  style: AppTextStyles.Navybodymed),
              Text('Bertemu Dengan Siapa: ${answers[2]}',
                  style: AppTextStyles.Navybodymed),
              Text(
                  'Apakah No. Telp Berubah: ${answers[3]}',
                  style: AppTextStyles.Navybodymed),
              Text(
                  'Apakah Alamat Berubah: ${answers[4]}',
                  style: AppTextStyles.Navybodymed),
              Text('Apakah Debitur Ada: ${answers[5]}',
                  style: AppTextStyles.Navybodymed),
              Text('Apakah Unit Ada: ${answers[6]}',
                  style: AppTextStyles.Navybodymed),
              Text('Apakah Customer Akan Membayar: ${answers[7]}',
                  style: AppTextStyles.Navybodymed),
              Text('Hasil Kunjungan: ${hasilKunjunganController.text}',
                  style: AppTextStyles.Navybodymed),
              Text(
                  'Janji Bayar: ${answers[9] != null ? DateFormat('dd-MM-yyyy').format(answers[9]) : "Belum Ditentukan"}',
                  style: AppTextStyles.Navybodymed),
              Text(
                  'Serah Terima Surat Peringatan: ${answers[10]}',
                  style: AppTextStyles.Navybodymed),
              if (showSuratPeringatanQuestion.value)
                Text(
                    'Foto Surat Peringatan: ${answers[11] != null ? "Uploaded" : "Not Uploaded"}',
                    style: AppTextStyles.Navybodymed),
            ],
          ),
        ),
        actions: [
          TextButton(
            style: AppButtonStyle.primaryButtonStyle(),
            onPressed: () {
              Get.back();
              resetForm(); // ganti sama upload form
            },
            child: Text('OK', style: AppTextStyles.buttonFont),
          ),
        ],
      ),
    );
  }

  void resetForm() {
    answers.fillRange(0, answers.length, null);
    answers[0] =
        'Pilih'; //Set default value for dropdown 1. Tipe Follow Up
    answers[10] =
        'Tidak'; //Set default value for dropdown 11. Apakah ada Serah Terima Surat Peringatan
    showSuratPeringatanQuestion.value =
        false; // Reset the state variable
    showQuestions.value =
        false; // Reset the state yang mengontrol pertanyaan lainnya
    hasilKunjunganController.clear();
    update(); // Add this line to update the UI
  }

  @override
  void dispose() {
    // Dispose the controllers to prevent memory leaks
    hasilKunjunganController.dispose();
    super.dispose();
  }
}
