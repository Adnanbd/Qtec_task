import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(PaginationInitial());

  triggerSearchQuery(
      {required int limit, required int offset, required String searchText}) {
    emit(PaginationTrigger(limit, offset, searchText));
  }
}
