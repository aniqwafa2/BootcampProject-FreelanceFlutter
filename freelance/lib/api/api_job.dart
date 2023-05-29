import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiJob {
  Future<http.Response> getJob() {
    return http.get(
      Uri.parse("https://freelance-api.cyclic.app/api/jobs"),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8"
      },
    );
  }
}
