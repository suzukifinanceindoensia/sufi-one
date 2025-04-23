import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
import 'package:sufi_one/app/routes/app_routes.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';


final List list = [1,2,3,4,5];

class SurveyNewtask extends StatelessWidget {
  const SurveyNewtask({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          for(var item in list)
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
                      child: Text("SURVEY NEWTASK #$item", textAlign: TextAlign.center, style: AppTextStyles.bigBody,),
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