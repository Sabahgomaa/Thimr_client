import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../model.dart';

part 'events.dart';

part 'states.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  final serverGate = ServerGate();
  SearchData? model;
  String searchController='';
  final formKey = GlobalKey<FormState>();


  SearchBloc() : super(SearchStates()) {
    on<GetSearchEvent>(_getSearch);
  }

  Future<void> _getSearch(GetSearchEvent event, Emitter<SearchStates> emit) async {
    emit(SearchLoadingState());
    final res = await serverGate.getFromServer(url: "search/?keyword=${searchController.trim()}",params: {
      'keyword':searchController.trim(),
    });
    if (res.success) {
      model = SearchData.fromJson(res.response!.data);
      emit(SearchSuccessState());
    } else {
      emit(SearchFailedState(res.msg));
    }
  }
}
