part of 'bloc.dart';

class EditAddressesStates {}

class EditAddressesLoadingState extends EditAddressesStates {}

class EditAddressesSuccessState extends EditAddressesStates {
}

class EditAddressesFailedState extends EditAddressesStates {
  final String error;

  EditAddressesFailedState(this.error);
}
class AddAddressesLoadingState extends EditAddressesStates {}

class AddAddressesSuccessState extends EditAddressesStates {}

class AddAddressesFailedState extends EditAddressesStates {
  final String error;

  AddAddressesFailedState(this.error);
}
