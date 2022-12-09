part of 'bloc.dart';

class CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {}

class GetCartFailedState extends CartStates {
  final String error;

  GetCartFailedState(this.error);
}

class ApplyCouponLoadingState extends CartStates {}

class ApplyCouponSuccessState extends CartStates {
  final String msg;

  ApplyCouponSuccessState(this.msg);
}

class ApplyCouponFailedState extends CartStates {
  final String error;

  ApplyCouponFailedState(this.error);
}

class AddCardLoadingState extends CartStates {}

class AddCardSuccessState extends CartStates {}

class AddCardFailedState extends CartStates {
  final String error;

  AddCardFailedState(this.error);
}
