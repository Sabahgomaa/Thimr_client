part of 'bloc.dart';

class ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
}

class ForgetPasswordFailedState extends ForgetPasswordStates {
  final String error;

  ForgetPasswordFailedState(this.error);
}