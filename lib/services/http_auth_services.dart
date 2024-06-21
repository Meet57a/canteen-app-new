import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth_model.dart';
import 'routes.dart';

class AuthServices {
  Future<Response> registerUser(AuthModel model) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.createUser),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(model),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> login(AuthModel model) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.loginUser),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

 Future<bool> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print(prefs.getString('token'));
    return true;
  }
}
