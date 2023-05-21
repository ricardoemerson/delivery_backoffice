import 'package:flutter/material.dart';

import '../../../core/extensions/app_text_styles_extension.dart';
import '../../../core/extensions/formatter_extension.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'X-Tudão',
                  style: context.textStyles.textRegular,
                ),
              ),
              Text(
                '1',
                style: context.textStyles.textRegular,
              ),
              Expanded(
                child: Text(
                  100.0.toCurrencyPtBr,
                  textAlign: TextAlign.right,
                  style: context.textStyles.textRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
