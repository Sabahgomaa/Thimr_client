import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/core/dio_helper.dart';
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
  CitesData? citesData;
  String? cityDropDownValue;

  RegisterBloc() : super(RegisterStates()) {
    on<RegisterEventStart>(_register);
    on<GetCitiesEventStart>(_getCities);
  }

  FutureOr<void> _register(
      RegisterEventStart event, Emitter<RegisterStates> emit) async {
    emit(RegisterLoadingState());
    final response =
        await serverGate.sendToServer(url: "client_register", body: {
      'fullname': fullNameController.text.trim(),
      'phone': phoneController.text.trim(),
      'city': cityDropDownValue,
      'password': passwordController.text.trim(),
      'password_confirmation': passwordConfirmController.text.trim(),
    });
    if (response.success) {
      emit(RegisterSuccessState(phoneNumber: phoneController.text));
    } else {
      emit(RegisterFailedState(response.msg));
    }
  }

  FutureOr<void> _getCities(
      GetCitiesEventStart event, Emitter<RegisterStates> emit) async {
    emit(GetCitiesLoadingState());
    final res = await serverGate.getFromServer(url: "cities/1");
    if (res.success) {
      citesData = CitesData.fromJson(res.response!.data);
      emit(GetCitiesSuccessState());
    } else {
      emit(GetCitiesFailedState(res.msg));
    }
  }

  changeCityDropDown({required String? value}) {
    cityDropDownValue = value;
    emit(ChangeCityDropDownState());
  }
}
