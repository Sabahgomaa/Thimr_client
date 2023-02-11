part of 'bloc.dart';

class ResetPasswordEvents {}

class ResetPasswordEvent extends ResetPasswordEvents {
  final String phone,code;

  ResetPasswordEvent({required this.phone, required this.code});
}
