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

  Future<http.Response> getAplicant(int jobId) {
    return http.get(
      Uri.parse(
          "https://freelance-api.cyclic.app/api/applicants/find/job/$jobId"),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8"
      },
    );
  }

  Future<http.Response> applyJob(int jobId) {
    return http.put(
      Uri.parse(
          "https://freelance-api.cyclic.app/api/applicants/find/job/$jobId"),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8"
      },
    );
  }
}
