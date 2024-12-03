import 'package:flutter/material.dart';

import '../../../../core/contracts/app_notifier.dart';
import '../../data/dtos/auth_user_dto.dart';
import '../../domain/usecases/login_user_usecase.dart';
import '../../domain/usecases/signup_user_usecase.dart';
import 'states/auth_state.dart';

class AuthController extends AppNotifier<AuthState> {
  final LoginUserUsecase _loginUserUsecase;
  final SignUpUserUsecase _signUpUserUsecase;

  AuthController(
    this._loginUserUsecase,
    this._signUpUserUsecase,
  ) : super(const InitialAuthState());

  final ValueNotifier<bool> isLogin = ValueNotifier<bool>(true);
  void toggleLogin() => isLogin.value = !isLogin.value;

  String email = '';
  void setEmail(String value) => email = value;

  String password = '';
  void setPassword(String value) => password = value;

  Future<void> save() async {
    setState(const SendingAuthState());

    if (isLogin.value) return _login();
    return _signUp();
  }

  Future<void> _login() async {
    final result = await _loginUserUsecase.execute(
      AuthUserDto(
        email: email,
        password: password,
      ),
    );

    result.fold((error) {
      setState(ErrorAuthState(error.message));
    }, (success) {
      setState(const SuccessAuthState());
    });
  }

  Future<void> _signUp() async {
    final result = await _signUpUserUsecase.execute(
      AuthUserDto(
        email: email,
        password: password,
      ),
    );

    result.fold((error) {
      setState(ErrorAuthState(error.message));
    }, (success) {
      setState(const SuccessAuthState());
    });
  }
}
