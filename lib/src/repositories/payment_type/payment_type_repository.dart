import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/payment_type_model.dart';
import 'i_payment_type_repository.dart';

class PaymentTypeRepository implements IPaymentTypeRepository {
  final RestClient _restClient;

  PaymentTypeRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<PaymentTypeModel>> findAll(bool? enabled) async {
    try {
      final paymentsType = await _restClient.authRequest().get(
        '/payment-types',
        queryParameters: {
          if (enabled != null) 'enabled': enabled,
        },
      );

      return paymentsType.data.map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p)).toList();
    } on DioError catch (err, s) {
      log('Erro ao buscar formas de pagamento.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao buscar formas de pagamento.');
    }
  }

  @override
  Future<PaymentTypeModel> findById(int id) async {
    try {
      final paymentsType = await _restClient.authRequest().get('/payment-types/$id');

      return PaymentTypeModel.fromMap(paymentsType.data);
    } on DioError catch (err, s) {
      log('Erro ao buscar forma de pagamento $id.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao buscar forma de pagamento $id.');
    }
  }

  @override
  Future<void> save(PaymentTypeModel paymentTypeModel) async {
    try {
      if (paymentTypeModel.id == null) {
        await _restClient.authRequest().post(
              '/payment-types',
              data: paymentTypeModel.toMap(),
            );
      } else {
        await _restClient.authRequest().put(
              '/payment-types/${paymentTypeModel.id}',
              data: paymentTypeModel.toMap(),
            );
      }
    } on DioError catch (err, s) {
      log('Erro ao salvar forma de pagamento.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao salvar forma de pagamento.');
    }
  }
}
