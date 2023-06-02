import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../dtos/order_dto.dart';
import '../../enums/order_state_enum.dart';
import '../../enums/order_status_enum.dart';
import '../../models/order_model.dart';
import '../../services/order/i_order_service.dart';

part 'order_controller.g.dart';

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {
  final IOrderService _orderService;

  @readonly
  var _orderState = OrderStateEnum.initial;

  @readonly
  String? _errorMessage;

  @readonly
  OrderStatusEnum? _orderStatusFilter;

  @readonly
  var _orders = <OrderModel>[];

  @readonly
  OrderDto? _selectedOrder;

  late final DateTime _today;

  OrderControllerBase({
    required IOrderService orderService,
  }) : _orderService = orderService {
    final today = DateTime.now();

    _today = DateTime(today.year, today.month, today.day);
  }

  @action
  Future<void> loadOrders() async {
    try {
      _orderState = OrderStateEnum.loading;

      _orders = await _orderService.findAll(_today, _orderStatusFilter);

      _orderState = OrderStateEnum.loaded;
    } on RepositoryException catch (err, s) {
      log('Erro ao buscar pedidos do dia.', error: err, stackTrace: s);

      _orderState = OrderStateEnum.error;
      _errorMessage = 'Erro ao buscar pedidos do dia.';
    }
  }

  @action
  Future<void> showDetailModal(OrderModel orderModel) async {
    _orderState = OrderStateEnum.loading;

    _selectedOrder = await _orderService.getOrderDetail(orderModel);

    _orderState = OrderStateEnum.showModalDetailModal;
  }

  @action
  Future<void> changeStatus(OrderStatusEnum status) async {
    _orderState = OrderStateEnum.loading;

    await _orderService.changeStatus(_selectedOrder!.id, status);

    _orderState = OrderStateEnum.statusChanged;
  }

  @action
  void changeStatusFilter(OrderStatusEnum? status) {
    _orderStatusFilter = status;
    loadOrders();
  }
}
