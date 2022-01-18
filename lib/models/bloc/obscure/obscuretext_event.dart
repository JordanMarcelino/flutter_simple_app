part of 'obscuretext_bloc.dart';

@immutable
abstract class ObscuretextEvent {}

class ObscureToggleOn extends ObscuretextEvent {}

class ObscureToggleOff extends ObscuretextEvent {}
