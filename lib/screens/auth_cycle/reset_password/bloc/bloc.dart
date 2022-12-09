import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordStates> {
  final serverGate = ServerGate();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final code = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ResetPasswordBloc() : super(ResetPasswordStates()) {
    on<ResetPasswordEvent>(_resetPassword);
  }

  Future<void> _resetPassword(
      ResetPasswordEvent event, Emitter<ResetPasswordStates> emit) async {
    emit(ResetPasswordLoadingState());
    final response =
        await serverGate.sendToServer(url: "reset_password", body: {
      'phone': phoneController.text.trim(),
      'password': passwordController.text.trim(),
      'code': code.text.trim(),
    });
    if (response.success) {
      emit(ResetPasswordSuccessState());
    } else {
      emit(ResetPasswordFailedState(response.msg));
    }
  }
}
