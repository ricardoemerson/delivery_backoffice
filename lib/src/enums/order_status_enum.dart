import 'package:flutter/material.dart';

enum OrderStatusEnum {
  pending('Pendente', 'P', Colors.blue),
  confirmed('Confirmado', 'C', Colors.green),
  finalized('Finalizado', 'F', Colors.black),
  canceled('Cancelado', 'R', Colors.red);

  final String name;
  final String acronym;
  final Color color;

  const OrderStatusEnum(this.name, this.acronym, this.color);

  static OrderStatusEnum parse(String acronym) => values.firstWhere((e) => e.acronym == acronym);
}
