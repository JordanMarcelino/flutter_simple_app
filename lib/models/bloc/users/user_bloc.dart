import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial([false, false, false, false])) {
    on<UserEvent>((event, emit) {
      if (event is DollarClick) {
        var click = state.click;
        click[0] = (click[0]) ? false : true;
        emit(UserInitial(click));
      } else if (event is FavouriteClick) {
        var click = state.click;
        click[1] = (click[1]) ? false : true;
        emit(UserInitial(click));
      } else if (event is AddresClick) {
        var click = state.click;
        click[2] = (click[2]) ? false : true;
        emit(UserInitial(click));
      } else if (event is StoreClick) {
        var click = state.click;
        click[3] = (click[3]) ? false : true;
        emit(UserInitial(click));
      }
    });
  }
}
