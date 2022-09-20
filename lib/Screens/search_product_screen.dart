import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_task/Bloc/cubit/search_result_cubit.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchResultCubit, SearchResultState>(
        builder: (context, state) {
          if (state is SearchResultLoading) {
            return const CircularProgressIndicator();
          } else if (state is SearchResultError) {
            return Center(child: Text(state.error));
          } else if (state is SearchResultCompleted) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Total Products = ${state.searchResult.data.products.count}"),
                ],
              ),
            );
          } else {
            return Text("Nothing Happend");
          }
        },
      ),
    );
  }
}
