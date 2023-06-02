import '../../models/user_model.dart';
import '../../repositories/user/i_user_repository.dart';
import 'i_user_service.dart';

class UserService implements IUserService {
  final IUserRepository _userRepository;

  UserService({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> findById(int id) => _userRepository.findById(id);
}
