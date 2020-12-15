import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page2Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('Name: ${snapshot.data.name}')
                : Text("Page");
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Set user'),
            color: Colors.blue[100],
            onPressed: () {
              final newUser = new User(name: 'name one 11', age: 10);
              userService.chargeUser(newUser);
            },
          ),
          MaterialButton(
            child: Text('Change age'),
            color: Colors.blue[100],
            onPressed: () {
              userService.changeAge(50);
            },
          ),
          MaterialButton(
            child: Text('Add'),
            color: Colors.blue[100],
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
