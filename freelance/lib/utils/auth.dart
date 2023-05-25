import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  signup(String name, String email, String password) async {
    Uri url = Uri.parse("https://freelance-api.cyclic.app/api/users/register");
    http.Response respon = await http
        .post(url, body: {"name": name, "email": email, "password": password});
    return (jsonDecode(respon.body));
  }
}
