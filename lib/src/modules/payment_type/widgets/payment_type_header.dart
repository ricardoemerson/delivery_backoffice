import 'package:flutter/material.dart';

import '../../../core/widgets/base_header.dart';
import '../payment_type_controller.dart';

class PaymentTypeHeader extends StatefulWidget {
  final PaymentTypeController controller;

  const PaymentTypeHeader({super.key, required this.controller});

  @override
  State<PaymentTypeHeader> createState() => _PaymentTypeHeaderState();
}

class _PaymentTypeHeaderState extends State<PaymentTypeHeader> {
  bool? enabled;

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      buttonPressed: widget.controller.addPayment,
      title: 'ADMINISTRAR FORMAS DE PAGAMENTO',
      buttonLabel: 'Adicionar',
      filterWidget: DropdownButton<bool>(
        onChanged: (value) {
          setState(() {
            enabled = value;
            widget.controller.changeFilter(value);
          });
        },
        value: enabled,
        items: const [
          DropdownMenuItem(child: Text('Todos')),
          DropdownMenuItem(value: true, child: Text('Ativos')),
          DropdownMenuItem(value: false, child: Text('Inativos')),
        ],
      ),
    );
  }
}
