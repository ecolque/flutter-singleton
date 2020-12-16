import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page 1'),
      ),
      body: InfWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class InfWidget extends StatelessWidget {
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
        ListTile(title: Text('Name: ')),
        Divider(),
        Text('Profs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        ListTile(title: Text('Name: ')),
        ListTile(title: Text('Name1: ')),
        ListTile(title: Text('Name2: '))
      ]),
    );
  }
}
