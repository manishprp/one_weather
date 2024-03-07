part of 'citites_bloc.dart';

@immutable
sealed class CititesEvent {}

class CityAddedEvent extends CititesEvent {
  final LocationModel location;

  CityAddedEvent(this.location);
}

class CityRemovedEvent extends CititesEvent {
  final LocationModel location;

  CityRemovedEvent(this.location);
}
