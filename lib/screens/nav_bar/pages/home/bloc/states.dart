part of 'bloc.dart';
class HomeStates {}
class  GetCategoriesLoadingState extends HomeStates {}

class  GetCategoriesSuccessState extends HomeStates {
}

class  GetCategoriesFailedState extends HomeStates {
  final String error;

  GetCategoriesFailedState(this.error);
}
class GetCategoriesDetailsLoadingState extends HomeStates {}

class  GetCategoriesDetailsSuccessState extends HomeStates {
}

class  GetCategoriesDetailsFailedState extends HomeStates {
  final String error;

  GetCategoriesDetailsFailedState(this.error);
}
