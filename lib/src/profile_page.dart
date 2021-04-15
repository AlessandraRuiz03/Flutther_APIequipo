import 'package:flutter/material.dart';
import 'package:flutter_appc2/models/LoginModel.dart';
class Profile_Page extends StatefulWidget {
  final LoginModel login;
  Profile_Page(this.login);

  @override
  _State createState() => _State(this.login);
}

class _State extends State<Profile_Page> {
  final LoginModel _loginModel;
  _State(this._loginModel);

  @override
  void initState() {
    print(_loginModel.name);
    print(_loginModel.token);
    print(_loginModel.user_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(249, 246, 239, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(240, 94, 100, 1),
        title: Text("Usuario"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _loginModel.name,
              style: TextStyle(
                fontSize: 50
              ),
            ),
          ],
        ),
      ),
    );
  }
}

