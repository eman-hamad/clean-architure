import 'package:clean_arch/app/app.dart';
import 'package:clean_arch/bootstrap.dart';
import 'package:clean_arch/data/data_sources/user_data_source.dart';
import 'package:clean_arch/data/repositories/user_repository_impl.dart';
import 'package:clean_arch/domain/repositories/user_repository.dart';
import 'package:clean_arch/domain/usecases/get_users.dart';
import 'package:clean_arch/presentation/cubit/user_cubit.dart';
import 'package:clean_arch/presentation/screens/users_screen.dart';

// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


void setup() {
  final getIt = GetIt.instance;

  // Register Data Layer
  getIt..registerLazySingleton<UserDataSource>(() => UserDataSourceImpl())

  // Register Repository
  ..registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(dataSource: getIt<UserDataSource>()),
  );

  // Register Use Case
  getIt.registerLazySingleton<GetUsers>(() => GetUsers(getIt<UserRepository>()));

  // Register Cubit
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt<GetUsers>()));
}

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => GetIt.instance<UserCubit>(),
        child: UsersScreen(),
      ),
    );
  }
}

