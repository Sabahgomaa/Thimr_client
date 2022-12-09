import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class FAQSBloc extends Bloc<FAQSEvents, FAQSStates> {

  final serverGate = ServerGate();
  FAQsData? faQsData;
  FAQSBloc() : super(FAQSStates()) {
    on<GetFAQsEvent>(_getFAQs);
  }

  Future<void> _getFAQs(GetFAQsEvent event, Emitter<FAQSStates> emit) async {
    emit(GetFAQsLoadingState());
    final res = await serverGate.getFromServer(url: "faqs");
    if (res.success) {
      faQsData = FAQsData.fromJson(res.response!.data);
      emit(GetFAQsSuccessState());
    } else {
      emit(GetFAQsFailedState(res.msg));
    }
  }
}
