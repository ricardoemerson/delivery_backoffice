import 'dart:developer';
import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../core/enums/product_detail_state_enum.dart';
import '../../../core/exceptions/repository_exception.dart';
import '../../../models/product_model.dart';
import '../../../services/product/i_product_service.dart';

part 'product_detail_controller.g.dart';

class ProductDetailController = ProductDetailControllerBase with _$ProductDetailController;

abstract class ProductDetailControllerBase with Store {
  final IProductService _productService;

  @readonly
  var _productDetailState = ProductDetailStateEnum.initial;

  @readonly
  ProductModel? _products;

  @readonly
  String? _errorMessage;

  @readonly
  String? _imagePath;

  ProductDetailControllerBase({
    required IProductService productService,
  }) : _productService = productService;

  @action
  Future<void> uploadProductImage(Uint8List file, String filename) async {
    _productDetailState = ProductDetailStateEnum.loading;

    _imagePath = await _productService.uploadImage(file, filename);

    _productDetailState = ProductDetailStateEnum.uploaded;
  }

  @action
  Future<void> salvar({
    required String name,
    required double price,
    required String description,
  }) async {
    try {
      _productDetailState = ProductDetailStateEnum.loading;

      final product = ProductModel(
        name: name,
        description: description,
        price: price,
        image: _imagePath!,
        enabled: true,
      );

      await _productService.save(product);

      _productDetailState = ProductDetailStateEnum.saved;
    } on RepositoryException catch (err, s) {
      log('Erro ao salvar produto.', error: err, stackTrace: s);

      _productDetailState = ProductDetailStateEnum.error;
      _errorMessage = 'Erro ao salvar produto.';
    }
  }
}
