import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/fontstyle.dart';

class SurveyUpload extends StatelessWidget {
  const SurveyUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
      child: GestureDetector(
        onTap: (){
          print("SUCCESS");
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
              child: Text("SURVEY UPLOAD #1", textAlign: TextAlign.center, style: AppTextStyles.bigBody,),
            ),
          )
        ),
      ),
    );
  }
}