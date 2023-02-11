import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  final serverGate = ServerGate();
  CartData? cartData;
  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int amount = 1;

  CartBloc() : super(CartStates()) {
    on<CartEvents>(_getCart);
    on<ApplyCouponCartEvent>(_applyCoupon);
    on<DeleteCartEvent>(_deleteCart);
     // on<AddCartEvent>(_addCart);
  }

  Future<void> _getCart(CartEvents event, Emitter<CartStates> emit) async {
    emit(GetCartLoadingState());
    final res = await serverGate.getFromServer(url: "client/cart");
    if (res.success) {
      cartData = CartData.fromJson(res.response!.data);

      emit(GetCartSuccessState());
    } else {
      emit(GetCartFailedState(msg: res.msg));
    }
  }

  FutureOr<void> _applyCoupon(
      ApplyCouponCartEvent event, Emitter<CartStates> emit) async {
    emit(ApplyCouponLoadingState());
    final response =
        await serverGate.sendToServer(url: "client/cart/apply_coupon", body: {
      'code': codeController.text.trim(),
    });
    if (response.success) {
      emit(ApplyCouponSuccessState(msg: response.msg));
    } else {
      emit(ApplyCouponFailedState(msg: response.msg));
    }
  }

  FutureOr<void> _deleteCart(
      DeleteCartEvent event, Emitter<CartStates> emit) async {
    emit(DeleteCartLoadingState());
    final response = await serverGate.sendToServer(
      url: "client/cart/delete_item/${event.id}",
      body: {
        "_method": "DELETE",
      },
    );
    if (response.success) {
      await Future.delayed(Duration.zero, () {
        cartData!.data.removeWhere((element) => element.id == event.id);
      });
      emit(DeleteCartSuccessState());
    } else {
      emit(DeleteCartFailedState(msg: response.msg));
    }
  }

// FutureOr<void> _addCart(AddCartEvent event, Emitter<CartStates> emit) async {
//   emit(AddCartLoadingState());
//   final response = await serverGate.sendToServer(
//       url: "client/cart", body: {'product_id': event.id, 'amount': amount});
//   if (response.success) {
//     emit(AddCartSuccessState());
//   } else {
//     emit(AddCartFailedState(msg: response.msg));
//   }
// }

}
