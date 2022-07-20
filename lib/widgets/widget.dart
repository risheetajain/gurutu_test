import 'package:flutter/material.dart';

import '../constants/color.dart';

class Widgets {
  static Widget buildButton(
      {required String text,
      required Function? onTap,
      required BuildContext context}) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap == null
          ? null
          : () {
              onTap();
            },
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        // width: double.infinity,
        height: size.height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: purpleLinearGradient,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(text.toUpperCase(),
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
