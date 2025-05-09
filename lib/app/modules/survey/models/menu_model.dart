import 'package:flutter/material.dart';

class SurveyMenuModel {
  String? id;
  VoidCallback? onTap;
  String? title;
  String? iconImage;
  Widget? icon;
  IconData? iconData;
  Color? color;

  SurveyMenuModel({
    this.id,
    this.onTap,
    this.iconImage,
    this.icon,
    this.title,
    this.iconData,
    this.color,
  });
}
