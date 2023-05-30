import 'package:freelance/config/config_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiMyJob {
  Future<http.Response> getAllMyJob(int userId) {
    return http.get(Uri.parse("$apiURL/applicants/find/user/$userId"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        });
  }

  Future<http.Response> postApply(int jobId, int userId, String token) {
    return http.post(Uri.parse("$apiURL/applicants/apply"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'Authorization': token,
        },
        body: jsonEncode({
          "jobId": jobId,
          "userId": userId,
        }));
  }
}
