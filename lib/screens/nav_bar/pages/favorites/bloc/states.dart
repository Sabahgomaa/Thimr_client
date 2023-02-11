part of 'bloc.dart';

class GetFavoriteStates {}

class GetFavoriteLoadingState extends GetFavoriteStates {}

class GetFavoriteSuccessState extends GetFavoriteStates {
}

class GetFavoriteFailedState extends GetFavoriteStates {
  final String? msg;

  GetFavoriteFailedState({this.msg});
}
