part of 'bloc.dart';

class ShowProductEvents {}

class ShowProductEvent extends ShowProductEvents {
  int id;

  ShowProductEvent({required this.id});
}
class AddToFavoriteEvent extends ShowProductEvents {
  int id;

  AddToFavoriteEvent({required this.id});
}

class RemoveToFavoriteEvent extends ShowProductEvents {
  int id;

  RemoveToFavoriteEvent({required this.id});
}
