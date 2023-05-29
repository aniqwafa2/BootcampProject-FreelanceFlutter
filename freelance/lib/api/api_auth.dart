import 'package:freelance/config/config_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiAuth {
  Future<http.Response> signup(String name, String email, String password) {
    return http.post(Uri.parse("$apiURL/users/register"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
        }));
  }

  Future<http.Response> signin(String email, String password) {
    return http.post(Uri.parse("$apiURL/users/login"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
  }
}
