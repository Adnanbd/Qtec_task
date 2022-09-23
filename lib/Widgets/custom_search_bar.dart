import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qtec_task/Bloc/cubit/pagination_cubit.dart';
import 'package:qtec_task/Bloc/cubit/product_list_cubit.dart';
import 'package:qtec_task/Bloc/cubit/search_result_cubit.dart';
import 'package:qtec_task/Utils/custom_colors.dart';
import 'package:qtec_task/Utils/custom_values.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var paginationState = context.read<PaginationCubit>().state;
      if (paginationState is PaginationTrigger) {
        print("Searched Text Found = " + paginationState.searchText);
        searchTextEditingController.text = paginationState.searchText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    var paginationState = context.watch<PaginationCubit>().state;
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
            controller: searchTextEditingController,
            onChanged: (value) {
              print("Typed => $value");
              if (paginationState is PaginationTrigger) {
                context.read<PaginationCubit>().triggerSearchQuery(
                      limit: 6,
                      offset: 0,
                      searchText: value,
                    );
              } else if (paginationState is PaginationInitial) {
                context.read<PaginationCubit>().triggerSearchQuery(
                      limit: 6,
                      offset: 0,
                      searchText: value,
                    );
              }
            },
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
          child: Builder(builder: (context) {
            var paginationState = context.watch<PaginationCubit>().state;

            return GestureDetector(
              onTap: () {
                if (paginationState is PaginationTrigger) {
                  context.read<SearchResultCubit>().getSearchResult(
                        limit: 6,
                        offset: 0,
                        searchText: paginationState.searchText,
                      );
                      
                  context.read<PaginationCubit>().triggerSearchQuery(
                      limit: 6,
                      offset: 0,
                      searchText: paginationState.searchText,
                    );
                }
              },
              child: SvgPicture.asset(
                "assets/search-icon.svg",
                height: 26,
                width: 26,
                fit: BoxFit.contain,
              ),
            );
          }),
        ),
      ],
    );
  }
}
