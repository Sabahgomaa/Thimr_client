part of 'bloc.dart';

class ContactUsStates {}

class GetContactUsLoadingState extends ContactUsStates {}

class GetContactUsSuccessState extends ContactUsStates {
}

class GetContactUsFailedState extends ContactUsStates {
  final String error;

  GetContactUsFailedState(this.error);
}
class ContactUsLoadingState
    extends ContactUsStates {}

class ContactUsSuccessState
    extends ContactUsStates {
  final String msg;

  ContactUsSuccessState(this.msg);
}

class ContactUsFailedState
    extends ContactUsStates {
  final String error;

  ContactUsFailedState(this.error);
}