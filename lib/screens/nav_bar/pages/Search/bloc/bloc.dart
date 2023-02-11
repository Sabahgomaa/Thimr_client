import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/Search/models/model.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

import '../models/search_by_id.dart';

part 'events.dart';

part 'states.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  final serverGate = ServerGate();
  SearchData? model;
  SearchDataById? modelById;
  String searchController = '';
  String searchByIdController = '';
  final formKey = GlobalKey<FormState>();

  SearchBloc() : super(SearchStates()) {
    on<GetSearchEvent>(_getSearch);
    on<GetSearchByIdEvent>(_getByIdSearch);
  }

  Future<void> _getSearch(
      GetSearchEvent event, Emitter<SearchStates> emit) async {
    emit(SearchLoadingState());
    final res = await serverGate.getFromServer(
        url: "search/?keyword=${searchController.trim()}",
        params: {
          'keyword': searchController.trim(),
        });
    if (res.success) {
      model = SearchData.fromJson(res.response!.data);
      emit(SearchSuccessState());
    } else {
      emit(SearchFailedState(res.msg));
    }
  }

  FutureOr<void> _getByIdSearch(
      GetSearchByIdEvent event, Emitter<SearchStates> emit) async {
    emit(SearchByIdLoadingState());
    final res = await serverGate.getFromServer(
        url: "search_category/${event.id}/?keyword=${searchByIdController.trim()}&filter=asc&min_price=1&max_price}",
        params: {
          'keyword': searchByIdController.trim(),
        });
    if (res.success) {
      modelById = SearchDataById.fromJson(res.response!.data);
      emit(SearchByIdSuccessState());
    } else {
      emit(SearchByIdFailedState(res.msg));
    }
  }
}
