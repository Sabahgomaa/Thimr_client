part of 'bloc.dart';

class ConfirmCodeEvents {}

class ConfirmCodeEvent extends ConfirmCodeEvents {
  final String phone;

  ConfirmCodeEvent({required this.phone});
}
