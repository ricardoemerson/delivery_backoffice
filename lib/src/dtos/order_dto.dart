import '../enums/order_status_enum.dart';
import '../models/payment_type_model.dart';
import '../models/user_model.dart';
import 'order_product_dto.dart';

class OrderDto {
  final int id;
  final DateTime date;
  final OrderStatusEnum status;
  final List<OrderProductDto> orderProducts;
  final UserModel user;
  final String address;
  final String cpf;
  final PaymentTypeModel paymentType;

  OrderDto({
    required this.id,
    required this.date,
    required this.status,
    required this.orderProducts,
    required this.user,
    required this.address,
    required this.cpf,
    required this.paymentType,
  });
}
