import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qtec_task/Utils/custom_colors.dart';
import 'package:qtec_task/Utils/custom_values.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: widthMain * .9,
          height: 55,
          padding:
              const EdgeInsets.only(left: 25, right: 65, top: 0, bottom: 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CustomColors.whiteColor,
            borderRadius: CustomValues.textFieldBorderRadius,
          ),
          child: TextField(
            autofocus: true,
            textAlign: TextAlign.left,
            cursorHeight: 20,
            style: GoogleFonts.balooDa2(
              fontSize: 16,
              color: CustomColors.blackColor,
            ),
            controller: TextEditingController(),
            decoration: const InputDecoration(
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
          ),
        ),
        Positioned(
          right: 20,
          child: SvgPicture.asset(
            "assets/search-icon.svg",
            height: 26,
            width: 26,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
