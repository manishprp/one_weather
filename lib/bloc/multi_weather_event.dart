part of 'multi_weather_bloc.dart';

@immutable
sealed class MultiWeatherEvent {}

class MultipleWeatherFetchedEvent extends MultiWeatherEvent {
  final List<LocationModel> data;

  MultipleWeatherFetchedEvent(this.data);
}

class MultipleWeatherDeletedEvent extends MultiWeatherEvent {
  final List<int> indexeToDelete;

  MultipleWeatherDeletedEvent(this.indexeToDelete);
}
