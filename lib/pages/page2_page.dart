import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page2Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2 ${userService.getUser?.name}'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Set user'),
            color: Colors.blue[100],
            onPressed: () {
              final newUser = new User(
                  name: 'new name',
                  age: 30,
                  profs: ['developer', 'tester', 'Master']);
              userService.setUser = newUser;
            },
          ),
          MaterialButton(
            child: Text('Set age'),
            color: Colors.blue[100],
            onPressed: () {
              userService.setAge(50);
            },
          ),
          MaterialButton(
            child: Text('Add'),
            color: Colors.blue[100],
            onPressed: () {
              userService.addProfs();
            },
          )
        ],
      )),
    );
  }
}
