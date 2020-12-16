import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/pages/page1_page.dart';
import 'package:states/pages/page2_page.dart';
import 'package:states/services/user_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new UserService())],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: 'page1',
        routes: {
          'page1': (_) => Page1Page(),
          'page2': (_) => Page2Page(),
        },
      ),
    );
  }
}
