import 'package:flutter/material.dart';
import 'package:pumpkin/App/colors.dart';

InputDecoration textFieldDecoration(String hint) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.only(top: 20, right: 20, left: 12, bottom: 12),
    enabledBorder: new OutlineInputBorder(
      borderSide: new BorderSide(
        color: Color(0xffCCCBC9),
        width: 1,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4.0),
      ),
    ),
    fillColor: Color(0xffF8F8F8),
    filled: true,
    hintText: hint,
    hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: Appcolors().textColor2,
        fontSize: 16),
    focusedBorder: new OutlineInputBorder(
      borderSide: new BorderSide(color: Appcolors().green, width: 2),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4.0),
      ),
    ),
  );
}
