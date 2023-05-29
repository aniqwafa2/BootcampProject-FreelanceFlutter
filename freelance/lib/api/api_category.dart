import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCategory {
  Future<http.Response> getCategory() {
    return http.get(
      Uri.parse("https://freelance-api.cyclic.app/api/categories"),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8"
      },
    );
  }
}
