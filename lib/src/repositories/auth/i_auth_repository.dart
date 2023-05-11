import '../../models/auth_model.dart';

abstract class IAuthRepository {
  Future<AuthModel> login(String email, String password);
}
