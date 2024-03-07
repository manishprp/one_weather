part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

final class InternetDisconnected extends InternetState {
  final String error;

  InternetDisconnected(this.error);
}

final class InternetConnected extends InternetState {}

final class InternetLoading extends InternetState {}
