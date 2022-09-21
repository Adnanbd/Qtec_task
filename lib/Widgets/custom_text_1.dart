import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText1 extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const CustomText1({
    Key? key,
    required this.color,
    required this.fontSize,
    required this.text,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.balooDa2(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          height: 1.2),
    );
  }
}
