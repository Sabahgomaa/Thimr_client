import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsStates> {

  final serverGate = ServerGate();

  NotificationsBloc() : super(NotificationsStates()) {
    on<GetNotificationsEvent>(_getData);
  }

  Future<void> _getData(GetNotificationsEvent event,
      Emitter<NotificationsStates> emit) async {
    emit(GetNotificationsLoadingState());
    final res = await serverGate.getFromServer(url: "end_point");
        if(res.success)
    {
      //categoriesModel = CategoriesData.fromJson(res.response!.data);
      emit(GetNotificationsSuccessState());
    }else{
    emit(GetNotificationsFailedState(res.msg));
    }

  }
}
