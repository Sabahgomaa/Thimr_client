part of 'bloc.dart';

class HomeEvent {}
class  GetCategoriesEvent extends HomeEvent {}

class GetCategoriesDetailsEvent extends HomeEvent {
  int?categoryId;
  GetCategoriesDetailsEvent();
}
