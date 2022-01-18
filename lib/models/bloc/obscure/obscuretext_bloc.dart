import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'obscuretext_event.dart';
part 'obscuretext_state.dart';

class ObscuretextBloc extends Bloc<ObscuretextEvent, ObscuretextState> {
  ObscuretextBloc() : super(ObscuretextInitial()) {
    on<ObscuretextEvent>((event, emit) {
      if (event is ObscureToggleOn) {
        emit(ObscureTextResult('assets/icons/eye.svg', false));
      }
      if (event is ObscureToggleOff) {
        emit(ObscureTextResult('assets/icons/eye-crossed.svg', true));
      }
    });
  }
}
