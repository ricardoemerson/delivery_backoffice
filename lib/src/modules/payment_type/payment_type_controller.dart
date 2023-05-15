import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/enums/payment_type_state_status_enum.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../models/payment_type_model.dart';
import '../../services/auth/payment_type/i_payment_type_service.dart';

part 'payment_type_controller.g.dart';

class PaymentTypeController = PaymentTypeControllerBase with _$PaymentTypeController;

abstract class PaymentTypeControllerBase with Store {
  final IPaymentTypeService _paymentTypeService;

  @readonly
  var _status = PaymentTypeStateStatusEnum.initial;

  @readonly
  String? _errorMessage;

  @readonly
  var _paymentTypes = <PaymentTypeModel>[];

  @readonly
  PaymentTypeModel? _selectedPaymentType;

  @readonly
  bool? _filterEnabled;

  PaymentTypeControllerBase({
    required IPaymentTypeService paymentTypeService,
  }) : _paymentTypeService = paymentTypeService;

  void changeFilter(bool? enabled) => _filterEnabled = enabled;

  @action
  Future<void> loadPayments() async {
    try {
      _status = PaymentTypeStateStatusEnum.loading;

      _paymentTypes = await _paymentTypeService.findAll(_filterEnabled);

      _status = PaymentTypeStateStatusEnum.loaded;
    } on RepositoryException catch (err, s) {
      log('Erro ao carregar as formas de pagamento.', error: err, stackTrace: s);

      _status = PaymentTypeStateStatusEnum.error;
      _errorMessage = 'Erro ao carregar as formas de pagamento.';
    }
  }

  @action
  Future<void> addPayment() async {
    _status = PaymentTypeStateStatusEnum.loading;

    await Future.delayed(Duration.zero);

    _selectedPaymentType = null;

    _status = PaymentTypeStateStatusEnum.addOrUpdatePayment;
  }

  @action
  Future<void> editPayment(PaymentTypeModel paymentType) async {
    _status = PaymentTypeStateStatusEnum.loading;

    await Future.delayed(Duration.zero);

    _selectedPaymentType = paymentType;

    _status = PaymentTypeStateStatusEnum.addOrUpdatePayment;
  }

  @action
  Future<void> savePayment({
    int? id,
    required String name,
    required String acronym,
    required bool enabled,
  }) async {
    _status = PaymentTypeStateStatusEnum.loading;

    final paymentType = PaymentTypeModel(
      id: id,
      name: name,
      acronym: acronym,
      enabled: enabled,
    );

    await _paymentTypeService.save(paymentType);

    _status = PaymentTypeStateStatusEnum.saved;
  }
}
