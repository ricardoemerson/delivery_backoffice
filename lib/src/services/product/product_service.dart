import '../../models/product_model.dart';
import '../../repositories/product/i_product_repository.dart';
import 'i_product_service.dart';

class ProductService implements IProductService {
  final IProductRepository _productRepository;

  ProductService({
    required IProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  Future<List<ProductModel>> findAll(String? name) => _productRepository.findAll(name);

  @override
  Future<ProductModel> findById(int id) => _productRepository.findById(id);

  @override
  Future<void> save(ProductModel productModel) => _productRepository.save(productModel);

  @override
  Future<String> uploadImage(file, String fileName) =>
      _productRepository.uploadImage(file, fileName);

  @override
  Future<void> delete(int id) => _productRepository.delete(id);
}
