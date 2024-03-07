import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitial()) {
    on<CheckInternetEvent>(_interConnectivity);
  }
}

_interConnectivity(InternetEvent event, Emitter<InternetState> emit) async {
  emit(InternetInitial());
  try {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      emit(InternetDisconnected("Internet not connected"));
    } else {
      emit(InternetConnected());
    }
  } on SocketException catch (_) {
    emit(InternetDisconnected("Internet not connected"));
  }
}
