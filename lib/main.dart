import 'package:ALESSA/src/pages/login.dart';
import 'package:ALESSA/src/pages/registro.dart';
import 'package:flutter/material.dart';

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
      routes: {
        '/': (BuildContext context) => Login(),
        '/register': (context) => Registro(),
        //'/dashboard': (context) => Dashboard(),
        //'/update': (context) => Update(),
      },
    );
  }
}
