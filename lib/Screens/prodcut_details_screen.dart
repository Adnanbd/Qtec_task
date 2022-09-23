import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qtec_task/Bloc/cubit/product_details_cubit.dart';
import 'package:qtec_task/Utils/custom_colors.dart';
import 'package:qtec_task/Widgets/custom_search_bar.dart';
import 'package:qtec_task/Widgets/custom_separator.dart';
import 'package:qtec_task/Widgets/custom_text_1.dart';
import 'package:qtec_task/Widgets/custom_text_2.dart';
import 'package:qtec_task/Widgets/html_parser.dart';
import 'package:qtec_task/Widgets/product_details_image.dart';
import 'package:qtec_task/Widgets/ssasd.dart';

class ProductDetailsScreen extends StatefulWidget {
  String slug;
  ProductDetailsScreen({Key? key, required this.slug}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductDetailsCubit>().getSingleProductDetails(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.mainBackgroundColor,
        elevation: 0,
        title: CustomText1(
          color: CustomColors.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: "প্রোডাক্ট ডিটেইল",
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(
            Icons.arrow_back,
            color: CustomColors.blackColor,
          ),
        ),
        leadingWidth: 35,
        centerTitle: false,
      ),
      body: Container(
        alignment: Alignment.center,
        height: heightMain,
        width: widthMain,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSearchBar(),
            SizedBox(
              height: 25,
            ),
            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductDetailsLoading) {
                  return Container(
                    height: 70,
                    width: widthMain,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.discreteCircle(
                          secondRingColor: Color(0xFF1400AE),
                          thirdRingColor: Color(0xFF6210E1),
                          color: Color.fromARGB(255, 90, 74, 115),
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText1(
                          color: CustomColors.blackColor,
                          fontSize: 12,
                          text: "Loading ...",
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  );
                } else if (state is ProductDetailsLoaded) {
                  print("loaded");
                  var product = state.singleProductResponse.data;
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //Text(state.singleProductResponse.data.productName),
                          Container(
                            width: widthMain,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: false,
                                //aspectRatio: 3/4,
                                enlargeCenterPage: true,
                                height: heightMain * .4,
                                viewportFraction: .7,
                              ),
                              items: [
                                ProductDetailsImage(imgLink: product.image),
                                ProductDetailsImage(imgLink: product.image),
                                ProductDetailsImage(imgLink: product.image),
                                ProductDetailsImage(imgLink: product.image),
                                ProductDetailsImage(imgLink: product.image),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    CustomText1(
                                      color: CustomColors.blackColor,
                                      fontSize: 24,
                                      text: product.productName,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          product.brand.name != ""
                                              ? CustomText1(
                                                  color: CustomColors
                                                      .secondaryTextColor,
                                                  fontSize: 16,
                                                  text: "ব্র্যান্ডঃ ",
                                                  fontWeight: FontWeight.w400,
                                                )
                                              : Container(),
                                          product.brand.name != ""
                                              ? CustomText1(
                                                  color:
                                                      CustomColors.blackColor,
                                                  fontSize: 16,
                                                  text: "${product.brand.name}",
                                                  fontWeight: FontWeight.w400,
                                                )
                                              : Container(),
                                          product.seller != ""
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(
                                                    Icons.circle,
                                                    size: 8,
                                                    color: CustomColors
                                                        .primaryTextColor,
                                                  ),
                                                )
                                              : Container(),
                                          product.seller != ""
                                              ? CustomText1(
                                                  color: CustomColors
                                                      .secondaryTextColor,
                                                  fontSize: 16,
                                                  text: "ডিস্ট্রিবিউটরঃ ",
                                                  fontWeight: FontWeight.w400,
                                                )
                                              : Container(),
                                          product.seller != ""
                                              ? CustomText1(
                                                  color:
                                                      CustomColors.blackColor,
                                                  fontSize: 16,
                                                  text: "${product.seller}",
                                                  fontWeight: FontWeight.w400,
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      //padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText1(
                                                  color: CustomColors
                                                      .primaryTextColor,
                                                  fontSize: 22,
                                                  text: "ক্রয়মূল্যঃ ",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                //বিক্রয়মূল্যঃ লাভঃ ৳ 220
                                                CustomText2(
                                                  color: CustomColors
                                                      .primaryTextColor,
                                                  fontSize: 22,
                                                  text: "৳ 220",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText1(
                                                  color:
                                                      CustomColors.blackColor,
                                                  fontSize: 18,
                                                  text: "বিক্রয়মূল্যঃ ",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                //বিক্রয়মূল্যঃ লাভঃ ৳ 220
                                                CustomText2(
                                                  color:
                                                      CustomColors.blackColor,
                                                  fontSize: 18,
                                                  text: "৳ 220",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                          ),
                                          CustomSeparator(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText1(
                                                  color:
                                                      CustomColors.blackColor,
                                                  fontSize: 18,
                                                  text: "লাভঃ ",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                //বিক্রয়মূল্যঃ লাভঃ ৳ 220
                                                CustomText2(
                                                  color:
                                                      CustomColors.blackColor,
                                                  fontSize: 18,
                                                  text: "৳ 220",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                          ),
                                          //CustomPaint(
                                          //  size: Size(
                                          //      90,
                                          //      (90 * 1.0886075949367089)
                                          //          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                          //  painter: RPSCustomPainter(),
                                          //),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      alignment: Alignment.bottomLeft,
                                      child: CustomText1(
                                        color: CustomColors.blackColor,
                                        fontSize: 24,
                                        text: "বিস্তারিত",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomPaint(
                                    size: Size(
                                        90,
                                        (90 * 1.0886075949367089)
                                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                    painter: RPSCustomPainter(),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText1(
                                        color: CustomColors.whiteColor,
                                        fontSize: 18,
                                        text: "এটি",
                                        fontWeight: FontWeight.w500,
                                      ),
                                      CustomText1(
                                        color: CustomColors.whiteColor,
                                        fontSize: 18,
                                        text: "কিনুন",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  parseHtmlString(product.description),
                                  style: GoogleFonts.balooDa2(
                                    fontSize: 18,
                                    color: CustomColors.secondaryTextColor,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is ProductDetailsError) {
                  return Text(state.error);
                } else {
                  return const Text("Nothing Happend");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
