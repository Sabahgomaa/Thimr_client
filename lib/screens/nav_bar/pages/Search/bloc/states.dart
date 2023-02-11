part of 'bloc.dart';

class SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
}

class SearchFailedState extends SearchStates {
  final String error;

  SearchFailedState(this.error);
}

class SearchByIdLoadingState extends SearchStates {}

class SearchByIdSuccessState extends SearchStates {}

class SearchByIdFailedState extends SearchStates {
  final String error;

  SearchByIdFailedState(this.error);
}
