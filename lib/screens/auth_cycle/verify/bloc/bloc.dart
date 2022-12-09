import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/cach_helper.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class VerifyBloc extends Bloc<VerifyEvents, VerifyStates> {
  final serverGate = ServerGate();
  String? codeController;
  final formKey = GlobalKey<FormState>();
  final deviceToken = FirebaseMessaging.instance.getToken();

  VerifyBloc() : super(VerifyStates()) {
    on<VerifyEventStart>(_verify);
  }

  Future<void> _verify(
      VerifyEventStart event, Emitter<VerifyStates> emit) async {
    emit(VerifyLoadingState());
    final response = await serverGate.sendToServer(url: "verify", body: {
      'code': codeController!.trim(),
      'phone': event.phoneNumber,
      'device_token': deviceToken,
      'type': Platform.isAndroid ? "android" : "ios",
    });
    if (response.success) {
      UserModel user =UserModel.fromJson(response.response!.data);
      CacheHelper.setDeviceToken(deviceToken.toString());
      CacheHelper.setUserToken(user.data.token);
      CacheHelper.setPhone(user.data.phone);
      CacheHelper.setUserId(user.data.id);
      CacheHelper.setName(user.data.fullName);
      CacheHelper.setImage(user.data.image);
      emit(VerifySuccessState());
    } else {
      emit(VerifyFailedState(response.msg));
    }
  }
}
