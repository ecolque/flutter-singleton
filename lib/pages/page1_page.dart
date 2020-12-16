import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page1Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Test Shipedge'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => userService.removeUser())
        ],
      ),
      body: userService.existsUser
          ? InfWidget(userService.getUser)
          : Center(child: Text('No selected item')),
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
        ListTile(title: Text('Age: ${user.age}')),
        Divider(
          height: 10,
        ),
        ListTile(title: Text('Profs')),
        ...user.profs.map((e) => ListTile(title: Text(e))).toList()
      ]),
    );
  }
}
