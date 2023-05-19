import 'package:mobx/mobx.dart';

part 'order_controller.g.dart';

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {}
