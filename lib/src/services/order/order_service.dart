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
  Future<List<OrderModel>> findAll(DateTime date, [OrderStatusEnum? status]) =>
      _orderRepository.findAll(date, status);

  @override
  Future<OrderModel> findById(int id) => _orderRepository.findById(id);

  @override
  Future<void> changeStatus(int id, OrderStatusEnum status) =>
      _orderRepository.changeStatus(id, status);
}
