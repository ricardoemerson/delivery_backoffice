import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/env/env.dart';
import '../../../core/extensions/app_text_styles_extension.dart';
import '../../../core/extensions/formatter_extension.dart';
import '../../../models/product_model.dart';
import '../product_controller.dart';

class ProductItem extends StatelessWidget {
  final ProductController controller;
  final ProductModel product;

  const ProductItem({
    super.key,
    required this.controller,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: constraints.maxHeight * .6,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${Env.instance.get('BACKEND_BASE_URL')}${product.image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Tooltip(
                  message: product.name,
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.textMedium,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(product.price.toCurrencyPtBr),
                  ),
                  TextButton(
                    onPressed: () async {
                      await Modular.to.pushNamed('/products/detail/${product.id}');
                      controller.loadProducts();
                    },
                    child: const Text('Editar'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
