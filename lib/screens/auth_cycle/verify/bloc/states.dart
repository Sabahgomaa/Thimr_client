part of 'bloc.dart';

class VerifyStates {}

class VerifyLoadingState extends VerifyStates {}

class VerifySuccessState extends VerifyStates {
}

class VerifyFailedState extends VerifyStates {
  final String msg;

  VerifyFailedState({required this.msg});
}
