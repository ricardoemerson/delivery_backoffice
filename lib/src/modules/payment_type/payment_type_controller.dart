import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../enums/payment_type_state_enum.dart';
import '../../models/payment_type_model.dart';
import '../../services/auth/payment_type/i_payment_type_service.dart';

part 'payment_type_controller.g.dart';

class PaymentTypeController = PaymentTypeControllerBase with _$PaymentTypeController;

abstract class PaymentTypeControllerBase with Store {
  final IPaymentTypeService _paymentTypeService;

  @readonly
  var _paymentTypState = PaymentTypeStateEnum.initial;

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
      _paymentTypState = PaymentTypeStateEnum.loading;

      _paymentTypes = await _paymentTypeService.findAll(_filterEnabled);

      _paymentTypState = PaymentTypeStateEnum.loaded;
    } on RepositoryException catch (err, s) {
      log('Erro ao buscar formas de pagamento.', error: err, stackTrace: s);

      _paymentTypState = PaymentTypeStateEnum.error;
      _errorMessage = 'Erro ao buscar formas de pagamento.';
    }
  }

  @action
  Future<void> addPayment() async {
    _paymentTypState = PaymentTypeStateEnum.loading;

    await Future.delayed(Duration.zero);

    _selectedPaymentType = null;

    _paymentTypState = PaymentTypeStateEnum.addOrUpdatePayment;
  }

  @action
  Future<void> editPayment(PaymentTypeModel paymentType) async {
    _paymentTypState = PaymentTypeStateEnum.loading;

    await Future.delayed(Duration.zero);

    _selectedPaymentType = paymentType;

    _paymentTypState = PaymentTypeStateEnum.addOrUpdatePayment;
  }

  @action
  Future<void> savePayment({
    int? id,
    required String name,
    required String acronym,
    required bool enabled,
  }) async {
    _paymentTypState = PaymentTypeStateEnum.loading;

    final paymentType = PaymentTypeModel(
      id: id,
      name: name,
      acronym: acronym,
      enabled: enabled,
    );

    await _paymentTypeService.save(paymentType);

    _paymentTypState = PaymentTypeStateEnum.saved;
  }
}
