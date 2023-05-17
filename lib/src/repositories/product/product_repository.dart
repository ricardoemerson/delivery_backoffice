import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/product_model.dart';
import 'i_product_repository.dart';

class ProductRepository implements IProductRepository {
  final RestClient _restClient;

  ProductRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll(String? name) async {
    try {
      final products = await _restClient.authRequest().get(
        '/products',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );

      return products.data.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
    } on DioError catch (err, s) {
      log('Erro ao buscar produtos.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao buscar produtos.');
    }
  }

  @override
  Future<ProductModel> findById(int id) async {
    try {
      final product = await _restClient.authRequest().get('/products/$id');

      return ProductModel.fromMap(product.data);
    } on DioError catch (err, s) {
      log('Erro ao buscar produto $id.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao buscar produto $id.');
    }
  }

  @override
  Future<void> save(ProductModel productModel) async {
    try {
      if (productModel.id == null) {
        await _restClient.authRequest().post(
              '/products',
              data: productModel.toMap(),
            );
      } else {
        await _restClient.authRequest().put(
              '/products/${productModel.id}',
              data: productModel.toMap(),
            );
      }
    } on DioError catch (err, s) {
      log('Erro ao salvar produto.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao salvar produto.');
    }
  }

  @override
  Future<String> uploadImage(Uint8List file, String filename) async {
    try {
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(file, filename: filename),
      });

      final upload = await _restClient.authRequest().post('/uploads', data: formData);

      return upload.data['url'];
    } on DioError catch (err, s) {
      log('Erro fazer o upload da imagem.', error: err, stackTrace: s);
      throw RepositoryException('Erro fazer o upload da imagem.');
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _restClient.authRequest().put(
        '/products/$id',
        data: {
          'enabled': false,
        },
      );
    } on DioError catch (err, s) {
      log('Erro ao excluir produto.', error: err, stackTrace: s);
      throw RepositoryException('Erro ao excluir produto.');
    }
  }
}
