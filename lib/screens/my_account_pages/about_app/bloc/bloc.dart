import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class AboutAppBloc extends Bloc<AboutAppEvents, AboutAppStates> {

  final serverGate = ServerGate();
  AboutData? aboutData;
  AboutAppBloc() : super(AboutAppStates()) {
    on<GetAboutAppEvent>(_getAboutApp);
  }

  Future<void> _getAboutApp(GetAboutAppEvent event,
      Emitter<AboutAppStates> emit) async {
    emit(GetAboutAppLoadingState());
    final res = await serverGate.getFromServer(url: "about");
    if (res.success) {
      aboutData = AboutData.fromJson(res.response!.data);
      emit(GetAboutAppSuccessState());
    } else {
      emit(GetAboutAppFailedState(msg: res.msg));
    }
  }
}
