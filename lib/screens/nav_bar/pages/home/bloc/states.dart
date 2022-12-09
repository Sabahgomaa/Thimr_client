part of 'bloc.dart';

class HomeStates {}

class GetCategoriesLoadingState extends HomeStates {}

class GetCategoriesSuccessState extends HomeStates {}

class GetCategoriesFailedState extends HomeStates {
  final String error;

  GetCategoriesFailedState(this.error);
}

class GetCategoriesDetailsLoadingState extends HomeStates {}

class GetCategoriesDetailsSuccessState extends HomeStates {}

class GetCategoriesDetailsFailedState extends HomeStates {
  final String error;

  GetCategoriesDetailsFailedState(this.error);
}

class GetSliderLoadingState extends HomeStates {}

class GetSliderSuccessState extends HomeStates {}

class GetSliderFailedState extends HomeStates {
  final String error;

  GetSliderFailedState(this.error);
}

class GetProductsLoadingState extends HomeStates {}

class GetProductsSuccessState extends HomeStates {}

class GetProductsFailedState extends HomeStates {
  final String error;

  GetProductsFailedState(this.error);
}
