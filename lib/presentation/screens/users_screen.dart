// ui

import 'package:clean_arch/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Users'))),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return Center(
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final task = state.users[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Text(task.id),
                        SizedBox(width:10),
                        Text(task.name),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No Users Yet'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserCubit>().fetchUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
