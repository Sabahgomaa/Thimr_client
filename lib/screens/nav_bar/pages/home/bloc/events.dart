part of 'bloc.dart';

class HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class GetCategoriesDetailsEvent extends HomeEvent {
  int? id;
  GetCategoriesDetailsEvent({this.id});
}

class GetSliderEvent extends HomeEvent {}

class GetProductsEvent extends HomeEvent {}
