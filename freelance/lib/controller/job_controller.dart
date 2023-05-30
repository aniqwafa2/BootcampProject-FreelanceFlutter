import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:freelance/api/api_job.dart';
import 'package:flutter/material.dart';
import 'package:freelance/model/api_respons.dart';
import 'package:freelance/model/job_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_model.dart';
import '../model/register_model.dart';
import '../model/user_model.dart';

class JobController {
  ApiJob _apiJob = ApiJob();

  List<JobModel> items = [];

  Future<ApiRespons> getJobslist() async {
    http.Response result = await _apiJob.getJob();
    if (result.statusCode == 200) {
      Map<String, dynamic> myBody = jsonDecode(result.body);
      ApiRespons<List<JobModel>> myRespons =
          ApiRespons.fromJson(myBody, createList);

      if (myRespons.data != null) items.addAll(myRespons.data!);
      //debugPrint("${items.length}");
      return myRespons;
    } else {
      return ApiRespons(code: 0, message: "error");
    }
  }

  List<JobModel> createList(List json) {
    return json.map((e) => JobModel.fromJson(e)).toList();
  }
}
