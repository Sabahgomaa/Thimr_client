part of 'bloc.dart';

class ProfileStates {}

class GetProfileLoadingState extends ProfileStates {}

class GetProfileSuccessState extends ProfileStates {
}

class GetProfileFailedState extends ProfileStates {
  final String error;

  GetProfileFailedState(this.error);
}

class EditProfileLoadingState extends ProfileStates {}

class EditProfileSuccessState extends ProfileStates {}

class EditProfileFailedState extends ProfileStates {
  final String error;

  EditProfileFailedState(this.error);
}
