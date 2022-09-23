import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qtec_task/Bloc/cubit/product_list_cubit.dart';
import 'package:qtec_task/Models/search_result.dart';
import 'package:qtec_task/Services/http_services.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  final HttpService httpService;
  SearchResultCubit({required this.httpService}) : super(SearchResultInitial());

  Future<void> getSearchResult(
      {required int limit,
      required int offset,
      required String searchText}) async {
    emit(SearchResultLoading());
    try {
      final SearchResult searchResult =
          await httpService.getHomeResponse(limit, offset, searchText);
      
      emit(SearchResultCompleted(
          searchResult, searchResult.data.products.results));
    } on Exception catch (err) {
      emit(SearchResultError(err.toString()));
    } catch (err) {
      print("Error :$err");
    }
  }

  Future<void> getSearchResultMore(
      {required int limit,
      required int offset,
      required String searchText}) async {
    //emit(SearchResultLoading());
    try {
      final SearchResult searchResult =
          await httpService.getHomeResponse(limit, offset, searchText);
      
      List<Result> temp =
          state.productList + searchResult.data.products.results;
      emit(SearchResultCompleted(searchResult, temp));
    } on Exception catch (err) {
      emit(SearchResultError(err.toString()));
    } catch (err) {
      print("Error :$err");
    }
  }




}
