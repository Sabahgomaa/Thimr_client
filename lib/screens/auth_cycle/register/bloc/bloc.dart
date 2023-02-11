import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/core/dio_helper.dart';
import '../../../../shared/widgets/toast.dart';
import '../cities_Data.dart';
part 'events.dart';
part 'states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  final serverGate = ServerGate();

  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? cityName,cityId;

  RegisterBloc() : super(RegisterStates()) {
    on<RegisterEventStart>(_register);
    on<GetCitiesEventStart>(_getCities);
  }

  bool isDataValid(context) {
    if (fullNameController.text
        .trim()
        .isNotEmpty) {
      if (phoneController.text
          .trim()
          .isNotEmpty) {
        // if (RegExp(r"^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})").hasMatch(phoneNumberController.text.trim())) {
        //   if (cityId != null) {
        if (passwordController.text
            .trim()
            .isNotEmpty) {
          if (passwordConfirmController.text
              .trim()
              .isNotEmpty) {
            if (passwordController.text.trim() ==
                passwordConfirmController.text.trim()) {
              return true;
            } else {
              Toast.show(LocaleKeys.passwordsNotMatched.tr(), context);
              return false;
            }
          } else {
            Toast.show(LocaleKeys.PleaseWriteYourConfirmPassword.tr(), context);
            return false;
          }
        } else {
          Toast.show(LocaleKeys.PleaseWriteYourPassword.tr(), context);
          return false;
        }
        // } else {
        //   Toast.show(LocaleKeys.PleaseSelectYourCity.tr(), context);
        //   return false;
        // }
        // } else {
        //   Toast.show(LocaleKeys.PhoneNotValid.tr(), context);
        //   return false;
        // }
      } else {
        Toast.show(LocaleKeys.PleaseWriteYourPhoneNumber.tr(), context);
        return false;
      }
    } else {
      Toast.show(LocaleKeys.PleaseWriteYourName.tr(), context);
      return false;
    }
  }

  FutureOr<void> _register(RegisterEventStart event,
      Emitter<RegisterStates> emit) async {
    emit(RegisterLoadingState());
    String phone = phoneController.text.trim();
    if (phone.startsWith("0")) {
      phone = phone.substring(1);
    }
    final response =
    await serverGate.sendToServer(url: "client_register", body: {
      'fullname': fullNameController.text.trim(),
      'phone': "966" + phone,
      'city': cityName,
      'password': passwordController.text.trim(),
      'password_confirmation': passwordConfirmController.text.trim(),
    });
    if (response.success) {
      emit(RegisterSuccessState(phoneNumber: phoneController.text));
    } else {
      emit(RegisterFailedState(response.msg));
    }
  }

  FutureOr<void> _getCities(GetCitiesEventStart event,
      Emitter<RegisterStates> emit) async {
    emit(GetCitiesLoadingState());
    final res = await serverGate.getFromServer(url: "cities/1");
    if (res.success) {
      final citesData = CityDataModel.fromJson(res.response!.data);
      emit(GetCitiesSuccessState(model: citesData));
    } else {
      emit(GetCitiesFailedState(res.msg.toString()));
    }
  }
}
