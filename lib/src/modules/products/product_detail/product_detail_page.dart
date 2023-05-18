import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/enums/product_detail_state_enum.dart';
import '../../../core/env/env.dart';
import '../../../core/extensions/app_text_styles_extension.dart';
import '../../../core/extensions/formatter_extension.dart';
import '../../../core/extensions/size_extension.dart';
import '../../../core/helpers/upload_html_helper.dart';
import '../../../core/mixins/loader_mixin.dart';
import '../../../core/mixins/message_mixin.dart';
import '../../../models/product_model.dart';
import 'product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final int? id;

  const ProductDetailPage({super.key, this.id});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> with LoaderMixin, MessageMixin {
  final controller = Modular.get<ProductDetailController>();

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _priceEC = TextEditingController();
  final _descriptionEC = TextEditingController();

  late final ReactionDisposer statusDisposer;

  ProductModel? product;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.productDetailState, (status) {
        switch (status) {
          case ProductDetailStateEnum.initial:
            break;
          case ProductDetailStateEnum.loading:
            showLoader();
            break;
          case ProductDetailStateEnum.loaded:
            hideLoader();

            final model = controller.product!;

            _nameEC.text = model.name;
            _priceEC.text = model.price.toCurrencyPtBr;
            _descriptionEC.text = model.description;

            break;
          case ProductDetailStateEnum.error:
            hideLoader();
            showError(controller.errorMessage!);
            Navigator.of(context).pop();

            break;
          case ProductDetailStateEnum.uploaded:
            hideLoader();
            break;
          case ProductDetailStateEnum.saved:
          case ProductDetailStateEnum.deleted:
            hideLoader();
            Navigator.of(context).pop();
            break;
        }
      });

      if (widget.id != null) {
        controller.loadProductById(widget.id);
      } else {
        controller.clearData();
      }
    });
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _priceEC.dispose();
    _descriptionEC.dispose();

    statusDisposer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthButtonAction = context.percentWidth(.2);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${widget.id != null ? 'Alterar' : 'Adicionar'} Produto',
                    style: context.textStyles.textTitle.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Observer(
                      builder: (_) {
                        if (controller.imagePath != null) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              '${Env.instance.get('BACKEND_BASE_URL')}${controller.imagePath}',
                              width: 200,
                            ),
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        onPressed: () {
                          UploadHtmlHelper().startUpload(controller.uploadProductImage);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(.9),
                        ),
                        child: Observer(
                          builder: (_) {
                            return Text(
                              '${controller.imagePath == null ? 'Adicionar' : 'Alterar'} Foto',
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameEC,
                        decoration: const InputDecoration(labelText: 'Nome'),
                        validator: Validatorless.required('Nome obrigatório'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _priceEC,
                        decoration: const InputDecoration(labelText: 'Preço'),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter(moeda: true)
                        ],
                        validator: Validatorless.required('Preço obrigatório'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: controller.imagePath == null ? 20 : 3),
            TextFormField(
              controller: _descriptionEC,
              keyboardType: TextInputType.multiline,
              minLines: 10,
              maxLines: 20,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                alignLabelWithHint: true,
              ),
              validator: Validatorless.required('Descrição obrigatória'),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: widthButtonAction,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: widget.id != null,
                      child: SizedBox(
                        width: widthButtonAction / 2 - 5,
                        height: 40,
                        child: OutlinedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Confirmar'),
                                  content: Text(
                                    'Confirma a exclusão do produto ${controller.product?.name}?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: Text(
                                        'Cancelar',
                                        style: context.textStyles.textBold.copyWith(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        controller.delete();
                                      },
                                      child: Text(
                                        'Confirmar',
                                        style: context.textStyles.textBold,
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                          ),
                          child: Text(
                            'Excluir',
                            style: context.textStyles.textExtraBold.copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: widthButtonAction / 2 - 5,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          final formIsValid = _formKey.currentState?.validate() ?? false;

                          if (formIsValid) {
                            if (controller.imagePath == null) {
                              showWarning(
                                'Imagem obrigatória, por favor cliquem em Adicionar Foto.',
                              );

                              return;
                            }

                            controller.salvar(
                              id: widget.id,
                              name: _nameEC.text,
                              price: UtilBrasilFields.converterMoedaParaDouble(_priceEC.text),
                              description: _descriptionEC.text,
                            );
                          }
                        },
                        child: const Text(
                          'Salvar',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
