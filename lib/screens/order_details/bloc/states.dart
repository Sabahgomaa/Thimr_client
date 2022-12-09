part of 'bloc.dart';

class ShowOrderStates {}

class GetShowOrderLoadingState extends ShowOrderStates {}

class GetShowOrderSuccessState extends ShowOrderStates {
}

class GetShowOrderFailedState extends ShowOrderStates {
  final String error;

  GetShowOrderFailedState(this.error);
}
