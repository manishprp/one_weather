part of 'citites_bloc.dart';

@immutable
sealed class CititesEvent {}

class CityAddedEvent extends CititesEvent {
  final LocationModel location;
  final bool onTop;

  CityAddedEvent(this.location, {this.onTop = false});
}

class CityAddedOnTopEvent extends CititesEvent {
  final LocationModel location;

  CityAddedOnTopEvent(this.location);
}

class CityRemovedEvent extends CititesEvent {
  final LocationModel location;

  CityRemovedEvent(this.location);
}

class CityRemovedSelectedEvent extends CititesEvent {
  final List<int> indexesToRemove;

  CityRemovedSelectedEvent(this.indexesToRemove);
}
