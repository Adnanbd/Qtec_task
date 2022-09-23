part of 'product_list_cubit.dart';

@immutable
abstract class ProductListState {
  const ProductListState();
}

class ProductListInitial extends ProductListState {
  List<Result> searchResultList = [];
  ProductListInitial();
}

class ProductListLoaded extends ProductListState {
  List<Result> searchResultList;
  ProductListLoaded({required this.searchResultList});
}

