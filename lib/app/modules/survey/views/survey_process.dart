import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/survey/controllers/mobile_survey_controller.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';
import 'package:get/get.dart';


class SurveyProcess extends StatelessWidget {
  const SurveyProcess({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          for(var item in dummyDataProcess)
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.processSurvey);
                },
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      height: 120,
                      decoration:  BoxDecoration(
                        border: Border.all(
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                      ), 
                      child: Column(
                        children: [
                          Text("PROCESS #${item['id']}", textAlign: TextAlign.center, style: AppTextStyles.bigBody,),
                          Text("Nama Pemohon : ${item['name']}", textAlign: TextAlign.center, style: AppTextStyles.medBody,),
                          Text("Tanggal Permohonan ${item['date'].day}-${item['date'].month}-${item['date'].year}", textAlign: TextAlign.center, style: AppTextStyles.medBody,),
                          Text("${now.difference(item['date']).inDays} days ago", textAlign: TextAlign.center, style: AppTextStyles.medBody,),
                        ],
                      )
                    ),
                  )
                ),
              ),
              SizedBox(height: 10,)
            ],
          )
        ],
      )
    );
  }
}