part of 'user_bloc.dart';

abstract class UserState {
  List<bool> click = [false, false, false, false];

  UserState({required this.click});
}

class UserInitial extends UserState {
  UserInitial(List<bool> clicked) : super(click: clicked);
}
