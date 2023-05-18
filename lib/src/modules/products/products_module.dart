import 'package:flutter_modular/flutter_modular.dart';

import 'product_controller.dart';
import 'product_detail/product_detail_controller.dart';
import 'product_detail/product_detail_page.dart';
import 'products_page.dart';

class ProductsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProductController(productService: i())),
        Bind.lazySingleton((i) => ProductDetailController(productService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProductsPage()),
        ChildRoute(
          '/detail',
          child: (context, args) => const ProductDetailPage(),
        ),
        ChildRoute(
          '/detail/:id',
          child: (context, args) => ProductDetailPage(id: int.tryParse(args.params['id'])),
        ),
      ];
}
