import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/enums/product_state_enum.dart';
import '../../core/helpers/debounce_helper.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../core/widgets/base_header.dart';
import 'product_controller.dart';
import 'widgets/product_item.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with LoaderMixin, MessageMixin {
  final controller = Modular.get<ProductController>();
  late final ReactionDisposer statusDisposer;
  final debounce = DebounceHelper(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.productState, (status) {
        switch (status) {
          case ProductStateEnum.initial:
            break;
          case ProductStateEnum.loading:
            showLoader();
            break;
          case ProductStateEnum.loaded:
            hideLoader();
            break;
          case ProductStateEnum.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro ao buscar produtos.');
            break;
        }
      });

      controller.loadProducts();
    });
  }

  @override
  void dispose() {
    statusDisposer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BaseHeader(
            title: 'ADMINISTRAR PRODUTOS',
            buttonLabel: 'Adicionar Produto',
            buttonPressed: () async {
              await Modular.to.pushNamed('/products/detail');

              controller.loadProducts();
            },
            searchChanged: (value) {
              debounce.call(() {
                controller.filterByName(value);
              });
            },
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Observer(
              builder: (_) {
                return Observer(
                  builder: (_) {
                    return GridView.builder(
                      itemCount: controller.products.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 280,
                        mainAxisSpacing: 20,
                        maxCrossAxisExtent: 280,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final product = controller.products[index];

                        return ProductItem(controller: controller, product: product);
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
