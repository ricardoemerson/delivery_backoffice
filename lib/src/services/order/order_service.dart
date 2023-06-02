import '../../dtos/order_dto.dart';
import '../../dtos/order_product_dto.dart';
import '../../enums/order_status_enum.dart';
import '../../models/order_model.dart';
import '../../models/payment_type_model.dart';
import '../../models/user_model.dart';
import '../../repositories/order/i_order_repository.dart';
import '../../repositories/payment_type/i_payment_type_repository.dart';
import '../../repositories/product/i_product_repository.dart';
import '../../repositories/user/i_user_repository.dart';
import 'i_order_service.dart';

class OrderService implements IOrderService {
  final IOrderRepository _orderRepository;
  final IPaymentTypeRepository _paymentTypeRepository;
  final IUserRepository _userRepository;
  final IProductRepository _productRepository;

  OrderService({
    required IOrderRepository orderRepository,
    required IPaymentTypeRepository paymentTypeRepository,
    required IUserRepository userRepository,
    required IProductRepository productRepository,
  })  : _orderRepository = orderRepository,
        _paymentTypeRepository = paymentTypeRepository,
        _userRepository = userRepository,
        _productRepository = productRepository;

  @override
  Future<List<OrderModel>> findAll(DateTime date, [OrderStatusEnum? status]) =>
      _orderRepository.findAll(date, status);

  @override
  Future<OrderModel> findById(int id) => _orderRepository.findById(id);

  @override
  Future<void> changeStatus(int id, OrderStatusEnum status) =>
      _orderRepository.changeStatus(id, status);

  @override
  Future<OrderDto> getOrderDetail(OrderModel order) => _orderDtoParse(order);

  Future<OrderDto> _orderDtoParse(OrderModel order) async {
    final paymentTypeFuture = _paymentTypeRepository.findById(order.paymentTypeId);
    final userFuture = _userRepository.findById(order.userId);
    final orderProductsFuture = _orderProductsParse(order);

    final response = await Future.wait([
      paymentTypeFuture,
      userFuture,
      orderProductsFuture,
    ]);

    return OrderDto(
      id: order.id,
      date: order.date,
      status: order.status,
      orderProducts: response[2] as List<OrderProductDto>,
      user: response[1] as UserModel,
      address: order.address,
      cpf: order.cpf,
      paymentType: response[0] as PaymentTypeModel,
    );
  }

  Future<List<OrderProductDto>> _orderProductsParse(OrderModel order) async {
    final orderProducts = <OrderProductDto>[];

    final productsFuture =
        order.orderProducts.map((e) => _productRepository.findById(e.productId)).toList();

    final products = await Future.wait(productsFuture);

    for (var i = 0; i < order.orderProducts.length; i++) {
      final orderProduct = order.orderProducts[i];

      final productDto = OrderProductDto(
        product: products[i],
        amount: orderProduct.amount,
        totalPrice: orderProduct.totalPrice,
      );

      orderProducts.add(productDto);
    }

    return orderProducts;
  }
}
