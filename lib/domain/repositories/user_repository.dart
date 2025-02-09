import 'package:clean_arch/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
