import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:freelance/api/api_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_model.dart';
import '../model/register_model.dart';
import '../model/user_model.dart';

class AuthController {
  ApiAuth _apiAuth = ApiAuth();

  String pesan = "";
  bool end = false;
  bool loading = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();

  Future<RegisterModel> register() async {
    http.Response result = await _apiAuth.signup(
        fullNameController.text, emailController.text, passwordController.text);
    if (result.statusCode < 400) {
      Map<String, dynamic> converted = jsonDecode(result.body);
      RegisterModel<UserModel> registerModel =
          RegisterModel.fromJson(converted, UserModel.fromJson);
      return registerModel;
    } else {
      RegisterModel<UserModel> registerModel = RegisterModel.errorRespons(1);
      return registerModel;
    }
  }

  Future<LoginModel> login() async {
    http.Response result =
        await _apiAuth.signin(emailController.text, passwordController.text);
    if (result.statusCode < 400) {
      Map<String, dynamic> converted = jsonDecode(result.body);
      LoginModel loginModel = LoginModel.fromJson(converted);

      if (loginModel.code == 0) {
        final prefs = await SharedPreferences.getInstance();

        //simpan token
        await prefs.setString('token', loginModel.access_token);
      }

      return loginModel;
    } else {
      Map<String, dynamic> converted = jsonDecode(result.body);
      LoginModel loginModel = LoginModel.errorRespon(converted);
      return loginModel;
    }
  }
}
