import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blocwitmvvm/utils/enums.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super( LoginStates()) {
    on<EmailChange>(_onEmailChnage);
    on<PasswordChange>(_onPasswordChnage);
  }

  void _onEmailChnage(EmailChange event, Emitter<LoginStates> emit) {
    log(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChnage(PasswordChange event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }
}
