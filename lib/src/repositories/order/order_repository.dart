import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/enums/order_status_enum.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/order_model.dart';
import 'i_order_repository.dart';

class OrderRepository implements IOrderRepository {
  final RestClient _restClient;

  OrderRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<OrderModel>> findAllOrders(DateTime date, [OrderStatusEnum? status]) async {
    try {
      final orders = await _restClient.authRequest().get(
        '/orders',
        queryParameters: {
          'date': date.toIso8601String(),
          if (status != null) 'status': status.acronym,
        },
      );

      return orders.data.map<OrderModel>((o) => OrderModel.fromMap(o)).toList();
    } on DioError catch (err, s) {
      log('Erro ao buscar pedidos.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao buscar pedidos.');
    }
  }

  @override
  Future<OrderModel> getById(int id) async {
    try {
      final order = await _restClient.authRequest().get('/orders');

      return OrderModel.fromMap(order.data);
    } on DioError catch (err, s) {
      log('Erro ao buscar pedido.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao buscar pedido.');
    }
  }

  @override
  Future<void> changeStatus(int id, OrderStatusEnum status) async {
    try {
      await _restClient.authRequest().put(
        '/orders/$id',
        data: {
          'status': status.acronym,
        },
      );
    } on DioError catch (err, s) {
      log('Erro ao alterar o status do pedido para ${status.acronym}.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao alterar o status do pedido para ${status.acronym}.');
    }
  }
}
