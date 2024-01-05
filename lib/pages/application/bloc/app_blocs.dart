import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/application/bloc/app.events.dart';
import 'package:simply_shop/pages/application/bloc/app.states.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      print("my tapped index is ${event.index}");
      emit(AppState(index: event.index));
    });
  }
}
