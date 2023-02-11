import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/cach_helper.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';
import 'package:thimar_client/screens/auth_cycle/verify/model.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/core/firebase_notification.dart';

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

  void init() async {
    print("hello");
    await GlobalNotification.getFcmToken().then((value) {
      print(value);
      CacheHelper.setDeviceToken(value);
      emit(LogInStates());
    });
  }

  clearFields() {
    phoneLoginController.clear();
    passwordLoginController.clear();
  }

  disposeFields() {
    phoneLoginController.dispose();
    passwordLoginController.dispose();
  }

  Future<void> _login(LoginEventStart event, Emitter<LogInStates> emit) async {
    emit(LoginLoadingState());
    final response = await serverGate.sendToServer(url: "login", body: {
      'phone': "966${phoneLoginController.text.trim()}",
      'password': passwordLoginController.text.trim(),
      'device_token': await GlobalNotification.getFcmToken(),
      'type': Platform.isAndroid ? "android" : "ios",
      'user_type': 'client',
    });
    if (response.success) {
      if ((response.response!.data['data']['user_type'] == "driver")) {
        emit(LoginFailedState(msg: LocaleKeys.loginFailed.tr()));
      } else {
        UserModel user = UserModel.fromJson(response.response!.data);
        CacheHelper.setDeviceToken(deviceToken.toString());
        CacheHelper.setUserToken(user.data.token);
        CacheHelper.setPhone(user.data.phone);
        CacheHelper.setUserId(user.data.id);
        CacheHelper.setName(user.data.fullName);
        CacheHelper.setImage(user.data.image);
        emit(LoginSuccessState(msg: response.response!.data['message']));
      }
    } else {
      emit(LoginFailedState(
          msg: response.msg, isActive: response.response!.data["is_active"]));
    }
  }
}
