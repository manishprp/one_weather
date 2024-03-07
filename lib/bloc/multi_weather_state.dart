part of 'multi_weather_bloc.dart';

@immutable
sealed class MultiWeatherState {}

final class MultiWeatherInitial extends MultiWeatherState {}

final class MultipleWeatherLoading extends MultiWeatherState {}

final class MultipleWeatherSuccess extends MultiWeatherState {
  final List<WeatherResponse> weatherData;

  MultipleWeatherSuccess(this.weatherData);
}

final class MultipleWeatherFailure extends MultiWeatherState {
  final String error;

  MultipleWeatherFailure(this.error);
}
