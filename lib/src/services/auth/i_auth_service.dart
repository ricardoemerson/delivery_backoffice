abstract class IAuthService {
  Future<void> login(String email, String password);
}
