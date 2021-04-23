import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Provider {
  final Dio dio_ = Dio();
  final api = "http://34.239.109.204/api/v1";

  Future<void> Register(
    BuildContext context, {
    @required String username,
    @required String password,
  }) async {
    try {
      final response = await this
          .dio_
          .post("http://34.239.109.204/api/v1/registration/", data: {
        "username": username,
        "password1": password,
        "password2": password,
      });

      if (response.statusCode == 201)
        login(context, username: username, password: password);
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 400)
          print("Error en registro: " + e.response.toString());
        else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      print('Error registr: o' + e.toString());
    }
  }

  Future<void> login(BuildContext context,
      {@required String username, @required String password}) async {
    try {
      final response = await this.dio_.post(
          "http://34.239.109.204/api/v1/login/",
          data: {"username": username, "password": password});

      if (response.statusCode == 200)
        profile(context,
            userId: response.data['user_id'], token: response.data['token']);
      ;
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 401)
          print("Credenciales incorrectas");
        else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      print('Error login:' + e.toString());
    }
  }

  void profile(BuildContext context, {userId, token}) {}
}
