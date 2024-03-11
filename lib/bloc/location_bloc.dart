import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/location_model.dart';
import '../location_service/location_setup.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationFetched, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<LocationFetched>(_fetchCurrentLocation);
  }
}

void _fetchCurrentLocation(
    LocationFetched event, Emitter<LocationState> emit) async {
  try {
    var locationdata = await getCurrentLocation();
    // ignore: unnecessary_null_comparison
    if (locationdata != null) {
      emit(LocationSuccess(locationdata));
    } else {
      emit(LocationFailure("Location not fetched, please grant permission!"));
    }
  } catch (e) {
    emit(LocationFailure("$e"));
  }
}
