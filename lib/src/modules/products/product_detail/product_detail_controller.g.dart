// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductDetailController on ProductDetailControllerBase, Store {
  late final _$_productDetailStateAtom = Atom(
      name: 'ProductDetailControllerBase._productDetailState',
      context: context);

  ProductDetailStateEnum get productDetailState {
    _$_productDetailStateAtom.reportRead();
    return super._productDetailState;
  }

  @override
  ProductDetailStateEnum get _productDetailState => productDetailState;

  @override
  set _productDetailState(ProductDetailStateEnum value) {
    _$_productDetailStateAtom.reportWrite(value, super._productDetailState, () {
      super._productDetailState = value;
    });
  }

  late final _$_productAtom =
      Atom(name: 'ProductDetailControllerBase._product', context: context);

  ProductModel? get product {
    _$_productAtom.reportRead();
    return super._product;
  }

  @override
  ProductModel? get _product => product;

  @override
  set _product(ProductModel? value) {
    _$_productAtom.reportWrite(value, super._product, () {
      super._product = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'ProductDetailControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_imagePathAtom =
      Atom(name: 'ProductDetailControllerBase._imagePath', context: context);

  String? get imagePath {
    _$_imagePathAtom.reportRead();
    return super._imagePath;
  }

  @override
  String? get _imagePath => imagePath;

  @override
  set _imagePath(String? value) {
    _$_imagePathAtom.reportWrite(value, super._imagePath, () {
      super._imagePath = value;
    });
  }

  late final _$uploadProductImageAsyncAction = AsyncAction(
      'ProductDetailControllerBase.uploadProductImage',
      context: context);

  @override
  Future<void> uploadProductImage(Uint8List file, String filename) {
    return _$uploadProductImageAsyncAction
        .run(() => super.uploadProductImage(file, filename));
  }

  late final _$salvarAsyncAction =
      AsyncAction('ProductDetailControllerBase.salvar', context: context);

  @override
  Future<void> salvar(
      {int? id,
      required String name,
      required double price,
      required String description}) {
    return _$salvarAsyncAction.run(() => super
        .salvar(id: id, name: name, price: price, description: description));
  }

  late final _$loadProductByIdAsyncAction = AsyncAction(
      'ProductDetailControllerBase.loadProductById',
      context: context);

  @override
  Future<void> loadProductById(int? id) {
    return _$loadProductByIdAsyncAction.run(() => super.loadProductById(id));
  }

  late final _$ProductDetailControllerBaseActionController =
      ActionController(name: 'ProductDetailControllerBase', context: context);

  @override
  void clearData() {
    final _$actionInfo = _$ProductDetailControllerBaseActionController
        .startAction(name: 'ProductDetailControllerBase.clearData');
    try {
      return super.clearData();
    } finally {
      _$ProductDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
