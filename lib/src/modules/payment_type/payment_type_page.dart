import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/enums/payment_type_state_status_enum.dart';
import '../../core/helpers/loader_mixin.dart';
import '../../core/helpers/message_mixin.dart';
import 'payment_type_controller.dart';
import 'widgets/payment_type_form_modal.dart';
import 'widgets/payment_type_header.dart';
import 'widgets/payment_type_item.dart';

class PaymentTypePage extends StatefulWidget {
  const PaymentTypePage({super.key});

  @override
  State<PaymentTypePage> createState() => _PaymentTypePageState();
}

class _PaymentTypePageState extends State<PaymentTypePage> with LoaderMixin, MessageMixin {
  final controller = Modular.get<PaymentTypeController>();

  final disposers = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final filterDisposer = reaction((_) => controller.filterEnabled, (_) {
        controller.loadPayments();
      });

      final statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case PaymentTypeStateStatusEnum.initial:
            break;
          case PaymentTypeStateStatusEnum.loading:
            showLoader();
            break;
          case PaymentTypeStateStatusEnum.loaded:
            hideLoader();
            break;
          case PaymentTypeStateStatusEnum.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro ao buscar formas de pagamento.');
            break;
          case PaymentTypeStateStatusEnum.addOrUpdatePayment:
            hideLoader();
            showAddOrUpdatePayment();
            break;
          case PaymentTypeStateStatusEnum.saved:
            hideLoader();
            Navigator.of(context, rootNavigator: true).pop();
            controller.loadPayments();
            break;
        }
      });

      disposers.addAll([filterDisposer, statusDisposer]);
      controller.loadPayments();
    });
  }

  @override
  void dispose() {
    for (final dispose in disposers) {
      dispose();
    }

    super.dispose();
  }

  void showAddOrUpdatePayment() {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.black26,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            child: PaymentTypeFormModal(
              controller: controller,
              model: controller.selectedPaymentType,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PaymentTypeHeader(controller: controller),
          const SizedBox(height: 50),
          Expanded(
            child: Observer(
              builder: (_) {
                return GridView.builder(
                  itemCount: controller.paymentTypes.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 120,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    maxCrossAxisExtent: 680,
                  ),
                  itemBuilder: (context, index) {
                    final paymentType = controller.paymentTypes[index];

                    return PaymentTypeItem(
                      paymentType: paymentType,
                      controller: controller,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
