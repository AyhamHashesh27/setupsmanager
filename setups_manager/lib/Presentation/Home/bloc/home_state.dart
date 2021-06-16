part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Setup> setupsList;

  HomeLoaded(this.setupsList);
}

class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);
}

class DeleteSetupSuccess extends HomeState {}

class DeleteSetupFailed extends HomeState {}
