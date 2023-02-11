part of 'bloc.dart';

class ShowProductStates {}

class ShowProductLoadingState extends ShowProductStates {}

class ShowProductSuccessState extends ShowProductStates {}

class ShowProductFailedState extends ShowProductStates {
  final String error;

  ShowProductFailedState({required this.error});
}

class AddToFavoriteLoadingState extends ShowProductStates {}

class AddToFavoriteSuccessState extends ShowProductStates {}

class AddToFavoriteFailedState extends ShowProductStates {
  final String error;

  AddToFavoriteFailedState({required this.error});
}

class RemoveToFavoriteLoadingState extends ShowProductStates {}

class RemoveToFavoriteSuccessState extends ShowProductStates {}

class RemoveToFavoriteFailedState extends ShowProductStates {
  final String error;

  RemoveToFavoriteFailedState({required this.error});
}

class GetProductRateLoadingState extends ShowProductStates {}

class GetProductRateSuccessState extends ShowProductStates {}

class GetProductRateFailedState extends ShowProductStates {
  final String error;

  GetProductRateFailedState({required this.error});
}
class AddCartLoadingState extends ShowProductStates {}

class AddCartSuccessState extends ShowProductStates {}

class AddCartFailedState extends ShowProductStates {
  final String? msg;

  AddCartFailedState({this.msg});
}
