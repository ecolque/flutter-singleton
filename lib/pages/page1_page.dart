import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';

class Page1Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(DeleteUser());
            },
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state.existsUser) {
            return InfWidget(state.user);
          } else {
            return Center(child: Text('no user'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
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
        ListTile(title: Text('user: ${user.name}')),
        ListTile(title: Text('age: ${user.age}')),
        Divider(),
        Text('Profs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        ...user.profs.map((p) => ListTile(title: Text(p))).toList()
      ]),
    );
  }
}
