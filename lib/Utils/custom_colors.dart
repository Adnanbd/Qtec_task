import 'package:flutter/material.dart';

class CustomColors {
  static Color mainBackgroundColor = const Color(0xFFF7F2FF); //#F7F2FF
  static Color primaryColor = const Color(0xFF0C0F14); //#DA2079
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black; //#646464
  static Color primaryTextColor = const Color(0xFFDA2079);
  static Color secondaryTextColor = const Color(0xFF646464);
  static Color counterButtonBg = const Color(0xFFFFCCE4);
  static Color counterMinusIconBg = const Color(0xFFFFBFDD);

  static Color stockOutTextColor = const Color(0xFFC62828);
  static Color stockOutTextBg = const Color(0xFFFFCCCC);

  static LinearGradient buttonGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF6210E1),
      Color(0xFF1400AE),
    ],
  );
  //linear-gradient(179.98deg, #6210E1 38.71%, #1400AE 119.43%)
  //#FFCCE4
  //#FFBFDD
  //#C62828
  //#FFCCCC
}
