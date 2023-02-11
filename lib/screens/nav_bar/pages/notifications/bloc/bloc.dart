import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationStates> {
  final serverGate = ServerGate();
  NotificationsData? notificationsData;

  NotificationBloc() : super(NotificationStates()) {
    on<GetNotificationEvent>(_getNotification);
  }

  Future<void> _getNotification(
      GetNotificationEvent event, Emitter<NotificationStates> emit) async {
    emit(GetNotificationLoadingState());
    final res = await serverGate.getFromServer(url: "notifications");
    if (res.success) {
      notificationsData = NotificationsData.fromJson(res.response!.data);
      emit(GetNotificationSuccessState());
    } else {
      emit(GetNotificationFailedState(msg: res.msg));
    }
  }
}
