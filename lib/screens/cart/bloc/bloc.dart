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
  final code = TextEditingController();
final formKey = GlobalKey<FormState>();
  CartBloc() : super(CartStates()) {
    on<CartEvents>(_getCart);
    on<ApplyCouponCartEvent>(_applyCoupon);
    on<AddCardCartEvent>(_addCard);
  }

  Future<void> _getCart(CartEvents event, Emitter<CartStates> emit) async {
    emit(GetCartLoadingState());
    final res = await serverGate.getFromServer(url: "client/cart");
    if (res.success) {
      cartData = CartData.fromJson(res.response!.data);
      emit(GetCartSuccessState());
    } else {
      emit(GetCartFailedState(res.msg));
    }
  }

  FutureOr<void> _applyCoupon(
      ApplyCouponCartEvent event, Emitter<CartStates> emit) async {
    emit(ApplyCouponLoadingState());
    final response =
        await serverGate.sendToServer(url: "client/cart/apply_coupon", body: {
      'code': code.text.trim(),
    });
    if (response.success) {
      emit(ApplyCouponSuccessState(response.msg));
    } else {
      emit(ApplyCouponFailedState(response.msg));
    }
  }

  FutureOr<void> _addCard(AddCardCartEvent event, Emitter<CartStates> emit) async {
    emit(AddCardLoadingState());
    final response = await serverGate.sendToServer(
        url: "client/cart", body: {'product_id': event.id, 'amount': 1});
    if (response.success) {
      emit(AddCardSuccessState());
    } else {
      emit(AddCardFailedState(response.msg));
    }
  }
}
