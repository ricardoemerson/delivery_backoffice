import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/rest_client.dart';
import '../../core/storage/storage/i_storage.dart';
import '../../core/storage/storage/session_storage.dart';
import '../../repositories/payment_type/i_payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/product/i_product_repository.dart';
import '../../repositories/product/product_repository.dart';
import '../../services/auth/payment_type/i_payment_type_service.dart';
import '../../services/auth/payment_type/payment_type_service.dart';
import '../../services/product/i_product_service.dart';
import '../../services/product/product_service.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IStorage>(
          (i) => SessionStorage(),
          export: true,
        ),
        Bind.lazySingleton(
          (i) => RestClient(storage: i()),
          export: true,
        ),
        Bind.lazySingleton<IPaymentTypeRepository>(
          (i) => PaymentTypeRepository(restClient: i()),
          export: true,
        ),
        Bind.lazySingleton<IPaymentTypeService>(
          (i) => PaymentTypeService(paymentTypeRepository: i()),
          export: true,
        ),
        Bind.lazySingleton<IProductRepository>(
          (i) => ProductRepository(restClient: i()),
          export: true,
        ),
        Bind.lazySingleton<IProductService>(
          (i) => ProductService(productRepository: i()),
          export: true,
        ),
      ];
}
