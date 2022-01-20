part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class DollarClick extends UserEvent {}

class StoreClick extends UserEvent {}

class AddresClick extends UserEvent {}

class FavouriteClick extends UserEvent {}
