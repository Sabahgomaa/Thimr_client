import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';
import '../model.dart';

part 'events.dart';

part 'states.dart';

class ContactUsBloc extends Bloc<ContactUsEvents, ContactUsStates> {
  final serverGate = ServerGate();
  ContactUsData? contactUsData;
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ContactUsBloc() : super(ContactUsStates()) {
    on<GetContactUsEvent>(_getContactUs);
    on<ContactUsEvent>(_contact);
  }

  Future<void> _getContactUs(
      GetContactUsEvent event, Emitter<ContactUsStates> emit) async {
    emit(GetContactUsLoadingState());
    final res = await serverGate.getFromServer(url: "contact");
    if (res.success) {
      contactUsData = ContactUsData.fromJson(res.response!.data);
      emit(GetContactUsSuccessState());
    } else {
      emit(GetContactUsFailedState(res.msg));
    }
  }

  FutureOr<void> _contact(
      ContactUsEvent event, Emitter<ContactUsStates> emit) async {
    emit(ContactUsLoadingState());
    CustomResponse response =
        await serverGate.sendToServer(url: "contact", body: {
      'fullname': fullNameController.text.trim(),
      'phone': phoneController.text.trim(),
      'content': contentController.text.trim(),
    });
    if (response.success) {
      emit(ContactUsSuccessState(response.msg));
    } else {
      emit(ContactUsFailedState(response.msg));
    }
  }
}
