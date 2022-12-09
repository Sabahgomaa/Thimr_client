part of 'bloc.dart';

class ShowOrderEvent {}

class GetShowOrderEvent extends ShowOrderEvent {
  int id;

  GetShowOrderEvent({required this.id});
}
