import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/survey/controllers/mobile_survey_controller.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';


class SurveyNewtask extends StatelessWidget {
  const SurveyNewtask({super.key});
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          for(var item in dummyData_newtask)
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.newtaskConfirm);
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
                          Text("NEWTASK #${item['id']}", textAlign: TextAlign.center, style: AppTextStyles.bigBody,),
                          Text("Nama Pemohon : ${item['name']}", textAlign: TextAlign.center, style: AppTextStyles.medBody,),
                          Text("Tanggal Permohonan ${item['date']}", textAlign: TextAlign.center, style: AppTextStyles.medBody,),
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