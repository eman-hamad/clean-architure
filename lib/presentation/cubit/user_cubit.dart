// cubit
import 'package:clean_arch/domain/entities/user.dart';
import 'package:clean_arch/domain/usecases/get_users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserEntity> users;
  UserLoaded(this.users);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

class UserCubit extends Cubit<UserState> {
  final GetUsers getTasks;

  UserCubit(this.getTasks) : super(UserInitial());

  Future<void> fetchUsers() async {
    emit(UserLoading());
    try {
      final tasks = await getTasks();
      emit(UserLoaded(tasks));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
