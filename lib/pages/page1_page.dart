import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page1Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? InfWidget(snapshot.data)
              : Center(child: Text('user not found'));
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
        Text('general',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        Divider(),
        ListTile(title: Text('Name: ${user.name}')),
        ListTile(title: Text('Edad: ${user.age}')),
        ListTile(title: Text('Name2: '))
      ]),
    );
  }
}
