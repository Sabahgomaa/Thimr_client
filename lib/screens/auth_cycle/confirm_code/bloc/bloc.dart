import 'dart:io';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../../../../shared/core/cach_helper.dart';

part 'events.dart';

part 'states.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvents, ConfirmCodeStates> {
  final serverGate = ServerGate();
  final controller = CountDownController();
  final  codeController = TextEditingController();
  String currentText = "";
  bool finishTimer = false;

  ConfirmCodeBloc() : super(ConfirmCodeStates()) {
    on<ConfirmCodeEvent>(_confirmCode);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  Future<void> _confirmCode(
      ConfirmCodeEvent event, Emitter<ConfirmCodeStates> emit) async {
    emit(ConfirmCodeLoadingState());
    final res = await serverGate.sendToServer(url: "check_code", body: {
      "phone": "966" + event.phone,
      "code": codeController.text,
      "device_token": CacheHelper.getDeviceToken(),
      "type": Platform.isAndroid ? "android" : "ios",
    });
    if (res.success) {
      emit(ConfirmCodeSuccessState());
    } else {
      emit(
        ConfirmCodeFailedState(
          msg: res.msg.toString(),
        ),
      );
    }
  }
}
