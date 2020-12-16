import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';

class Page2Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('page2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Set user'),
            color: Colors.blue[100],
            onPressed: () {
              final newUser =
                  new User(name: 'new user', age: 20, profs: ['dev', 'test']);
              userBloc.add(ActiveUser(newUser));
            },
          ),
          MaterialButton(
            child: Text('Change'),
            color: Colors.blue[100],
            onPressed: () {
              userBloc.add(ChangeAge(88));
            },
          ),
          MaterialButton(
            child: Text('Add'),
            color: Colors.blue[100],
            onPressed: () {
              userBloc.add(AddProfs('uno....'));
            },
          )
        ],
      )),
    );
  }
}
