import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';
import 'package:sufi_one/app/modules/public/widgets/buttonStyle.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:get/get.dart';

class UploadCheckingView extends StatelessWidget {
  const UploadCheckingView({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Informasi Pemohon",style: AppTextStyles.bigBody,),
              Table(border: TableBorder.all(), 
                columnWidths: const {
                  0: FixedColumnWidth(150),
                  1: FlexColumnWidth(),       
                },
                children: const [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Tipe Pemohon', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Personal', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Objek Pembayaran'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Value'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("MH Personal",style: AppTextStyles.bigBody,),
              Table(border: TableBorder.all(), 
                columnWidths: const {
                  0: FixedColumnWidth(150),
                  1: FlexColumnWidth(),       
                },
                children: const [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Dealer', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('PT JON SUKUZI INDONESIA', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Jenis Identitas'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('E-KTP'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Dokumen'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Value'),
                      ),
                    ],
                  ),
                ],
              ),
              Text("Hasil Survey",style: AppTextStyles.bigBody,),
              Table(border: TableBorder.all(), 
                columnWidths: const {
                  0: FixedColumnWidth(200),
                  1: FlexColumnWidth(),       
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Pertanyaan 1', style: AppTextStyles.medBodyBold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('value', style: AppTextStyles.medBodyBold)
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Pertanyaan 2', style: AppTextStyles.medBody),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('value',style: AppTextStyles.medBody,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Pilihan ganda 1', style: AppTextStyles.medBodyBold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Value', style: AppTextStyles.medBodyBold),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Pilihan ganda 2', style: AppTextStyles.medBody),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Value', style: AppTextStyles.medBody),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gambar', style: AppTextStyles.medBodyBold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Value', style: AppTextStyles.medBodyBold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              FractionallySizedBox(
                widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: (){
                        Get.toNamed(AppRoutes.mobileSurvey);
                      }, 
                      style: AppButtonStyle.primaryButtonStyle(),
                      child: Text("Back",style: AppTextStyles.buttonFont,)
                    ),
                  ),
            ]
          )
        ),
      )
    );
  }
}