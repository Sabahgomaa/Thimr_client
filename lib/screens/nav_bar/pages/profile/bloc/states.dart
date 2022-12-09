part of 'bloc.dart';

class LogoutStates {}

class LogoutLoadingState extends LogoutStates {}

class LogoutSuccessState extends LogoutStates {
}

class LogoutFailedState extends LogoutStates {
  final String error;

  LogoutFailedState(this.error);
}