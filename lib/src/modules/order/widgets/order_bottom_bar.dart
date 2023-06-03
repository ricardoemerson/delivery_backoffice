import 'package:flutter/material.dart';

import '../../../dtos/order_dto.dart';
import '../../../enums/order_status_enum.dart';
import '../order_controller.dart';
import 'order_bottom_bar_button.dart';

class OrderBottomBar extends StatelessWidget {
  final OrderController controller;
  final OrderDto order;

  const OrderBottomBar({
    super.key,
    required this.controller,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OrderBottomBarButton(
          onPressed: order.status == OrderStatusEnum.confirmed
              ? () {
                  controller.changeStatus(OrderStatusEnum.finalized);
                }
              : null,
          label: 'Finalizar',
          image: 'assets/images/icons/finish_order_white_ico.png',
          color: Colors.blue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        OrderBottomBarButton(
          onPressed: order.status == OrderStatusEnum.pending
              ? () {
                  controller.changeStatus(OrderStatusEnum.confirmed);
                }
              : null,
          label: 'Confirmar',
          image: 'assets/images/icons/confirm_order_white_icon.png',
          color: Colors.green,
          borderRadius: BorderRadius.zero,
        ),
        OrderBottomBarButton(
          onPressed:
              order.status == OrderStatusEnum.pending || order.status == OrderStatusEnum.confirmed
                  ? () {
                      controller.changeStatus(OrderStatusEnum.canceled);
                    }
                  : null,
          label: 'Cancelar',
          image: 'assets/images/icons/cancel_order_white_icon.png',
          color: Colors.red,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ],
    );
  }
}
