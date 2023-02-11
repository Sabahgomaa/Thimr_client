import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class SuggestionsAndComplaintsBloc extends Bloc<SuggestionsAndComplaintsEvents,
    SuggestionsAndComplaintsStates> {
  final serverGate = ServerGate();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SuggestionsAndComplaintsBloc() : super(SuggestionsAndComplaintsStates()) {
    on<SuggestionsAndComplaintsEvent>(_contact);
  }

  Future<void> _contact(SuggestionsAndComplaintsEvent event,
      Emitter<SuggestionsAndComplaintsStates> emit) async {
    emit(SuggestionsAndComplaintsLoadingState());
    CustomResponse response =
        await serverGate.sendToServer(url: "contact", body: {
      'fullname': fullNameController.text,
      'phone': phoneController.text,
      'content': contentController.text,
    });
    if (response.success) {
      emit(SuggestionsAndComplaintsSuccessState(msg: response.msg));
    } else {
      emit(SuggestionsAndComplaintsFailedState(msg: response.msg));
    }
  }
}
