import '../../core/enums/session_storage_keys_enum.dart';
import '../../core/storage/storage/i_storage.dart';
import '../../repositories/auth/i_auth_repository.dart';
import 'i_auth_service.dart';

class AuthService implements IAuthService {
  final IAuthRepository _authRepository;
  final IStorage _storage;

  AuthService({
    required IAuthRepository authRepository,
    required IStorage storage,
  })  : _authRepository = authRepository,
        _storage = storage;

  @override
  Future<void> login(String email, String password) async {
    final authModel = await _authRepository.login(email, password);

    _storage.setData(SessionStorageKeysEnum.accessToken.key, authModel.accessToken);
  }
}
