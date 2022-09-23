import 'package:flutter/material.dart';
import 'package:qtec_task/Models/search_result.dart';
import 'package:qtec_task/Utils/custom_colors.dart';
import 'package:qtec_task/Widgets/custom_text_1.dart';
import 'package:qtec_task/Widgets/custom_text_2.dart';
import 'package:qtec_task/Widgets/custom_text_3.dart';

class ProductPreviewTile extends StatefulWidget {
  Result product;
  ProductPreviewTile({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPreviewTile> createState() => _ProductPreviewTileState();
}

class _ProductPreviewTileState extends State<ProductPreviewTile> {
  int amount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: heightMain*.8,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 15,
          ),
          decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        //color: Colors.red.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(widget.product.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    widget.product.stock == 0? Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: CustomColors.stockOutTextBg,
                      ),
                      child: CustomText1(
                        color: CustomColors.stockOutTextColor,
                        fontSize: 14.0,
                        text: "স্টকে নেই",
                        fontWeight: FontWeight.w500,
                      ),
                    ):Container(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    CustomText1(
                      color: CustomColors.blackColor,
                      fontSize: 18,
                      text: widget.product.productName,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        CustomText1(
                          color: CustomColors.secondaryTextColor,
                          fontSize: 10.0,
                          text: "ক্রয়",
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText2(
                          color: CustomColors.primaryTextColor,
                          fontSize: 18.0,
                          text: "৳ ${widget.product.charge.currentCharge}",
                          fontWeight: FontWeight.w700,
                        ),
                        Expanded(child: Container()),
                        CustomText3(
                          color: CustomColors.primaryTextColor,
                          fontSize: 14.0,
                          text: "৳ 22.00",
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText1(
                          color: CustomColors.secondaryTextColor,
                          fontSize: 10.0,
                          text: "বিক্রয়",
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText2(
                          color: CustomColors.blackColor,
                          fontSize: 14.0,
                          text: "৳ ${widget.product.charge.sellingPrice}",
                          fontWeight: FontWeight.w500,
                        ),
                        Expanded(child: Container()),
                        CustomText1(
                          color: CustomColors.secondaryTextColor,
                          fontSize: 10.0,
                          text: "লাভ",
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText2(
                          color: CustomColors.blackColor,
                          fontSize: 14.0,
                          text: "৳ ${widget.product.charge.profit}",
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        widget.product.stock != 0 ? 
        
        amount == 0
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    amount = amount + 1;
                  });
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: CustomColors.buttonGradient,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                    color: CustomColors.whiteColor,
                    size: 18,
                  ),
                ),
              )
            : Container(
                width: widthMain * .4,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: CustomColors.counterButtonBg,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          amount = amount - 1;
                        });
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.counterMinusIconBg,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.remove,
                          color: CustomColors.whiteColor,
                          size: 18,
                        ),
                      ),
                    ),
                    CustomText1(
                      color: CustomColors.primaryTextColor,
                      fontSize: 18.0,
                      text: "$amount পিস",
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          amount = amount + 1;
                        });
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: CustomColors.buttonGradient,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add,
                          color: CustomColors.whiteColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ):Container(),
      ],
    );
  }
}
