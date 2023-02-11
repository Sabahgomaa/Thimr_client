part of 'bloc.dart';

class NotificationStates {}

class GetNotificationLoadingState extends NotificationStates {}

class GetNotificationSuccessState extends NotificationStates {
}

class GetNotificationFailedState extends NotificationStates {
  final String? msg;

  GetNotificationFailedState({this.msg});
}
