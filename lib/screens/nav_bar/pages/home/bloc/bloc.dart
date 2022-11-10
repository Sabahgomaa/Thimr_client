import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/models/categories_model.dart';
import 'package:thimar_client/shared/const/end_point.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  CategoriesData? categoriesModel;
  final serverGate = ServerGate();

  //GetCategoriesDetails
  HomeBloc() : super(HomeStates()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetCategoriesDetailsEvent>(_getCategoriesDetails());
  }

  Future<void> _getCategories(
      GetCategoriesEvent event, Emitter<HomeStates> emit) async {
    emit(GetCategoriesLoadingState());
    final res = await serverGate.getFromServer(url: categories);
    if (res.success) {
      categoriesModel = CategoriesData.fromJson(res.response!.data);
      emit(GetCategoriesSuccessState());
    } else {
      emit(GetCategoriesFailedState(res.msg));
    }
  }

  FutureOr<void> _getCategoriesDetails(GetCategoriesDetailsEvent event, Emitter<HomeStates> emit) async {
    emit(GetCategoriesLoadingState());
    final res = await serverGate.getFromServer(url: categories+id.toString());
    if (res.success) {
      categoriesModel = CategoriesData.fromJson(res.response!.data);
      emit(GetCategoriesSuccessState());
    } else {
      emit(GetCategoriesFailedState(res.msg));
    }
  }
}
