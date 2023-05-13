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

  PaymentTypeControllerBase({
    required IPaymentTypeService paymentTypeService,
  }) : _paymentTypeService = paymentTypeService;

  @action
  Future<void> loadPayments() async {
    try {
      _status = PaymentTypeStateStatusEnum.loading;

      _paymentTypes = await _paymentTypeService.findAll(true);

      _status = PaymentTypeStateStatusEnum.loaded;
    } on RepositoryException catch (err, s) {
      log('Erro ao carregar as formas de pagamento.', error: err, stackTrace: s);

      _status = PaymentTypeStateStatusEnum.error;
      _errorMessage = 'Erro ao carregar as formas de pagamento.';
    }
  }
}
