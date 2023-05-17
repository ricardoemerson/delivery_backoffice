import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../core/enums/product_state_enum.dart';
import '../../../core/exceptions/repository_exception.dart';
import '../../../models/product_model.dart';
import '../../../services/product/i_product_service.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final IProductService _productService;

  @readonly
  var _productState = ProductStateEnum.initial;

  @readonly
  var _products = <ProductModel>[];

  @readonly
  String? _errorMessage;

  @readonly
  String? _filterName;

  ProductControllerBase({
    required IProductService productService,
  }) : _productService = productService;

  @action
  Future<void> loadProducts() async {
    try {
      _productState = ProductStateEnum.loading;

      _products = await _productService.findAll(_filterName);

      _productState = ProductStateEnum.loaded;
    } on RepositoryException catch (err, s) {
      log('Erro ao buscar produtos.', error: err, stackTrace: s);

      _productState = ProductStateEnum.error;
      _errorMessage = 'Erro ao buscar produtos.';
    }
  }

  @action
  Future<void> filterByName(String name) async {
    _filterName = name;

    await loadProducts();
  }
}
