import 'package:flutter/material.dart';

import '../../../core/extensions/app_colors_extension.dart';
import '../../../core/extensions/app_text_styles_extension.dart';
import '../../../models/payment_type_model.dart';
import '../payment_type_controller.dart';

class PaymentTypeItem extends StatelessWidget {
  final PaymentTypeModel paymentType;
  final PaymentTypeController controller;

  const PaymentTypeItem({
    super.key,
    required this.paymentType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final enabledColor = paymentType.enabled ? Colors.black : Colors.grey;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              'assets/images/icons/payment_${paymentType.acronym}_icon.png',
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/icons/payment_notfound_icon.png',
                  color: enabledColor,
                );
              },
              color: enabledColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      'Forma de Pagamento',
                      style: context.textStyles.textRegular.copyWith(color: enabledColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    child: Text(
                      paymentType.name,
                      style: context.textStyles.textTitle.copyWith(color: enabledColor),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => controller.editPayment(paymentType),
                  child: Text(
                    'Editar',
                    style: context.textStyles.textMedium.copyWith(
                      color: paymentType.enabled ? context.colors.primary : Colors.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
