part of 'bloc.dart';

class SuggestionsAndComplaintsStates {}

class SuggestionsAndComplaintsLoadingState
    extends SuggestionsAndComplaintsStates {}

class SuggestionsAndComplaintsSuccessState
    extends SuggestionsAndComplaintsStates {
  final String msg;

  SuggestionsAndComplaintsSuccessState(this.msg);
}

class SuggestionsAndComplaintsFailedState
    extends SuggestionsAndComplaintsStates {
  final String error;

  SuggestionsAndComplaintsFailedState(this.error);
}
