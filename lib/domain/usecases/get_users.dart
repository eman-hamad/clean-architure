// use case

import 'package:clean_arch/domain/entities/user.dart';
import 'package:clean_arch/domain/repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<List<UserEntity>> call() async {
    return await repository.getUsers();
  }
}
