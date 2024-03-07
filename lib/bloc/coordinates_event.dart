part of 'coordinates_bloc.dart';

@immutable
sealed class CoordinatesEvent {}

class CoordinatedFetchFromCityNameEvent extends CoordinatesEvent {
  final String cityName;

  CoordinatedFetchFromCityNameEvent(this.cityName);
}
