import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clicked_event.dart';
part 'clicked_state.dart';

class ClickedBloc extends Bloc<ClickedEvent, ClickedState> {
  ClickedBloc() : super(ClickedInitial([false, false, false])) {
    on<ClickedEvent>((event, emit) {
      if (event is ClickedLove) {
        var click = state.click;
        click[0] = (click[0]) ? false : true;
        emit(ClickedInitial(click));
      } else if (event is ClickedLike) {
        var click = state.click;
        click[1] = (click[1]) ? false : true;
        emit(ClickedInitial(click));
      } else if (event is ClickedDislike) {
        var click = state.click;
        click[2] = (click[2]) ? false : true;
        emit(ClickedInitial(click));
      }
    });
  }
}
