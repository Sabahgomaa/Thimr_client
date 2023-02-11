part of 'bloc.dart';

class RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final phoneNumber;

  RegisterSuccessState({required this.phoneNumber});
}

class RegisterFailedState extends RegisterStates {
  final String error;

  RegisterFailedState(this.error);
}

class GetCitiesLoadingState extends RegisterStates {}

class GetCitiesSuccessState extends RegisterStates {
  final CityDataModel model;

  GetCitiesSuccessState({required this.model});
}

class GetCitiesFailedState extends RegisterStates {
  final String error;

  GetCitiesFailedState(this.error);
}
class ChangeCityDropDownState extends RegisterStates {}
