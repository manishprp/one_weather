import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_page_event.dart';
part 'current_page_state.dart';

class CurrentPageBloc extends Bloc<CurrentPageEvent, int> {
  CurrentPageBloc() : super(0) {
    on<CurrentPageChangedEvent>((event, emit) {
      if (state != event.jumpTo) {
        emit(event.jumpTo);
      }
    });
  }
}
