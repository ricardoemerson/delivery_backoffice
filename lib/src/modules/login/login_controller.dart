import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/enums/login_state_status_enum.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../services/auth/i_auth_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final IAuthService _authService;

  @readonly
  var _loginStatus = LoginStateStatusEnum.initial;

  @readonly
  String? _errorMessage;

  LoginStateStatusEnum get loginStatus => _loginStatus;
  String? get errorMessage => _errorMessage;

  LoginControllerBase({
    required IAuthService authService,
  }) : _authService = authService;

  Future<void> login(String email, String password) async {
    try {
      _loginStatus = LoginStateStatusEnum.loading;

      await _authService.login(email, password);

      _loginStatus = LoginStateStatusEnum.success;
    } on UnauthorizedException {
      _errorMessage = 'Login ou senha inválidos.';
      _loginStatus = LoginStateStatusEnum.error;
    } catch (err, s) {
      log('Erro ao realizar login.', error: err, stackTrace: s);

      _errorMessage = 'Não foi possível realizar sua autenticação, tente novamente mais tarde.';
      _loginStatus = LoginStateStatusEnum.error;
    }
  }
}
