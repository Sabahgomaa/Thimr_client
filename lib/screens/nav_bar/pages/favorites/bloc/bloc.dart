import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/favorites/model.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class FavoriteBloc extends Bloc<GetFavoriteEvent, GetFavoriteStates> {
  final serverGate = ServerGate();
  FavoriteData? favoriteData;

  FavoriteBloc() : super(GetFavoriteStates()) {
    on<GetFavoriteEvent>(_getFavorite);
  }

  Future<void> _getFavorite(
      GetFavoriteEvent event, Emitter<GetFavoriteStates> emit) async {
    emit(GetFavoriteLoadingState());
    final res = await serverGate.getFromServer(url: "client/products/favorites");
    if (res.success) {
      favoriteData = FavoriteData.fromJson(res.response!.data);
      emit(GetFavoriteSuccessState());
    } else {
      emit(GetFavoriteFailedState(msg: res.msg));
    }
  }
}
