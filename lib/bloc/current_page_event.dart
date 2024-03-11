part of 'current_page_bloc.dart';

@immutable
sealed class CurrentPageEvent {}

class CurrentPageChangedEvent extends CurrentPageEvent {
  final int jumpTo;

  CurrentPageChangedEvent(this.jumpTo);
}
