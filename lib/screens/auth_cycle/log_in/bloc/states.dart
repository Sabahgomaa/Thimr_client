part of 'bloc.dart';

class LogInStates {}

class LoginLoadingState extends LogInStates {}

class LoginSuccessState extends LogInStates {
}

class LoginFailedState extends LogInStates {
  final String error;

  LoginFailedState(this.error);
}
