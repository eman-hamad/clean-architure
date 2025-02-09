// repositoty

import 'package:clean_arch/data/data_sources/user_data_source.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:clean_arch/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl({required this.dataSource});
// get users
  @override
  Future<List<UserEntity>> getUsers() async {
    final taskModels = await dataSource.fetchUsers();
    return taskModels
        .map((task) => UserEntity(id: task.id, name: task.name))
        .toList();
  }
}
