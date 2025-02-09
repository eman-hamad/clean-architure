import 'package:clean_arch/data/models/user_model.dart';

//data source
abstract class UserDataSource {
  Future<List<UserModel>> fetchUsers();
}

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<UserModel>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      UserModel(id: '1', name: 'Eman'),
      UserModel(id: '2', name: 'Asmaa'),
      UserModel(id: '3', name: 'Mona'),
      UserModel(id: '3', name: 'Heba'),
    ];
  }
}
