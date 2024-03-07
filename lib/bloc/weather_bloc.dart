import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import '../api/api_client.dart';

import '../api/weather_endpoint.dart';
import '../model/weather_response.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherFetchedEvent>(_weatherFetch);
  }
}

_weatherFetch(WeatherFetchedEvent event, Emitter<WeatherState> emit) async {
  try {
    emit(WeatherLoading());
    var response = await WeatherEndpointProvider(APIClient().init())
        .fetchCurrentWeather(
            event.data.latitude ?? 0, event.data.longitude ?? 0);
    if (response.data != null) {
      var data = weatherResponseFromJson(response.data);
      emit(WeatherSuccess(data));
    } else {
      emit(
        WeatherFailure("Fetching weather failed"),
      );
    }
  } catch (e) {
    WeatherFailure("$e");
  }
}
