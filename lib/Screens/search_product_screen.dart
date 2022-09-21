import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qtec_task/Bloc/cubit/search_result_cubit.dart';
import 'package:qtec_task/Utils/custom_colors.dart';
import 'package:qtec_task/Utils/custom_values.dart';
import 'package:qtec_task/Widgets/custom_search_bar.dart';
import 'package:qtec_task/Widgets/custom_text_1.dart';
import 'package:qtec_task/Widgets/custom_text_2.dart';
import 'package:qtec_task/Widgets/custom_text_3.dart';
import 'package:qtec_task/Widgets/product_preview_tile.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.mainBackgroundColor,
        elevation: 0,
      ),
      body: BlocBuilder<SearchResultCubit, SearchResultState>(
        builder: (context, state) {
          if (state is SearchResultLoading) {
            return const CircularProgressIndicator();
          } else if (state is SearchResultError) {
            return Center(child: Text(state.error));
          } else if (state is SearchResultCompleted) {
            return Container(
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: 30,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 5,
                                  mainAxisSpacing: 10),
                          itemBuilder: ((context, index) {
                            return ProductPreviewTile();
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text("Nothing Happend");
          }
        },
      ),
    );
  }
}
