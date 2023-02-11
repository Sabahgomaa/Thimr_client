part of 'bloc.dart';

class AboutAppStates {}

class GetAboutAppLoadingState extends AboutAppStates {}

class GetAboutAppSuccessState extends AboutAppStates {
}

class GetAboutAppFailedState extends AboutAppStates {
  final String? msg;

  GetAboutAppFailedState({this.msg});
}
