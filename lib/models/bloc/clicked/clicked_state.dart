part of 'clicked_bloc.dart';

abstract class ClickedState {
  List<bool> click = [false, false, false, false];
  ClickedState({required this.click});
}

class ClickedInitial extends ClickedState {
  ClickedInitial(List<bool> click) : super(click: click);
}
