import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/register/bloc/register_events.dart';
import 'package:simply_shop/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailNameEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }
  void _emailNameEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
    debugPrint(event.email);
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(userName: event.userName));
  }
}