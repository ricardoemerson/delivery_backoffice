import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/user_model.dart';
import 'i_user_repository.dart';

class UserRepository implements IUserRepository {
  final RestClient _restClient;

  UserRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> findById(int id) async {
    try {
      final product = await _restClient.authRequest().get('/users/$id');

      return UserModel.fromMap(product.data);
    } on DioError catch (err, s) {
      log('Erro ao buscar usuário $id.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao buscar usuário $id.');
    }
  }
}
