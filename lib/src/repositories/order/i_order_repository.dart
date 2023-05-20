import '../../core/enums/order_status_enum.dart';
import '../../models/order_model.dart';

abstract class IOrderRepository {
  Future<List<OrderModel>> findAll(DateTime date, [OrderStatusEnum? status]);
  Future<OrderModel> findById(int id);
  Future<void> changeStatus(int id, OrderStatusEnum status);
}
