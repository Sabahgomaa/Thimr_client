import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  final serverGate = ServerGate();
  ProfileData? profileData;
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ProfileBloc() : super(ProfileStates()) {
    on<GetProfileEvent>(_getProfile);
    on<EditProfileEvent>(_editProfile);
  }

  Future<void> _getProfile(
      GetProfileEvent event, Emitter<ProfileStates> emit) async {
    emit(GetProfileLoadingState());
    final res = await serverGate.getFromServer(url: "client/profile");
    if (res.success) {
      profileData = ProfileData.fromJson(res.response!.data);
      fullNameController.text = profileData!.data.fullname.toString();
      phoneController.text = profileData!.data.phone.toString();
      emit(GetProfileSuccessState());
    } else {
      emit(GetProfileFailedState(res.msg));
    }
  }

  FutureOr<void> _editProfile(
      EditProfileEvent event, Emitter<ProfileStates> emit) async {
    emit(EditProfileLoadingState());
    CustomResponse response =
        await serverGate.sendToServer(url: "client/profile", body: {
      'fullname': fullNameController.text.trim(),
      'phone': phoneController.text.trim(),
      'password': passwordController.text.trim(),
      // 'city_id':"",
      //'image':""
    });
    if (response.success) {}
  }
}
