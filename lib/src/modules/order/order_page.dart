import 'package:flutter/material.dart';

import 'widgets/order_header.dart';
import 'widgets/order_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const OrderHeader(),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 91,
                    maxCrossAxisExtent: 600,
                  ),
                  itemBuilder: (context, index) {
                    return const OrderItem();
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
