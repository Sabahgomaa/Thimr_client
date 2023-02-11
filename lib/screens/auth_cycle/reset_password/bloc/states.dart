part of 'bloc.dart';

class ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {
}

class ResetPasswordFailedState extends ResetPasswordStates {
   String? msg;

  ResetPasswordFailedState({this.msg});
}
