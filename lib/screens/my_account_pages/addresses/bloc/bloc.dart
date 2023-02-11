import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class AddressesBloc extends Bloc<AddressesEvent, AddressesStates> {
  final serverGate = ServerGate();
  AddressesData? addressesData;
  String? type, location;



  AddressesBloc() : super(AddressesStates()) {
    on<GetAddressesEvent>(_getAddresses);

    on<DeleteAddressesEvent>(_deleteAddresses);
  }

  Future<void> _getAddresses(
      GetAddressesEvent event, Emitter<AddressesStates> emit) async {
    emit(GetAddressesLoadingState());
    final res = await serverGate.getFromServer(url: "client/addresses");
    if (res.success) {
      addressesData = AddressesData.fromJson(res.response!.data);
      emit(GetAddressesSuccessState());
    } else {
      emit(GetAddressesFailedState(msg: res.msg));
    }
  }

  FutureOr<void> _deleteAddresses(
      DeleteAddressesEvent event, Emitter<AddressesStates> emit) async {
    final response = await serverGate
        .sendToServer(url: "client/addresses/${event.id}", body: {
      'type': type,
      "_method": "DELETE",
    });
    if (response.success) {
      emit(DeleteAddressesSuccessState());
    } else {
      emit(DeleteAddressesFailedState(msg: response.msg));
    }
  }
}
