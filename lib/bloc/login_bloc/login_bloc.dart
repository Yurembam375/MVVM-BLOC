import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blocwitmvvm/dependency_injection/locator.dart';

import 'package:blocwitmvvm/repository/auth/login_repo.dart';
import 'package:blocwitmvvm/service/session_manager/session_manager.dart';
import 'package:blocwitmvvm/utils/enums.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepo loginRepository = getIt();
  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChange>(_onEmailChnage);
    on<PasswordChange>(_onPasswordChnage);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChnage(EmailChange event, Emitter<LoginStates> emit) {
    log(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChnage(PasswordChange event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    Map data = {"email": state.email, "password": state.password};
    // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await loginRepository.loginApi(data).then(
      (value) async {
        if (value.error.isNotEmpty) {
          emit(state.copyWith(
              message: value.error.toString(),
              postApiStatus: PostApiStatus.error));
        } else {
          await SessionManager().saveUserInPrefence(value);
          await SessionManager().getUserFromPreference();
          emit(state.copyWith(
              message: 'Login sucessfull',
              postApiStatus: PostApiStatus.success));
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.error));
      },
    );
  }
}
