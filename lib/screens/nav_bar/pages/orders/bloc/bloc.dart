import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/model.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersStates> {
  final serverGate = ServerGate();
  OrderData? orderData;

  OrdersBloc() : super(OrdersStates()) {
    on<GetOrdersFinishedEvent>(_getOrdersFinished);
    on<GetOrdersCurrentEvent>(_getOrdersCurrent);
  }

  Future<void> _getOrdersFinished(
      GetOrdersFinishedEvent event, Emitter<OrdersStates> emit) async {
    emit(GetOrdersFinishedLoadingState());
    final res = await serverGate.getFromServer(url: "client/orders/finished");
    if (res.success) {
      orderData = OrderData.fromJson(res.response!.data);
      emit(GetOrdersFinishedSuccessState());
    } else {
      emit(GetOrdersFinishedFailedState(res.msg));
    }
  }

  FutureOr<void> _getOrdersCurrent(
      GetOrdersCurrentEvent event, Emitter<OrdersStates> emit) async {
    emit(GetOrdersCurrentLoadingState());
    final res = await serverGate.getFromServer(url: "client/orders/current");
    if (res.success) {
      orderData = OrderData.fromJson(res.response!.data);
      emit(GetOrdersCurrentSuccessState());
    } else {
      emit(GetOrdersCurrentFailedState(res.msg));
    }
  }
}
