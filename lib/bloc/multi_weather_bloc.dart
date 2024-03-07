import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_weather/bloc/weather_bloc.dart';

import '../api/api_client.dart';
import '../api/weather_endpoint.dart';
import '../model/location_model.dart';
import '../model/weather_response.dart';

part 'multi_weather_event.dart';
part 'multi_weather_state.dart';

class MultiWeatherBloc extends Bloc<MultiWeatherEvent, MultiWeatherState> {
  MultiWeatherBloc() : super(MultiWeatherInitial()) {
    on<MultipleWeatherFetchedEvent>(_multipleWeatherFetches);
  }
}

_multipleWeatherFetches(
    MultipleWeatherFetchedEvent event, Emitter<MultiWeatherState> emit) async {
  var data = event.data;
  List<WeatherResponse> finalData = [];

  var client = APIClient().init();
  emit(MultipleWeatherLoading());
  try {
    for (int i = 0; i < data.length; i++) {
      var response = await WeatherEndpointProvider(client)
          .fetchCurrentWeather(data[i].latitude ?? 0, data[i].longitude ?? 0);
      if (response.data != null) {
        var data = weatherResponseFromJson(response.data);
        finalData.add(data);
      } else {
        emit(
          MultipleWeatherFailure("Fetching weather failed"),
        );
      }
    }
    emit(MultipleWeatherSuccess(finalData));
  } catch (e) {
    emit(MultipleWeatherFailure("$e"));
  }
}
