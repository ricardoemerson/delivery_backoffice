import '../../dtos/order_dto.dart';
import '../../enums/order_status_enum.dart';
import '../../models/order_model.dart';

abstract class IOrderService {
  Future<List<OrderModel>> findAll(DateTime date, [OrderStatusEnum? status]);
  Future<OrderModel> findById(int id);
  Future<void> changeStatus(int id, OrderStatusEnum status);
  Future<OrderDto> getOrderDetail(OrderModel order);
}
