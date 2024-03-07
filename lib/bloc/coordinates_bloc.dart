import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

part 'coordinates_event.dart';
part 'coordinates_state.dart';

class CoordinatesBloc extends Bloc<CoordinatesEvent, CoordinatesState> {
  CoordinatesBloc() : super(CoordinatesInitial()) {
    on<CoordinatedFetchFromCityNameEvent>((event, emit) async {
      emit(CoordinatesLoading());
      var cityName = event.cityName;
      try {
        List<Location> locations = await locationFromAddress(cityName);
        if (locations.isNotEmpty) {
          //double latitude = locations.first.latitude;
          //double longitude = locations.first.longitude;
          emit(CoordinatesFound(locations));
          //print('Latitude: $latitude, Longitude: $longitude');
        } else {
          emit(CoordinatesError('No coordinates found for $cityName'));
          //print('No coordinates found for $cityName');
        }
      } catch (e) {
        emit(CoordinatesError('Error fetching coordinates: $e'));
        //print('Error fetching coordinates: $e');
      }
    });
  }
}
