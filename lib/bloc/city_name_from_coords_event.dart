part of 'city_name_from_coords_bloc.dart';

@immutable
sealed class CityNameFromCoordsEvent {}

class CityNameFetchedFRomCoordsEvent extends CityNameFromCoordsEvent {
  final double latitude;
  final double longitude;

  CityNameFetchedFRomCoordsEvent(this.latitude, this.longitude);
}
