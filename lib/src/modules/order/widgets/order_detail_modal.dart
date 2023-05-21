import 'package:flutter/material.dart';

import '../../../core/extensions/app_text_styles_extension.dart';
import '../../../core/extensions/formatter_extension.dart';
import '../../../core/extensions/size_extension.dart';
import 'order_bottom_bar.dart';
import 'order_info_tile.dart';
import 'order_product_item.dart';

class OrderDetailModal extends StatefulWidget {
  const OrderDetailModal({super.key});

  @override
  State<OrderDetailModal> createState() => _OrderDetailModalState();
}

class _OrderDetailModalState extends State<OrderDetailModal> {
  void _closeModal() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return Material(
      color: Colors.black26,
      child: Dialog(
        backgroundColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: screenWidth * (screenWidth > 1200 ? .5 : .7),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        child: Text(
                          'Detalhe do Pedido',
                          style: context.textStyles.textTitle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: _closeModal,
                          icon: const Icon(Icons.close),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Nome do Cliente:',
                        style: context.textStyles.textBold,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Ricardo Emerson',
                        style: context.textStyles.textRegular,
                      ),
                    ],
                  ),
                  const Divider(),
                  ...List.generate(3, (index) => index)
                      .map((e) => const OrderProductItem())
                      .toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do Pedido',
                        style: context.textStyles.textBold.copyWith(fontSize: 18),
                      ),
                      Text(
                        200.0.toCurrencyPtBr,
                        style: context.textStyles.textBold.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  const Divider(),
                  const OrderInfoTile(label: 'Endereço de entrega:', info: 'Av. Paulista, 200'),
                  const Divider(),
                  const OrderInfoTile(label: 'Forma de pagamento:', info: 'Cartão de Crédito'),
                  const SizedBox(height: 10),
                  const OrderBottomBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
