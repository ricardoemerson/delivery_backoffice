import 'package:flutter/material.dart';

import '../../../core/extensions/app_text_styles_extension.dart';
import '../../../core/extensions/formatter_extension.dart';
import '../../../dtos/order_product_dto.dart';

class OrderProductItem extends StatelessWidget {
  final OrderProductDto orderProduct;

  const OrderProductItem({super.key, required this.orderProduct});

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
                  orderProduct.product.name,
                  style: context.textStyles.textRegular,
                ),
              ),
              Text(
                orderProduct.amount.toString(),
                style: context.textStyles.textRegular,
              ),
              Expanded(
                child: Text(
                  orderProduct.totalPrice.toCurrencyPtBr,
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
