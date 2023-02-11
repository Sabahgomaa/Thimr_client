part of 'bloc.dart';

class AddressesEvent {}

class GetAddressesEvent extends AddressesEvent {}

class DeleteAddressesEvent extends AddressesEvent {
  int id;

  DeleteAddressesEvent({required this.id});
}
