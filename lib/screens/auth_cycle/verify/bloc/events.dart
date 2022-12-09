part of 'bloc.dart';

class VerifyEvents {}

class VerifyEventStart extends VerifyEvents {
 String phoneNumber;

 VerifyEventStart({required this.phoneNumber});
}
