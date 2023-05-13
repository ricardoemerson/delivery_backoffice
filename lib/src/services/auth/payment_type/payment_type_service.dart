import '../../../models/payment_type_model.dart';
import '../../../repositories/payment_type/i_payment_type_repository.dart';
import 'i_payment_type_service.dart';

class PaymentTypeService implements IPaymentTypeService {
  final IPaymentTypeRepository _paymentTypeRepository;

  PaymentTypeService({
    required IPaymentTypeRepository paymentTypeRepository,
  }) : _paymentTypeRepository = paymentTypeRepository;

  @override
  Future<List<PaymentTypeModel>> findAll(bool? enabled) => _paymentTypeRepository.findAll(enabled);

  @override
  Future<PaymentTypeModel> findById(int id) => _paymentTypeRepository.findById(id);

  @override
  Future<void> save(PaymentTypeModel paymentTypeModel) =>
      _paymentTypeRepository.save(paymentTypeModel);
}
