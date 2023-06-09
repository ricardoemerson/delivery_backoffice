// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentTypeController on PaymentTypeControllerBase, Store {
  late final _$_paymentTypStateAtom = Atom(
      name: 'PaymentTypeControllerBase._paymentTypState', context: context);

  PaymentTypeStateEnum get paymentTypState {
    _$_paymentTypStateAtom.reportRead();
    return super._paymentTypState;
  }

  @override
  PaymentTypeStateEnum get _paymentTypState => paymentTypState;

  @override
  set _paymentTypState(PaymentTypeStateEnum value) {
    _$_paymentTypStateAtom.reportWrite(value, super._paymentTypState, () {
      super._paymentTypState = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'PaymentTypeControllerBase._errorMessage', context: context);

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

  late final _$_paymentTypesAtom =
      Atom(name: 'PaymentTypeControllerBase._paymentTypes', context: context);

  List<PaymentTypeModel> get paymentTypes {
    _$_paymentTypesAtom.reportRead();
    return super._paymentTypes;
  }

  @override
  List<PaymentTypeModel> get _paymentTypes => paymentTypes;

  @override
  set _paymentTypes(List<PaymentTypeModel> value) {
    _$_paymentTypesAtom.reportWrite(value, super._paymentTypes, () {
      super._paymentTypes = value;
    });
  }

  late final _$_selectedPaymentTypeAtom = Atom(
      name: 'PaymentTypeControllerBase._selectedPaymentType', context: context);

  PaymentTypeModel? get selectedPaymentType {
    _$_selectedPaymentTypeAtom.reportRead();
    return super._selectedPaymentType;
  }

  @override
  PaymentTypeModel? get _selectedPaymentType => selectedPaymentType;

  @override
  set _selectedPaymentType(PaymentTypeModel? value) {
    _$_selectedPaymentTypeAtom.reportWrite(value, super._selectedPaymentType,
        () {
      super._selectedPaymentType = value;
    });
  }

  late final _$_filterEnabledAtom =
      Atom(name: 'PaymentTypeControllerBase._filterEnabled', context: context);

  bool? get filterEnabled {
    _$_filterEnabledAtom.reportRead();
    return super._filterEnabled;
  }

  @override
  bool? get _filterEnabled => filterEnabled;

  @override
  set _filterEnabled(bool? value) {
    _$_filterEnabledAtom.reportWrite(value, super._filterEnabled, () {
      super._filterEnabled = value;
    });
  }

  late final _$loadPaymentsAsyncAction =
      AsyncAction('PaymentTypeControllerBase.loadPayments', context: context);

  @override
  Future<void> loadPayments() {
    return _$loadPaymentsAsyncAction.run(() => super.loadPayments());
  }

  late final _$addPaymentAsyncAction =
      AsyncAction('PaymentTypeControllerBase.addPayment', context: context);

  @override
  Future<void> addPayment() {
    return _$addPaymentAsyncAction.run(() => super.addPayment());
  }

  late final _$editPaymentAsyncAction =
      AsyncAction('PaymentTypeControllerBase.editPayment', context: context);

  @override
  Future<void> editPayment(PaymentTypeModel paymentType) {
    return _$editPaymentAsyncAction.run(() => super.editPayment(paymentType));
  }

  late final _$savePaymentAsyncAction =
      AsyncAction('PaymentTypeControllerBase.savePayment', context: context);

  @override
  Future<void> savePayment(
      {int? id,
      required String name,
      required String acronym,
      required bool enabled}) {
    return _$savePaymentAsyncAction.run(() => super
        .savePayment(id: id, name: name, acronym: acronym, enabled: enabled));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
