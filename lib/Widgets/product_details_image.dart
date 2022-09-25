import 'package:flutter/material.dart';
import 'package:qtec_task/Utils/custom_colors.dart';

class ProductDetailsImage extends StatelessWidget {
  final String imgLink;
  const ProductDetailsImage({Key? key, required this.imgLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            width: 1000,
            decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(imgLink, fit: BoxFit.contain,),
          );
  }
}
