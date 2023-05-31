import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiMyChat {
  Future<http.Response> getAllMyChat(int userId) {
    return http.get(
        Uri.parse("https://freelance-api.cyclic.app/api/messages/$userId"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        });
  }

  Future<http.Response> getDetailMyChat(int userId) {
    return http.get(
        Uri.parse(
            "https://freelance-api.cyclic.app/api/messages/detail/$userId?order=asc"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        });
  }
}
