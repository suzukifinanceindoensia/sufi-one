import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget avatar({double? size, VoidCallback? onTap}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF003399), //make global
      border: Border.all(
        color: Colors.white,
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(50)),
    ),
    height: size ?? 80,
    width: size ?? 80,
    child: GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Image.network(
          "",
          fit: BoxFit.fitHeight,
          errorBuilder:
              (bb, o, st) => Container(
                color: Colors.transparent,
                child: Image.asset("res/images/survey/avatar.png"),
              ),
        ),
      ),
    ),
  );
}
