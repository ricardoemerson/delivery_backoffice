import '../../models/payment_type_model.dart';

abstract class IPaymentTypeRepository {
  Future<List<PaymentTypeModel>> findAll(bool? enabled);
  Future<PaymentTypeModel> findById(int id);
  Future<void> save(PaymentTypeModel paymentTypeModel);
}
