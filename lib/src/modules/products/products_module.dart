import 'package:flutter_modular/flutter_modular.dart';

import 'product_detail/product_detail_page.dart';
import 'products_page.dart';
import 'widgets/product_controller.dart';

class ProductsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProductController(productService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProductsPage()),
        ChildRoute('/detail', child: (context, args) => const ProductDetailPage()),
      ];
}
