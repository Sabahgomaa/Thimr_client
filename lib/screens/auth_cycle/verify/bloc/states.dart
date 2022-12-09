part of 'bloc.dart';

class VerifyStates {}

class VerifyLoadingState extends VerifyStates {}

class VerifySuccessState extends VerifyStates {
}

class VerifyFailedState extends VerifyStates {
  final String error;

  VerifyFailedState(this.error);
}
