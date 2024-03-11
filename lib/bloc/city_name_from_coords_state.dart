part of 'city_name_from_coords_bloc.dart';

@immutable
sealed class CityNameFromCoordsState {}

final class CityNameFromCoordsInitial extends CityNameFromCoordsState {}

final class CityNameFromCoordsLoading extends CityNameFromCoordsState {}

final class CityNameFromCoordsSuccess extends CityNameFromCoordsState {
  final String cityName;

  CityNameFromCoordsSuccess(this.cityName);
}

final class CityNameFromCoordsFailure extends CityNameFromCoordsState {
  final String error;

  CityNameFromCoordsFailure(this.error);
}
