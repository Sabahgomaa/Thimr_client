import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/models/product_model.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/models/slider_model.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';
import 'models/categories_details_model.dart';
import 'models/categories_model.dart';

part 'events.dart';

part 'states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  CategoriesData? categoriesModel;
  CategoriesDetailsData? categoriesDetailsData;
  SliderData? sliderData;
  ProductData? productData;
  final serverGate = ServerGate();

  //GetCategoriesDetails
  HomeBloc() : super(HomeStates()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetCategoriesDetailsEvent>(_getCategoriesDetails);
    on<GetSliderEvent>(_getSlider);
    on<GetProductsEvent>(_getProduct);
  }

  Future<void> _getCategories(
      GetCategoriesEvent event, Emitter<HomeStates> emit) async {
    emit(GetCategoriesLoadingState());
    final res = await serverGate.getFromServer(url: "categories");
    if (res.success) {
      categoriesModel = CategoriesData.fromJson(res.response!.data);
      emit(GetCategoriesSuccessState());
    } else {
      emit(GetCategoriesFailedState(res.msg));
    }
  }

  FutureOr<void> _getCategoriesDetails(
      GetCategoriesDetailsEvent event, Emitter<HomeStates> emit) async {
    emit(GetCategoriesDetailsLoadingState());
    final res = await serverGate.getFromServer(url: "categories/${event.id}");
    if (res.success) {
      categoriesDetailsData =
          CategoriesDetailsData.fromJson(res.response!.data);
      emit(GetCategoriesDetailsSuccessState());
    } else {
      emit(GetCategoriesDetailsFailedState(res.msg));
    }
  }

  FutureOr<void> _getSlider(
      GetSliderEvent event, Emitter<HomeStates> emit) async {
    emit(GetSliderLoadingState());
    final res = await serverGate.getFromServer(url: 'sliders');
    if (res.success) {
      sliderData = SliderData.fromJson(res.response!.data);
      emit(GetSliderSuccessState());
    } else {
      emit(GetSliderFailedState(res.msg));
    }
  }

  FutureOr<void> _getProduct(
      GetProductsEvent event, Emitter<HomeStates> emit) async {
    emit(GetProductsLoadingState());
    final res = await serverGate.getFromServer(url: "products");
    if (res.success) {
      productData = ProductData.fromJson(res.response!.data);
      emit(GetProductsSuccessState());
    } else {
      emit(GetProductsFailedState(res.msg));
    }
  }
}
