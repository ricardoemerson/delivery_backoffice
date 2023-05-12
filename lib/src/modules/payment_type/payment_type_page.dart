import 'package:flutter/material.dart';

class PaymentTypePage extends StatelessWidget {
  const PaymentTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentTypePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaymentTypePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
