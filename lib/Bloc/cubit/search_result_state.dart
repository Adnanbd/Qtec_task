part of 'search_result_cubit.dart';

@immutable
abstract class SearchResultState {
  const SearchResultState();
}

class SearchResultInitial extends SearchResultState {}

class SearchResultLoading extends SearchResultState {}

class SearchResultCompleted extends SearchResultState {
  final SearchResult searchResult;
  const SearchResultCompleted(this.searchResult);
}

class SearchResultError extends SearchResultState {
  final String error;

  const SearchResultError(this.error);
}
