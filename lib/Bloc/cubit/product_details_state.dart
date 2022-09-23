part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  SingleProductResponse singleProductResponse;
  ProductDetailsLoaded(this.singleProductResponse);
}

class ProductDetailsError extends ProductDetailsState {
  String error;
  ProductDetailsError(this.error);
}
