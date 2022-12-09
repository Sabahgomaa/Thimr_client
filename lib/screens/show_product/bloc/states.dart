part of 'bloc.dart';

class ShowProductStates {}

class ShowProductLoadingState extends ShowProductStates {}

class ShowProductSuccessState extends ShowProductStates {
}

class ShowProductFailedState extends ShowProductStates {
  final String error;

  ShowProductFailedState(this.error);
}class AddToFavoriteLoadingState extends ShowProductStates {}

class AddToFavoriteSuccessState extends ShowProductStates {
}

class AddToFavoriteFailedState extends ShowProductStates {
  final String error;

  AddToFavoriteFailedState(this.error);
}

class RemoveToFavoriteLoadingState extends ShowProductStates {}

class RemoveToFavoriteSuccessState extends ShowProductStates {}

class RemoveToFavoriteFailedState extends ShowProductStates {
  final String error;

  RemoveToFavoriteFailedState(this.error);
}
