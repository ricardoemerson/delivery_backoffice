import '../../models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> findById(int id);
}
