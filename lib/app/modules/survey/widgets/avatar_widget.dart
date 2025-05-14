import 'package:flutter/material.dart';

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
    height: size ?? 30,
    width: size ?? 30,
    child: GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        child: Container(
          color: Colors.transparent,
          child: Image.asset("res/images/survey/avatar.png"),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        // child: Image.network(
        //   "",
        //   fit: BoxFit.fitHeight,
        //   errorBuilder:
        //       (bb, o, st) => Container(
        //         color: Colors.transparent,
        //         child: Image.asset("res/images/survey/avatar.png"),
        //       ),
        // ),
      ),
    ),
  );
}
