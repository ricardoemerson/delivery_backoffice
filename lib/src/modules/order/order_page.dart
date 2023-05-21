import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/enums/order_state_enum.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import 'order_controller.dart';
import 'widgets/order_detail_modal.dart';
import 'widgets/order_header.dart';
import 'widgets/order_item.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with LoaderMixin, MessageMixin {
  final controller = Modular.get<OrderController>();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((p0) => controller.orderState, (status) {
        switch (status) {
          case OrderStateEnum.initial:
            break;
          case OrderStateEnum.loading:
            showLoader();
            break;
          case OrderStateEnum.loaded:
            hideLoader();
            break;
          case OrderStateEnum.showModalDetailModal:
            hideLoader();
            showOrderDetail();
            break;
          case OrderStateEnum.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro ao buscar pedidos do dia.');
            break;
        }
      });

      controller.loadOrders();
    });
  }

  @override
  void dispose() {
    statusDisposer();

    super.dispose();
  }

  void showOrderDetail() {
    showDialog(
      context: context,
      builder: (context) {
        return const OrderDetailModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const OrderHeader(),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return GridView.builder(
                      itemCount: controller.orders.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 91,
                        maxCrossAxisExtent: 600,
                      ),
                      itemBuilder: (context, index) {
                        final order = controller.orders[index];

                        return OrderItem(order: order);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
