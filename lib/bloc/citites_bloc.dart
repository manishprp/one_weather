import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

import '../model/location_model.dart';

part 'citites_event.dart';
part 'citites_state.dart';

class CititesBloc extends Bloc<CititesEvent, List<LocationModel>> {
  CititesBloc() : super([]) {
    on<CityAddedEvent>(_addCity);
    on<CityRemovedEvent>(_removeCity);
    on<CityRemovedSelectedEvent>(_removeSelected);
    on<CityAddedOnTopEvent>(_addOnTop);
  }

  void _removeCity(CityRemovedEvent event, Emitter<List<LocationModel>> emit) {
    state.removeWhere(
      (element) => element == event.location,
    );
    emit(state);
  }

  Future<void> _addCity(
      CityAddedEvent event, Emitter<List<LocationModel>> emit) async {
    {
      var latitude = event.location.latitude;
      var longitude = event.location.longitude;

      _insertCity(latitude, longitude, emit, event);
      if (event.location.cityName == "") {
        var cityName = await _getCityName(latitude, longitude);
        event.location.cityName = cityName;
        _insertCity(latitude, longitude, emit, event);
      }
    }
  }

  void _insertCity(double latitude, double longitude,
      Emitter<List<LocationModel>> emit, CityAddedEvent event) {
    var newState = state
        .where(
          (element) =>
              (element.latitude == latitude && element.longitude == longitude),
        )
        .toList();
    if (newState.isEmpty) {
      if (event.onTop) {
        emit([event.location, ...state]);
      } else {
        emit([...state, event.location]);
      }
    }
  }

  FutureOr<void> _removeSelected(
      CityRemovedSelectedEvent event, Emitter<List<LocationModel>> emit) {
    var temp = state;
    temp.removeWhere((element) => element.visible == true);

    emit(temp);
  }
}

FutureOr<void> _addOnTop(
    CityAddedOnTopEvent event, Emitter<List<LocationModel>> emit) {}

Future<String> _getCityName(double lat, double lon) async {
  try {
    var locations = await placemarkFromCoordinates(lat, lon);
    if (locations.isNotEmpty) {
      return locations.first.locality ?? "";
    } else {
      return "";
    }
  } catch (e) {
    return "";
  }
}
