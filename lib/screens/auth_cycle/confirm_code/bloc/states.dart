part of 'bloc.dart';

class ConfirmCodeStates {}

class ConfirmCodeLoadingState extends ConfirmCodeStates {}

class ConfirmCodeSuccessState extends ConfirmCodeStates {
}

class ConfirmCodeFailedState extends ConfirmCodeStates {
   String? msg;

  ConfirmCodeFailedState({this.msg});
}
