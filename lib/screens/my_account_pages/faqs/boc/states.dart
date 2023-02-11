part of 'bloc.dart';

class FAQSStates {}

class GetFAQsLoadingState extends FAQSStates {}

class GetFAQsSuccessState extends FAQSStates {
}

class GetFAQsFailedState extends FAQSStates {
  final String? msg;

  GetFAQsFailedState({this.msg});
}
