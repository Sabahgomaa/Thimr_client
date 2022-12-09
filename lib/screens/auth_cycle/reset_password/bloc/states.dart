part of 'bloc.dart';

class ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {
}

class ResetPasswordFailedState extends ResetPasswordStates {
  final String error;

  ResetPasswordFailedState(this.error);
}
