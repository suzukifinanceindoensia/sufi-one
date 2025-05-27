import 'package:flutter/material.dart';

class AboutIconItemModel {
  final String title;
  final IconData icon;
  final Function() onTap;

  AboutIconItemModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
