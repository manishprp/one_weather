import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/location_model.dart';

part 'citites_event.dart';
part 'citites_state.dart';

class CititesBloc extends Bloc<CititesEvent, List<LocationModel>> {
  CititesBloc() : super([]) {
    on<CityAddedEvent>((event, emit) {
      var newState = state
          .where((element) => (element.latitude == event.location.latitude &&
              element.longitude == event.location.longitude))
          .toList();
      if (newState.isEmpty) {
        emit([...state, event.location]);
      }
    });
    on<CityRemovedEvent>((event, emit) {
      state.removeWhere(
        (element) => element == event.location,
      );
      emit(state);
    });
  }
}
