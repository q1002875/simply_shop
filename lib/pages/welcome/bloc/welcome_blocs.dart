import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/welcome/bloc/welcome.states.dart';
import 'package:simply_shop/pages/welcome/bloc/welcome_events.dart';

class welcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  welcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>(
      (event, emit) {
        emit(WelcomeState(page:state.page));
      },
    );
  }
}
