import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/extensions/app_text_styles_extension.dart';
import '../../../core/extensions/size_extension.dart';
import '../../../models/payment_type_model.dart';
import '../payment_type_controller.dart';

class PaymentTypeFormModal extends StatefulWidget {
  final PaymentTypeController controller;
  final PaymentTypeModel? model;

  const PaymentTypeFormModal({
    super.key,
    required this.model,
    required this.controller,
  });

  @override
  State<PaymentTypeFormModal> createState() => _PaymentTypeFormModalState();
}

class _PaymentTypeFormModalState extends State<PaymentTypeFormModal> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _acronymEC = TextEditingController();
  var _enabled = false;

  @override
  void initState() {
    super.initState();

    final paymentType = widget.model;

    if (paymentType != null) {
      _nameEC.text = paymentType.name;
      _acronymEC.text = paymentType.acronym;
      _enabled = paymentType.enabled;
    }
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _acronymEC.dispose();

    super.dispose();
  }

  void _closeModal() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final screeWidth = context.screenWidth;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: screeWidth * (screeWidth > 1200 ? .5 : .7),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      child: Text(
                        '${widget.model == null ? 'Adicionar' : 'Editar'} forma de pagamento',
                        style: context.textStyles.textTitle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: _closeModal,
                        child: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameEC,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: Validatorless.required('Nome obrigatório'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _acronymEC,
                  decoration: const InputDecoration(labelText: 'Sigla'),
                  validator: Validatorless.required('Sigla obrigatória'),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Ativo:',
                      style: context.textStyles.textRegular,
                    ),
                    Switch(
                      value: _enabled,
                      onChanged: (value) {
                        setState(() {
                          _enabled = value;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 42,
                      child: OutlinedButton(
                        onPressed: _closeModal,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                        ),
                        child: Text(
                          'Cancelar',
                          style: context.textStyles.textExtraBold.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      height: 42,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          final formIsValid = _formKey.currentState?.validate() ?? false;

                          if (formIsValid) {
                            final name = _nameEC.text;
                            final acronym = _acronymEC.text;

                            widget.controller.savePayment(
                              id: widget.model?.id,
                              name: name,
                              acronym: acronym,
                              enabled: _enabled,
                            );
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text(
                          'Salvar',
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
