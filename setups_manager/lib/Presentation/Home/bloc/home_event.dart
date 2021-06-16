part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchAllSetups extends HomeEvent {}

class DeleteSetup extends HomeEvent {
  final String id;

  DeleteSetup(this.id);
}
