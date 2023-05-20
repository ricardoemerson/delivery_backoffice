import '../../core/enums/order_status_enum.dart';
import '../../models/order_model.dart';
import '../../repositories/order/i_order_repository.dart';
import 'i_order_service.dart';

class OrderService implements IOrderService {
  final IOrderRepository _orderRepository;

  OrderService({
    required IOrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<List<OrderModel>> findAllOrders(DateTime date, [OrderStatusEnum? status]) =>
      _orderRepository.findAllOrders(date, status);

  @override
  Future<OrderModel> getById(int id) => _orderRepository.getById(id);

  @override
  Future<void> changeStatus(int id, OrderStatusEnum status) =>
      _orderRepository.changeStatus(id, status);
}
