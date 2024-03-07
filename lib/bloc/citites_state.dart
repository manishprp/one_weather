part of 'citites_bloc.dart';

@immutable
sealed class CititesState {}

final class CititesInitial extends CititesState {}

final class CititesNewCityAdded extends CititesState {}

final class CititesCityRemoved extends CititesState {}
