import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutStates> {

  final serverGate = ServerGate();
  final deviceToken = FirebaseMessaging.instance.getToken();
  LogoutBloc() : super(LogoutStates()) {
    on<LogoutEvent>(_logout);
  }

  Future<void> _logout(LogoutEvent event, Emitter<LogoutStates> emit) async {
    emit(LogoutLoadingState());
    final response = await serverGate.sendToServer(url: "logout", body: {
      'device_token': deviceToken,
      'type': Platform.isAndroid ? "android" : "ios",
    });
    if (response.success) {
      emit(LogoutSuccessState());
    } else {
      emit(LogoutFailedState(response.msg));
    }
  }
}
