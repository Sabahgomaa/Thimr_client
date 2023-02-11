import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thimar_client/models/product_model.dart';
import 'package:thimar_client/models/slider_model.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';
import '../../../../../models/categories_details_model.dart';
import '../../../../../models/categories_model.dart';

part 'events.dart';

part 'states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  CategoriesData? categoriesModel;
  CategoriesDetailsData? categoriesDetailsData;
  SliderData? sliderData;
  List<Products> products = [];
  List<Products> newProducts = [];
  ProductData? productData;
  int pageNumber = 1;
  bool paginationEnded = false;
  final serverGate = ServerGate();

  HomeBloc() : super(HomeStates()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetCategoriesDetailsEvent>(_getCategoriesDetails);
    on<GetSliderEvent>(_getSlider);
    on<GetProductsEvent>(_getProduct);
    on<StartPaginationEvent>(_pagination);
  }

  Future<void> _getCategories(
      GetCategoriesEvent event, Emitter<HomeStates> emit) async {
    emit(GetCategoriesLoadingState());
    final res = await serverGate.getFromServer(url: "categories");
    if (res.success) {
      //  List data = List<Model>.from((res.response?.data??[]).map((e)=>Model.fromJson(e)));
      categoriesModel = CategoriesData.fromJson(res.response!.data);
      emit(GetCategoriesSuccessState());
    } else {
      emit(GetCategoriesFailedState(msg: res.msg));
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
      emit(GetCategoriesDetailsFailedState(msg: res.msg));
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
      emit(GetSliderFailedState(msg: res.msg));
    }
  }

  FutureOr<void> _getProduct(
      GetProductsEvent event, Emitter<HomeStates> emit) async {
    emit(GetProductsLoadingState());
    //newProducts.clear();
    final res = await serverGate.getFromServer(url: "products");
    if (res.success) {
      productData = ProductData.fromJson(res.response!.data);
      newProducts = productData!.products;
      products.addAll(newProducts);
      emit(GetProductsSuccessState());
    } else {
      emit(GetProductsFailedState(msg: res.msg));
    }
  }

  void reload() async {
    newProducts.clear();
    pageNumber++;
    add(GetProductsEvent());
    if (newProducts == products) {
      newProducts.clear();
    }
    refreshController.loadComplete();
  }

  void refresh() async {
    products.clear();
    pageNumber = 1;
    add(GetProductsEvent());
    refreshController.refreshCompleted();
  }

  FutureOr<void> _pagination(
      StartPaginationEvent event, Emitter<HomeStates> emit) async {
    emit(GetProductsLoadingState());
    await Future.delayed(const Duration(seconds: 3)); // streaming get next page

    int length = products.length > 10 ? 10 : products.length;
    for (int i = 0; i < length; i++) {
      final item = products.removeAt(i);
      newProducts.add(item);
    }
    if (products.isEmpty) {
      paginationEnded = true;
    } else {
      pageNumber++;
    }
    emit(GetProductsSuccessState());
  }
}
