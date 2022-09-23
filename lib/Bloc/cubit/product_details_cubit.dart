import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qtec_task/Models/single_product_response.dart';
import 'package:qtec_task/Services/http_services.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final HttpService httpService;
  ProductDetailsCubit({required this.httpService})
      : super(ProductDetailsInitial());

  getSingleProductDetails(String slug) async {
    emit(ProductDetailsLoading());
    try {
      final SingleProductResponse productDetails =
          await httpService.getSingleProductDetails(slug);

      emit(ProductDetailsLoaded(productDetails));
    } on Exception catch (err) {
      emit(ProductDetailsError(err.toString()));
    } catch (err) {
      print("Error :$err");
    }
  }
}
