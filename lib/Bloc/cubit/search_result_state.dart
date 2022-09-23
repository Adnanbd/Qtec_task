part of 'search_result_cubit.dart';

@immutable
abstract class SearchResultState {
  final List<Result> productList = [];
  SearchResultState();
}

class SearchResultInitial extends SearchResultState {
  final List<Result> productList = [];
  SearchResultInitial();
}

class SearchResultLoading extends SearchResultState {
  final List<Result> productList = [];
  SearchResultLoading();
}

class SearchResultCompleted extends SearchResultState {
  final SearchResult searchResult;
  final List<Result> productList;
  SearchResultCompleted(this.searchResult, this.productList);
}

class SearchResultError extends SearchResultState {
  final String error;

  SearchResultError(this.error);
}
