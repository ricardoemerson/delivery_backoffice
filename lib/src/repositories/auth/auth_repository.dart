import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/auth_model.dart';
import 'i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final RestClient _restClient;

  AuthRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await _restClient.publicRequest().post(
        '/auth',
        data: {
          'email': email,
          'password': password,
          'admin': true,
        },
      );

      return AuthModel.fromMap(result.data);
    } on DioError catch (err, s) {
      if (err.response?.statusCode == 403) {
        log('Login ou senha inválidos', error: err, stackTrace: s);

        throw UnauthorizedException('Login ou senha inválidos.');
      }

      log('Erro ao realizar login.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao realizar login.');
    }
  }
}
