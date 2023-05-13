import 'package:flutter/material.dart';

import 'widgets/payment_type_header.dart';

class PaymentTypePage extends StatelessWidget {
  const PaymentTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          PaymentTypeHeader(),
        ],
      ),
    );
  }
}
