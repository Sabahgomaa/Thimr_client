part of 'bloc.dart';

class AddressesStates {}

class GetAddressesLoadingState extends AddressesStates {}

class GetAddressesSuccessState extends AddressesStates {
}

class GetAddressesFailedState extends AddressesStates {
  final String error;

  GetAddressesFailedState(this.error);
}


class DeleteAddressesLoadingState extends AddressesStates {}

class DeleteAddressesSuccessState extends AddressesStates {}

class DeleteAddressesFailedState extends AddressesStates {
  final String error;

  DeleteAddressesFailedState(this.error);
}
