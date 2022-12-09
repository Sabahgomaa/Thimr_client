import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordStart, ForgetPasswordStates> {
  final serverGate = ServerGate();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ForgetPasswordBloc() : super(ForgetPasswordStates()) {
    on<ForgetPasswordStart>(_forgetPassword);
  }

  Future<void> _forgetPassword(
      ForgetPasswordStart event, Emitter<ForgetPasswordStates> emit) async {
    emit(ForgetPasswordLoadingState());
    final response = await serverGate.sendToServer(url: "forget_password", body: {
      'phone': phoneController.text.trim(),
    });
    if (response.success) {
      emit(ForgetPasswordSuccessState());
    } else {
      emit(ForgetPasswordFailedState(response.msg));
    }
  }
}
