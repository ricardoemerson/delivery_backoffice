import 'package:flutter/material.dart';

import 'order_bottom_bar_button.dart';

class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        OrderBottomBarButton(
          label: 'Finalizar',
          image: 'assets/images/icons/finish_order_white_ico.png',
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        OrderBottomBarButton(
          label: 'Confirmar',
          image: 'assets/images/icons/confirm_order_white_icon.png',
          color: Colors.green,
          borderRadius: BorderRadius.zero,
        ),
        OrderBottomBarButton(
          label: 'Cancelar',
          image: 'assets/images/icons/cancel_order_white_icon.png',
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ],
    );
  }
}
