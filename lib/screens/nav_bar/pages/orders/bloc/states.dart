part of 'bloc.dart';

class OrdersStates {}

class GetOrdersFinishedLoadingState extends OrdersStates {}

class GetOrdersFinishedSuccessState extends OrdersStates {
}

class GetOrdersFinishedFailedState extends OrdersStates {
  final String? msg;

  GetOrdersFinishedFailedState({this.msg});
}

class GetOrdersCurrentLoadingState extends OrdersStates {}

class GetOrdersCurrentSuccessState extends OrdersStates {}

class GetOrdersCurrentFailedState extends OrdersStates {
  final String? msg;

  GetOrdersCurrentFailedState({this.msg});
}
