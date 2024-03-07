part of 'coordinates_bloc.dart';

@immutable
sealed class CoordinatesState {}

final class CoordinatesInitial extends CoordinatesState {}

final class CoordinatesLoading extends CoordinatesState {}

final class CoordinatesFound extends CoordinatesState {
  final List<Location> locations;

  CoordinatesFound(this.locations);
}

final class CoordinatesError extends CoordinatesState {
  final String error;

  CoordinatesError(this.error);
}
