part of 'current_index_bloc.dart';

@immutable
sealed class CurrentIndexEvent {}

class CurrentIndexChangedEvent extends CurrentIndexEvent {
  final int index;

  CurrentIndexChangedEvent(this.index);
}
