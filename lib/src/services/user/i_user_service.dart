import '../../models/user_model.dart';

abstract class IUserService {
  Future<UserModel> findById(int id);
}
