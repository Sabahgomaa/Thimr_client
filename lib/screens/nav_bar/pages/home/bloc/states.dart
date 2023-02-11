part of 'bloc.dart';

class HomeStates {}

class GetCategoriesLoadingState extends HomeStates {}

class GetCategoriesSuccessState extends HomeStates {}

class GetCategoriesFailedState extends HomeStates {
  final String? msg;

  GetCategoriesFailedState({this.msg});
}

class GetCategoriesDetailsLoadingState extends HomeStates {}

class GetCategoriesDetailsSuccessState extends HomeStates {}

class GetCategoriesDetailsFailedState extends HomeStates {
  final String? msg;

  GetCategoriesDetailsFailedState({this.msg});
}

class GetSliderLoadingState extends HomeStates {}

class GetSliderSuccessState extends HomeStates {}

class GetSliderFailedState extends HomeStates {
  final String? msg;

  GetSliderFailedState({this.msg});
}

class GetProductsLoadingState extends HomeStates {}

class GetProductsSuccessState extends HomeStates {}

class GetProductsFailedState extends HomeStates {
  final String? msg;

  GetProductsFailedState({this.msg});
}
