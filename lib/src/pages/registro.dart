import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  String usuario = '';

  String password = '';

  bool mostrarPassword = false;

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0x660b619c),
              Color(0x990b619c),
              Color(0xcc0b619c),
              Color(0xff0b619c),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              "Registro",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (texto) {
                usuario = texto;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                hintText: 'Ingrese Email',
                icon: Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (texto) {
                password = texto;
              },
              obscureText: !this.mostrarPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this.mostrarPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      this.mostrarPassword = !this.mostrarPassword;
                    }),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                hintText: 'Ingrese Contraseña',
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (texto) {
                password = texto;
              },
              obscureText: !this.mostrarPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this.mostrarPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      this.mostrarPassword = !this.mostrarPassword;
                    }),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                hintText: 'Confirme contraseña',
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));

              },
              child: Text(
                'Iniciar sesión',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Color.fromRGBO(11, 97, 156, 1.0);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
