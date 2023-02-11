part of 'bloc.dart';

class CartEvents {}

class GetCartEvent extends CartEvents {}

class ApplyCouponCartEvent extends CartEvents {}

class DeleteCartEvent extends CartEvents {
  int id;

  DeleteCartEvent({required this.id});
}
// class AddCartEvent extends CartEvents {
//   final int id;
//
//
//   AddCartEvent({required this.id,});
// }


