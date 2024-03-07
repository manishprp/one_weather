part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationSuccess extends LocationState {
  final LocationData data;
  LocationSuccess(this.data);
}

final class LocationFailure extends LocationState {
  final String error;
  LocationFailure(this.error);
}
