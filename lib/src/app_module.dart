import 'package:flutter_modular/flutter_modular.dart';

import 'modules/base_layout/base_layout_page.dart';
import 'modules/core/core_module.dart';
import 'modules/login/login_module.dart';
import 'modules/payment_type/payment_type_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/login', module: LoginModule()),
        ChildRoute(
          '/',
          child: (context, args) => const BaseLayoutPage(
            body: RouterOutlet(),
          ),
          children: [
            ModuleRoute('/payment-type', module: PaymentTypeModule()),
          ],
        ),
      ];
}
