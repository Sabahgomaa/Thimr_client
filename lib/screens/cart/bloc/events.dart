part of 'bloc.dart';

class CartEvents {}

class GetCartEvent extends CartEvents {}

class ApplyCouponCartEvent extends CartEvents {}

class AddCardCartEvent extends CartEvents {
  int id;

  AddCardCartEvent({required this.id});
}
