part of 'bloc.dart';

class LogInStates {}

class LoginLoadingState extends LogInStates {}

class LoginSuccessState extends LogInStates {
  final String msg;

  LoginSuccessState({required this.msg});
}

class LoginFailedState extends LogInStates {
  final bool? isActive;
  String? msg;

  LoginFailedState({this.isActive,this.msg});


}
