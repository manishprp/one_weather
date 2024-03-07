part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvents {}

class WeatherFetchedEvent extends WeatherEvents {
  final LocationData data;

  WeatherFetchedEvent(this.data);
}
