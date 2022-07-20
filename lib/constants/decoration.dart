import 'package:assignment_test/constants/color.dart';
import 'package:flutter/material.dart';

TextStyle textField = TextStyle(
    fontSize: 14,
    // fontFamily: 'Noto Sans',
    fontWeight: FontWeight.w400,
    color: Colors.grey.withOpacity(0.5));
InputDecoration textFieldDecoration = InputDecoration(
    labelText: "",
    hintText: "",
    labelStyle: textField,
    hintStyle: textField,
    enabledBorder: border,
    focusedBorder: border,
    // disabledBorder: border,
    focusedErrorBorder: border,
    // labelStyle: Theme.of(context).textTheme.subtitle2,
    border: border);
InputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: mainColor, width: 1),
);
