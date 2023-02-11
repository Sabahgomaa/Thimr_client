import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvents, PrivacyPolicyStates> {
  final serverGate = ServerGate();

  PolicyData? policyData;

  PrivacyPolicyBloc() : super(PrivacyPolicyStates()) {
    on<GetPolicyEvent>(_getPolicy);
  }

  Future<void> _getPolicy(
      GetPolicyEvent event, Emitter<PrivacyPolicyStates> emit) async {
    emit(GetPolicyLoadingState());
    final res = await serverGate.getFromServer(url: "policy");
    if (res.success) {
      policyData = PolicyData.fromJson(res.response!.data);
      emit(GetPolicySuccessState());
    } else {
      emit(GetPolicyFailedState(msg: res.msg));
    }
  }
}
