import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qtec_task/Models/search_result.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit() : super(ProductListInitial());

  loadProductFirstTime(List<Result> res) {
    emit(ProductListLoaded(searchResultList: res));
  }
}
