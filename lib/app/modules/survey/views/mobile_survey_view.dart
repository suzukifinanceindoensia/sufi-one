import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/public/widgets/appbar.dart';
import 'package:sufi_one/app/modules/survey/views/testing_uiux.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class MobileSurveyPage extends StatelessWidget {
  const MobileSurveyPage({super.key});
  //final 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                height: 200,
                padding: EdgeInsets.all(30),
                child: Row(
                  children: [
                    Image.asset(
                      'res/images/logo_suzuki.png', // Ganti dengan logo Suzuki kamu
                      height: 120,
                    ),
                    Expanded(child: SizedBox()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("JON SUZUKI", style: AppTextStyles.bigBody,),
                        Text("jon.suzuki", style: AppTextStyles.medBody,)
                      ],
                    ),
                  ],

                ),
                color: AppColors.splashStart,
              )
            ),
            SizedBox(height: 10,),
            UnderlinedTextButtons()
          ],
        ),
      ),
    );
  }
}