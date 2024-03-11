part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvents {}

class WeatherFetchedEvent extends WeatherEvents {
  final LocationModel data;

  WeatherFetchedEvent(this.data);
}
