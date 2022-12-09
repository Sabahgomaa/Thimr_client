import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/cach_helper.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';
import 'package:thimar_client/screens/auth_cycle/verify/model.dart';
part 'events.dart';

part 'states.dart';

class LogInBloc extends Bloc<LoginEvents, LogInStates> {
  final serverGate = ServerGate();
  final phoneLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();
  final formLoginKey = GlobalKey<FormState>();


  final deviceToken = FirebaseMessaging.instance.getToken();

  LogInBloc() : super(LogInStates()) {
    on<LoginEventStart>(_login);
  }

  Future<void> _login(LoginEventStart event, Emitter<LogInStates> emit) async {
    emit(LoginLoadingState());
    final response = await serverGate.sendToServer(url: "login", body: {
      'phone': phoneLoginController.text.trim(),
      'password': passwordLoginController.text.trim(),
      'device_token': deviceToken,
      'type': Platform.isAndroid ? "android" : "ios",
      'user_type': 'client',
    });
    if (response.success) {
      UserModel user = UserModel.fromJson(response.response!.data);
      CacheHelper.setDeviceToken(deviceToken.toString());
      CacheHelper.setUserToken(user.data.token);
      CacheHelper.setPhone(user.data.phone);
      CacheHelper.setUserId(user.data.id);
      CacheHelper.setName(user.data.fullName);
      CacheHelper.setImage(user.data.image);
      // CacheHelper.setUserToken(response.response!.data.token);
      // CacheHelper.setDeviceToken(deviceToken.toString());
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState(response.msg));
    }
  }
}
