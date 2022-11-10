part of 'bloc.dart';

class NotificationsStates {}

class GetNotificationsLoadingState extends NotificationsStates {}

class GetNotificationsSuccessState extends NotificationsStates {
}

class GetNotificationsFailedState extends NotificationsStates {
  final String error;

  GetNotificationsFailedState(this.error);
}
