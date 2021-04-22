import 'package:flutter/material.dart';
import 'package:flutter_appc2/src/pages/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamAlessa',
      initialRoute: '/',
      routes: {'/': (BuildContext context) => Login()},
    );
  }
}
