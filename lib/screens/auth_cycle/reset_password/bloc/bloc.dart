import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordStates> {
  final serverGate = ServerGate();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ResetPasswordBloc() : super(ResetPasswordStates()) {
    on<ResetPasswordEvent>(_resetPassword);
  }

  Future<void> _resetPassword(
      ResetPasswordEvent event, Emitter<ResetPasswordStates> emit) async {
    emit(ResetPasswordLoadingState());
    final response =
        await serverGate.sendToServer(url: "reset_password", body: {
      'phone': event.phone,
      'code': event.code,
      'password': passwordController.text.trim(),
    });
    if (response.success) {
      emit(ResetPasswordSuccessState());
    } else {
      emit(ResetPasswordFailedState(msg: response.msg.toString()));
    }
  }
}
