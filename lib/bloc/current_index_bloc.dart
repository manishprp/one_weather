import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_index_event.dart';
part 'current_index_state.dart';

class CurrentIndexBloc extends Bloc<CurrentIndexEvent, int> {
  CurrentIndexBloc() : super(0) {
    on<CurrentIndexChangedEvent>((event, emit) {
      if (state != event.index) {
        emit(event.index);
      }
    });
  }
}
