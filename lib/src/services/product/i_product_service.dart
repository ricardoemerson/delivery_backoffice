import 'dart:typed_data';

import '../../models/product_model.dart';

abstract class IProductService {
  Future<List<ProductModel>> findAll(String? name);
  Future<ProductModel> findById(int id);
  Future<void> save(ProductModel productModel);
  Future<String> uploadImage(Uint8List file, String filename);
  Future<void> delete(int id);
}
