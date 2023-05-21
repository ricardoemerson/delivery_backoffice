// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on OrderControllerBase, Store {
  late final _$_orderStateAtom =
      Atom(name: 'OrderControllerBase._orderState', context: context);

  OrderStateEnum get orderState {
    _$_orderStateAtom.reportRead();
    return super._orderState;
  }

  @override
  OrderStateEnum get _orderState => orderState;

  @override
  set _orderState(OrderStateEnum value) {
    _$_orderStateAtom.reportWrite(value, super._orderState, () {
      super._orderState = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'OrderControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_orderStatusFilterAtom =
      Atom(name: 'OrderControllerBase._orderStatusFilter', context: context);

  OrderStatusEnum? get orderStatusFilter {
    _$_orderStatusFilterAtom.reportRead();
    return super._orderStatusFilter;
  }

  @override
  OrderStatusEnum? get _orderStatusFilter => orderStatusFilter;

  @override
  set _orderStatusFilter(OrderStatusEnum? value) {
    _$_orderStatusFilterAtom.reportWrite(value, super._orderStatusFilter, () {
      super._orderStatusFilter = value;
    });
  }

  late final _$_ordersAtom =
      Atom(name: 'OrderControllerBase._orders', context: context);

  List<OrderModel> get orders {
    _$_ordersAtom.reportRead();
    return super._orders;
  }

  @override
  List<OrderModel> get _orders => orders;

  @override
  set _orders(List<OrderModel> value) {
    _$_ordersAtom.reportWrite(value, super._orders, () {
      super._orders = value;
    });
  }

  late final _$loadOrdersAsyncAction =
      AsyncAction('OrderControllerBase.loadOrders', context: context);

  @override
  Future<void> loadOrders() {
    return _$loadOrdersAsyncAction.run(() => super.loadOrders());
  }

  late final _$showDetailModalAsyncAction =
      AsyncAction('OrderControllerBase.showDetailModal', context: context);

  @override
  Future<void> showDetailModal(OrderModel orderModel) {
    return _$showDetailModalAsyncAction
        .run(() => super.showDetailModal(orderModel));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
