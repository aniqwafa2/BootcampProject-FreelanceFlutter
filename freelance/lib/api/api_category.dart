import 'package:freelance/config/config_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCategory {
  Future<http.Response> getCategory() {
    return http.get(
      Uri.parse("$apiURL/categories"),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8"
      },
    );
  }
}
