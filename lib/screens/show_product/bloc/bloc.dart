import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../models/model.dart';
import '../models/product_rate_model.dart';

part 'events.dart';

part 'states.dart';

class ShowProductBloc extends Bloc<ShowProductEvents, ShowProductStates> {
  final serverGate = ServerGate();
  ShowProductData? showProductData;
  ProductRateData? productRateData;
  int amount = 1;

  ShowProductBloc() : super(ShowProductStates()) {
    on<ShowProductEvent>(_getShowProduct);
    on<AddToFavoriteEvent>(_addToFavorite);
    on<RemoveToFavoriteEvent>(_removeToFavorite);
    on<GetProductRateEvent>(_getProductRate);
    on<AddCartEvent>(_addCart);
  }

  Future<void> _getShowProduct(
      ShowProductEvent event, Emitter<ShowProductStates> emit) async {
    emit(ShowProductLoadingState());
    final res = await serverGate.getFromServer(url: "products/${event.id}");
    if (res.success) {
      showProductData = ShowProductData.fromJson(res.response!.data);
      emit(ShowProductSuccessState());
    } else {
      emit(ShowProductFailedState(error: res.msg));
    }
  }

  FutureOr<void> _addToFavorite(
      AddToFavoriteEvent event, Emitter<ShowProductStates> emit) async {
    emit(AddToFavoriteLoadingState());
    final res = await serverGate.sendToServer(
        url: "client/products/${event.id}/add_to_favorite");
    if (res.success) {
      emit(AddToFavoriteSuccessState());
    } else {
      emit(AddToFavoriteFailedState(error: res.msg));
    }
  }

  FutureOr<void> _removeToFavorite(
      RemoveToFavoriteEvent event, Emitter<ShowProductStates> emit) async {
    emit(RemoveToFavoriteLoadingState());
    final res = await serverGate.sendToServer(
        url: "client/products/${event.id}/remove_from_favorite");
    if (res.success) {
      emit(RemoveToFavoriteSuccessState());
    } else {
      emit(RemoveToFavoriteFailedState(error: res.msg));
    }
  }

  FutureOr<void> _getProductRate(
      GetProductRateEvent event, Emitter<ShowProductStates> emit) async {
    emit(GetProductRateLoadingState());
    final res = await serverGate.getFromServer(url: "products/2/rates");
    if (res.success) {
      productRateData = ProductRateData.fromJson(res.response!.data);
      emit(GetProductRateSuccessState());
    } else {
      emit(GetProductRateFailedState(error: res.msg));
    }
  }

  FutureOr<void> _addCart(
      AddCartEvent event, Emitter<ShowProductStates> emit) async {
    emit(AddCartLoadingState());
    final response = await serverGate.sendToServer(
        url: "client/cart", body: {'product_id': event.id, 'amount': amount});
    if (response.success) {
      emit(AddCartSuccessState());
    } else {
      emit(AddCartFailedState(msg: response.msg));
    }
  }
}
