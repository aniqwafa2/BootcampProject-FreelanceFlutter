import 'package:flutter/material.dart';
import 'package:freelance/api/api_myjob.dart';
import 'package:freelance/model/myjob_model.dart';
import 'package:freelance/utils/user_token.dart';
import 'package:http/http.dart' as http;

class MyJobController {
  final ApiMyJob _apiMyJob = ApiMyJob();
  final UserToken _userToken = UserToken();

  Future<MyJobListModel?> getData() async {
    final getId = await _userToken.getUserId();
    http.Response result = await _apiMyJob.getAllMyJob(getId);
    if (result.statusCode < 400) {
      //debugPrint(result.body);
      return myJobListModelFromJson(result.body);
    } else {
      return null;
    }
  }
}
