import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/models/add_favorite.dart';
import 'package:thimar_client/models/remove_favorite.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class ShowProductBloc extends Bloc<ShowProductEvents, ShowProductStates> {
  final serverGate = ServerGate();
  ShowProductData? showProductData;
  RemoveFavoriteModel? removeFavoriteModel;
  AddFavoriteModel? addFavoriteModel;

  ShowProductBloc() : super(ShowProductStates()) {
    on<ShowProductEvent>(_getShowProduct);
    on<AddToFavoriteEvent>(_addToFavorite);
    on<RemoveToFavoriteEvent>(_removeToFavorite);
  }

  Future<void> _getShowProduct(
      ShowProductEvent event, Emitter<ShowProductStates> emit) async {
    emit(ShowProductLoadingState());
    final res = await serverGate.getFromServer(url: "products/${event.id}");
    if (res.success) {
      showProductData = ShowProductData.fromJson(res.response!.data);
      emit(ShowProductSuccessState());
    } else {
      emit(ShowProductFailedState(res.msg));
    }
  }

  FutureOr<void> _addToFavorite(
      AddToFavoriteEvent event, Emitter<ShowProductStates> emit) async {
    emit(AddToFavoriteLoadingState());
    final res = await serverGate.sendToServer(
        url: "client/products/${event.id}/add_to_favorite");
    if (res.success) {
      addFavoriteModel = AddFavoriteModel.fromJson(res.response!.data);
      emit(AddToFavoriteSuccessState());
    } else {
      emit(AddToFavoriteFailedState(res.msg));
    }
  }

  FutureOr<void> _removeToFavorite(
      RemoveToFavoriteEvent event, Emitter<ShowProductStates> emit) async {
    emit(RemoveToFavoriteLoadingState());
    final res = await serverGate.sendToServer(
        url: "client/products/${event.id}/remove_from_favorite");
    if (res.success) {
      removeFavoriteModel = RemoveFavoriteModel.fromJson(res.response!.data);
      emit(RemoveToFavoriteSuccessState());
    } else {
      emit(RemoveToFavoriteFailedState(res.msg));
    }
  }
}
