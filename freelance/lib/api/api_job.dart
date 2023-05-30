import 'package:freelance/config/config_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiJob {
  Future<http.Response> getJob() {
    return http.get(
      Uri.parse("$apiURL/jobs"),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8"
      },
    );
  }

  Future<http.Response> getAplicant(int jobId) {
    return http.get(
      Uri.parse("$apiURL/applicants/find/job/$jobId"),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8"
      },
    );
  }

  // Future<http.Response> applyJob(int jobId) {
  //   return http.put(
  //     Uri.parse("$apiURL/applicants/find/job/$jobId"),
  //     headers: <String, String>{
  //       'Content-Type': "application/json; charset=UTF-8"
  //     },
  //   );
  // }

  Future<http.Response> applyJob(int jobId, int userId, String token) {
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
