import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Set user'),
            color: Colors.blue[100],
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('Change'),
            color: Colors.blue[100],
            onPressed: () {},
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
