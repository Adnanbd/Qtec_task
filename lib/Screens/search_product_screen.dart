import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qtec_task/Bloc/cubit/loading_cubit.dart';
import 'package:qtec_task/Bloc/cubit/pagination_cubit.dart';
import 'package:qtec_task/Bloc/cubit/search_result_cubit.dart';
import 'package:qtec_task/Utils/custom_colors.dart';
import 'package:qtec_task/Widgets/custom_search_bar.dart';
import 'package:qtec_task/Widgets/product_preview_tile.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //// ADDING THE SCROLL LISTINER
  _scrollListener() {
    var paginationState = context.read<PaginationCubit>().state;
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<LoadingCubit>().setIsloading(true);
      if (paginationState is PaginationTrigger) {
        context.read<PaginationCubit>().triggerSearchQuery(
              limit: paginationState.limit,
              offset: paginationState.offset + 6,
              searchText: paginationState.searchText,
            );
        
        context
            .read<SearchResultCubit>()
            .getSearchResultMore(
              limit: paginationState.limit,
              offset: paginationState.offset + 6,
              searchText: paginationState.searchText,
            )
            .then((value) {
          context.read<LoadingCubit>().setIsloading(false);
        });
      }
    }
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
      ),
      body: Container(
        alignment: Alignment.center,
        height: heightMain,
        width: widthMain,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomSearchBar(),
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<SearchResultCubit, SearchResultState>(
              builder: (context, state) {
                if (state is SearchResultInitial) {
                  return Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Lottie.asset('assets/empty-box.json'),
                  ));
                } else if (state is SearchResultLoading) {
                  return Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Lottie.asset('assets/41252-searching-radius.json'),
                  ));
                } else if (state is SearchResultError) {
                  return Center(child: Text(state.error));
                } else if (state is SearchResultCompleted) {
                  //print(
                  //    ">> Total Product >> ${state.searchResult.data.products.count}");

                  return state.searchResult.data.products.count == 0
                      ? Expanded(
                          child: Container(
                          alignment: Alignment.center,
                          child: Lottie.asset('assets/empty-box.json'),
                        ))
                      : Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: GridView.count(
                              padding: const EdgeInsets.only(bottom: 80),
                              controller: _scrollController,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 5,
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: state.productList.map((product) {
                                return ProductPreviewTile(product: product);
                              }).toList(),
                            ),
                          ),
                        );
                } else {
                  return const Text("Nothing Happend");
                }
              },
            ),
            BlocBuilder<LoadingCubit, LoadingState>(
              builder: (context, state) {
                if (state is LoadingSet) {
                  return state.isLoading
                      ? Container(
                          height: 70,
                          width: widthMain,
                          alignment: Alignment.topCenter,
                          child: CircularProgressIndicator(
                            backgroundColor: CustomColors.primaryColor,
                          ),
                        )
                      : Container();
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
