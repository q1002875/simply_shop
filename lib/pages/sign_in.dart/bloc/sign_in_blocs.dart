import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_events.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_status.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    debugPrint('my email is :${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    debugPrint('my password is :${event.password}');
    emit(state.copyWith(password: event.password));
  }
}
