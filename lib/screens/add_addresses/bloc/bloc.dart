import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class EditAddressesBloc extends Bloc<EditAddressesEvents, EditAddressesStates> {
  final serverGate = ServerGate();
  double lat = 2.2, lang = 2.2;
  String? type, location;
  final phoneNumberController = TextEditingController();
  final descriptionController = TextEditingController();

  EditAddressesBloc() : super(EditAddressesStates()) {
    on<EditAddressesEvent>(_editAddresses);
    on<AddAddressesEvent>(_addAddresses);
  }

  Future<void> _editAddresses(
      EditAddressesEvent event, Emitter<EditAddressesStates> emit) async {
    emit(EditAddressesLoadingState());
    final res = await serverGate.getFromServer(url: "end_point");
    if (res.success) {
      //categoriesModel = CategoriesData.fromJson(res.response!.data);
      emit(EditAddressesSuccessState());
    } else {
      emit(EditAddressesFailedState(res.msg));
    }
  }

  FutureOr<void> _addAddresses(
      AddAddressesEvent event, Emitter<EditAddressesStates> emit) async {
    final response =
        await serverGate.sendToServer(url: "client/addresses", body: {
      'type': type,
      'phone': phoneNumberController.text.trim(),
      'description': descriptionController.text.trim(),
      'location': location,
      'lat': lat,
      'lng': lang,
      'is_default': '1',
    });
    if (response.success) {
      // AddAddressesData user =AddAddressesData.fromJson(response.response!.data);

      emit(AddAddressesSuccessState());
    } else {
      emit(AddAddressesFailedState(response.msg));
    }
  }
}
