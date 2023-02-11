part of 'bloc.dart';

class CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {}

class GetCartFailedState extends CartStates {
  final String? msg;

  GetCartFailedState({this.msg});
}

class ApplyCouponLoadingState extends CartStates {}

class ApplyCouponSuccessState extends CartStates {
  final String? msg;

  ApplyCouponSuccessState({this.msg});
}

class ApplyCouponFailedState extends CartStates {
  final String? msg;

  ApplyCouponFailedState({this.msg});
}

class DeleteCartLoadingState extends CartStates {}

class DeleteCartSuccessState extends CartStates {}

class DeleteCartFailedState extends CartStates {
  final String? msg;

  DeleteCartFailedState({this.msg});
}


// class AddCartLoadingState extends CartStates {}
//
// class AddCartSuccessState extends CartStates {}
//
// class AddCartFailedState extends CartStates {
//   final String? msg;
//
//   AddCartFailedState({this.msg});
// }
