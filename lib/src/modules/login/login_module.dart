import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/i_auth_repository.dart';
import '../../services/auth/auth_service.dart';
import '../../services/auth/i_auth_service.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IAuthRepository>(
          (i) => AuthRepository(restClient: i()),
        ),
        Bind.lazySingleton<IAuthService>(
          (i) => AuthService(authRepository: i(), storage: i()),
        ),
        Bind.lazySingleton((i) => LoginController(authService: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const LoginPage(),
        )
      ];
}
