import 'package:flutter/material.dart';

import '../../../core/widgets/base_header.dart';

class PaymentTypeHeader extends StatelessWidget {
  const PaymentTypeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseHeader(
      title: 'ADMINISTRAR FORMAS DE PAGAMENTO',
      buttonLabel: 'Adicionar',
    );
  }
}
