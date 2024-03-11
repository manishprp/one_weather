import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

part 'city_name_from_coords_event.dart';
part 'city_name_from_coords_state.dart';

class CityNameFromCoordsBloc
    extends Bloc<CityNameFromCoordsEvent, CityNameFromCoordsState> {
  CityNameFromCoordsBloc() : super(CityNameFromCoordsInitial()) {
    on<CityNameFetchedFRomCoordsEvent>((event, emit) async {
      emit(CityNameFromCoordsLoading());

      try {
        var locations =
            await placemarkFromCoordinates(event.latitude, event.longitude);
        if (locations.isNotEmpty) {
          //double latitude = locations.first.latitude;
          //double longitude = locations.first.longitude;
          emit(CityNameFromCoordsSuccess(locations.first.name ?? ""));
          //print('Latitude: $latitude, Longitude: $longitude');
        } else {
          emit(CityNameFromCoordsFailure('No coordinates found for $event'));
          //print('No coordinates found for $cityName');
        }
      } catch (e) {
        emit(CityNameFromCoordsFailure('Error fetching coordinates: $e'));
        //print('Error fetching coordinates: $e');
      }
    });
  }
}
