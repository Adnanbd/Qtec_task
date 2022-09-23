part of 'loading_cubit.dart';

@immutable
abstract class LoadingState {
  bool isLoading = false;
  LoadingState();
}

class LoadingInitial extends LoadingState {
  bool isLoading = false;
  LoadingInitial();
}

class LoadingSet extends LoadingState {
  bool isLoading;
  LoadingSet(this.isLoading);
}
