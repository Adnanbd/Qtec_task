part of 'pagination_cubit.dart';

@immutable
abstract class PaginationState {
  const PaginationState();
}

class PaginationInitial extends PaginationState {}

class PaginationTrigger extends PaginationState {
  final int limit;
  final int offset;
  final String searchText;
  const PaginationTrigger(this.limit, this.offset, this.searchText) : super();
}
