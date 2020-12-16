import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class Page1Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => context.bloc<UserCubit>().deleteUser(),
          )
        ],
      ),
      body: BodyStaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class BodyStaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        print(state);
        switch (state.runtimeType) {
          case UserInitial:
            return Center(child: Text('No selected user'));
          case UserSelected:
            return InfWidget((state as UserSelected).user);
          default:
            return Center(child: Text('not state'));
        }
        /* if (state is UserInitial) {
          return Center(
            child: Text('No selected user'),
          );
        } else if (state is UserSelected) {
          return InfWidget(state.user);
        } else {
          return Center(
            child: Text('not state'),
          );
        }*/
      },
    );
  }
}

class InfWidget extends StatelessWidget {
  final User user;

  const InfWidget(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Text('Datos Personales',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        ListTile(title: Text('User: ${user.name}')),
        ListTile(title: Text('Edad: ${user.age}')),
        Divider(),
        Text('Profs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        ...user.profs
            .map((e) => ListTile(
                  title: Text(e),
                ))
            .toList()
      ]),
    );
  }
}
