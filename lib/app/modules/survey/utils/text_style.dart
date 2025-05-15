import 'package:flutter/material.dart';
import 'package:sufi_one/app/modules/survey/utils/color.dart';

class SurveyTextStyles {
  static const basicLabel = TextStyle(
    color: SurveyColor.darkTextColor,
    fontFamily: "roboto",
    fontSize: 12,
  );

  static const basicLightLabel = TextStyle(
    color: SurveyColor.lightTextColor,
    fontFamily: "roboto",
    fontSize: 12,
  );

  static const basicLabelDanger = TextStyle(
    color: SurveyColor.dangerTextColor,
    fontFamily: "roboto",
    fontSize: 12,
  );

  static const boldTitleLabel = TextStyle(
    color: SurveyColor.darkTextColor,
    fontFamily: "roboto",
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const boldTitleLightLabel = TextStyle(
    color: SurveyColor.lightTextColor,
    fontFamily: "roboto",
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const boldTitleInfoLabel = TextStyle(
    color: SurveyColor.infoColor,
    fontFamily: "roboto",
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const boldTitleDangerLabel = TextStyle(
    color: SurveyColor.dangerColor,
    fontFamily: "roboto",
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}
