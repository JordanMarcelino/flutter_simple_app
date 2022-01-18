part of 'clicked_bloc.dart';

@immutable
abstract class ClickedEvent {}

class ClickedLove extends ClickedEvent {}

class ClickedLike extends ClickedEvent {}

class ClickedDislike extends ClickedEvent {}

class ClickedBell extends ClickedEvent {}
