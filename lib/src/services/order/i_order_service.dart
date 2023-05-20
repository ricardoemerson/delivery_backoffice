import '../../core/enums/order_status_enum.dart';
import '../../models/order_model.dart';

abstract class IOrderService {
  Future<List<OrderModel>> findAllOrders(DateTime date, [OrderStatusEnum? status]);
  Future<OrderModel> getById(int id);
  Future<void> changeStatus(int id, OrderStatusEnum status);
}
