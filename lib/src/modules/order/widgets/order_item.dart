import 'package:flutter/material.dart';

import '../../../core/extensions/app_text_styles_extension.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text('Pedido', style: context.textStyles.textBold),
                      const SizedBox(width: 10),
                      Text('1', style: context.textStyles.textExtraBold),
                      const Spacer(),
                      Text(
                        'Cancelado',
                        textAlign: TextAlign.end,
                        style: context.textStyles.textExtraBold.copyWith(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
