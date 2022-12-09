import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../../nav_bar/pages/orders/model.dart';

part 'events.dart';

part 'states.dart';

class ShowOrderBloc extends Bloc<ShowOrderEvent, ShowOrderStates> {

  final serverGate = ServerGate();
  OrderData? orderData;
  ShowOrderBloc() : super(ShowOrderStates()) {
    on<GetShowOrderEvent>(_getShowOrder);
  }

  Future<void> _getShowOrder(GetShowOrderEvent event,
      Emitter<ShowOrderStates> emit) async {
    emit(GetShowOrderLoadingState());
    final res = await serverGate.getFromServer(url: "client/orders/${event.id}");
    if (res.success) {
      orderData = OrderData.fromJson(res.response!.data);
      emit(GetShowOrderSuccessState());
    } else {
      emit(GetShowOrderFailedState(res.msg));
    }
  }
}
