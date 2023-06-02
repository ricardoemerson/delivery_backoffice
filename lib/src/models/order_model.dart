import 'dart:convert';

import '../enums/order_status_enum.dart';
import 'order_product_model.dart';

class OrderModel {
  final int id;
  final DateTime date;
  final OrderStatusEnum status;
  final List<OrderProductModel> orderProducts;
  final int userId;
  final String address;
  final String cpf;
  final int paymentTypeId;

  OrderModel({
    required this.id,
    required this.date,
    required this.status,
    required this.orderProducts,
    required this.userId,
    required this.address,
    required this.cpf,
    required this.paymentTypeId,
  });

  OrderModel copyWith({
    int? id,
    DateTime? date,
    OrderStatusEnum? status,
    List<OrderProductModel>? orderProducts,
    int? userId,
    String? address,
    String? cpf,
    int? paymentTypeId,
  }) {
    return OrderModel(
      id: id ?? this.id,
      date: date ?? this.date,
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
      userId: userId ?? this.userId,
      address: address ?? this.address,
      cpf: cpf ?? this.cpf,
      paymentTypeId: paymentTypeId ?? this.paymentTypeId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'status': status.acronym,
      'products': orderProducts.map((x) => x.toMap()).toList(),
      'user_id': userId,
      'address': address,
      'cpf': cpf,
      'payment_method_id': paymentTypeId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt() ?? 0,
      date: DateTime.parse(map['date']),
      status: OrderStatusEnum.parse(map['status']),
      orderProducts: List<OrderProductModel>.from(
        map['products']?.map((x) => OrderProductModel.fromMap(x)),
      ),
      userId: map['user_id']?.toInt() ?? 0,
      address: map['address'] ?? '',
      cpf: map['cpf'] ?? '',
      paymentTypeId: map['payment_method_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(id: $id, date: $date, status: $status, orderProducts: $orderProducts, userId: $userId, address: $address, cpf: $cpf, paymentTypeId: $paymentTypeId)';
  }
}
