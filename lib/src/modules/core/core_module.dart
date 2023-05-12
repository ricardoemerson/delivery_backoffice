import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/rest_client.dart';
import '../../core/storage/storage/i_storage.dart';
import '../../core/storage/storage/session_storage.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IStorage>((i) => SessionStorage(), export: true),
        Bind.lazySingleton((i) => RestClient(storage: i()), export: true),
      ];
}
