import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/order/i_order_repository.dart';
import '../../repositories/order/order_repository.dart';
import '../../services/order/i_order_service.dart';
import '../../services/order/order_service.dart';
import 'order_controller.dart';
import 'order_page.dart';

class OrderModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IOrderRepository>((i) => OrderRepository(restClient: i())),
        Bind.lazySingleton<IOrderService>(
          (i) => OrderService(
            orderRepository: i(),
            paymentTypeRepository: i(),
            productRepository: i(),
            userRepository: i(),
          ),
        ),
        Bind.lazySingleton((i) => OrderController(orderService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const OrderPage()),
      ];
}
