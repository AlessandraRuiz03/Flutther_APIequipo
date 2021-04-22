import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appc2/main.dart';
import 'package:flutter_appc2/src/pages/registro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'tarjetaPage.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock, color: Color(0xff0b619c)),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.email, color: Color(0xff0b619c)),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildLoginBtn(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TarjetaPage()));
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Text('LOGIN',
          style: TextStyle(
              color: Color(0xff0b619c),
              fontSize: 18,
              fontWeight: FontWeight.bold)),
    ),
  );
}

Widget buildSignUpBtn(BuildContext context) {
  return FlatButton(
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'No tienes una cuenta? ',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      TextSpan(
          text: 'Sing Up',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    ])),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Registro()));
    },
  );
}


singIN(String email, pass, BuildContext context) async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();

  Map data = {'email': email, 'password': pass};

  // ignore: avoid_init_to_null
  var jsonResponse = null;
  
  var response = await http.post("http://apiliy.ddns.net:3000/api/usuarios", body: data);
  jsonResponse = json.decode(response.body);
  if (jsonResponse != null) {
    setState(() {
      _isLoading = false;
    });
    sharedPreference.setString("token", jsonResponse['token']);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext contex) => Login()),(Route<dynamic> route) => false);
  } else {
    setState(() {
      _isLoading = false;
    });
    print(response.body)
  }
}




class _Login extends State<Login> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Stack(
            children: <Widget>[
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0x660b619c),
                        Color(0x990b619c),
                        Color(0xcc0b619c),
                        Color(0xff0b619c),
                      ])),
                  child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            buildEmail(),
                            SizedBox(
                              height: 20,
                            ),
                            buildPassword(),
                            buildLoginBtn(context),
                            buildSignUpBtn(context),
                          ]
                          )
                          )
                          )
            ],
          ))),
    );
  }
}
