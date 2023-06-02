import 'package:flutter/material.dart';

import '../../../core/widgets/base_header.dart';
import '../../../enums/order_status_enum.dart';
import '../order_controller.dart';

class OrderHeader extends StatefulWidget {
  final OrderController controller;

  const OrderHeader({
    super.key,
    required this.controller,
  });

  @override
  State<OrderHeader> createState() => _OrderHeaderState();
}

class _OrderHeaderState extends State<OrderHeader> {
  OrderStatusEnum? selectedOrderStatus;

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'ADMINISTRAR PEDIDOS',
      addButton: false,
      filterWidget: DropdownButton<OrderStatusEnum>(
        onChanged: (value) {
          setState(() {
            widget.controller.changeStatusFilter(value);
            selectedOrderStatus = value;
          });
        },
        value: selectedOrderStatus,
        items: [
          const DropdownMenuItem(child: Text('Todos')),
          ...OrderStatusEnum.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
        ],
      ),
    );
  }
}
