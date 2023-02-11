part of 'bloc.dart';

class SearchEvents {}

class GetSearchEvent extends SearchEvents {}

class GetSearchByIdEvent extends SearchEvents {
  int id;

  GetSearchByIdEvent({required this.id});
}
