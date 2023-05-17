import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/enums/login_state_enum.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../services/auth/i_auth_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final IAuthService _authService;

  @readonly
  var _loginState = LoginStateEnum.initial;

  @readonly
  String? _errorMessage;

  LoginControllerBase({
    required IAuthService authService,
  }) : _authService = authService;

  @action
  Future<void> login(String email, String password) async {
    try {
      _loginState = LoginStateEnum.loading;

      await _authService.login(email, password);

      _loginState = LoginStateEnum.success;
    } on UnauthorizedException {
      _errorMessage = 'Login ou senha inválidos.';
      _loginState = LoginStateEnum.error;
    } catch (err, s) {
      log('Erro ao realizar login.', error: err, stackTrace: s);

      _errorMessage = 'Não foi possível realizar sua autenticação, tente novamente mais tarde.';
      _loginState = LoginStateEnum.error;
    }
  }
}
