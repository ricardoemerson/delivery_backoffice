import 'package:flutter/material.dart';

import '../../../core/widgets/base_header.dart';

class PaymentTypeHeader extends StatelessWidget {
  const PaymentTypeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'ADMINISTRAR FORMAS DE PAGAMENTO',
      buttonLabel: 'Adicionar',
      filterWidget: DropdownButton<bool>(
        onChanged: (value) {},
        value: true,
        items: const [
          DropdownMenuItem(child: Text('Todos')),
          DropdownMenuItem(value: true, child: Text('Ativos')),
          DropdownMenuItem(value: false, child: Text('Inativos')),
        ],
      ),
    );
  }
}
