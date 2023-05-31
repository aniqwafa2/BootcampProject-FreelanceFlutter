import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:freelance/api/api_job.dart';
import 'package:flutter/material.dart';
import 'package:freelance/model/api_respons.dart';
import 'package:freelance/model/applicantcek_model.dart';
import 'package:freelance/model/job_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_myjob.dart';
import '../model/login_model.dart';
// import '../model/myjob_model.dart';
import '../model/register_model.dart';
import '../model/applicantcek_model.dart';
import '../model/user_model.dart';
import 'package:freelance/utils/user_token.dart';

class JobController {
  ApiJob _apiJob = ApiJob();
  final ApiMyJob _apiMyJob = ApiMyJob();
  final UserToken _userToken = UserToken();
  List<JobModel> items = [];
  List<ApplicantcekModel> useritems = [];

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

  Future<ApiRespons> getJobsAplicant(int jobId) async {
    http.Response result = await _apiJob.getAplicant(jobId);
    if (result.statusCode == 200) {
      Map<String, dynamic> myBody = jsonDecode(result.body);
      ApiRespons<List<ApplicantcekModel>> myRespons =
          ApiRespons.fromJson(myBody, createUserList);
      if (myRespons.data?.isNotEmpty ?? true) {
        useritems.addAll(myRespons.data!);
      }

      return myRespons;
    } else {
      return ApiRespons(code: 0, message: "error");
    }
  }

  List<ApplicantcekModel> createUserList(List json) {
    return json.map((e) => ApplicantcekModel.fromJson(e)).toList();
  }

  Future<ApiRespons> applyJob(int jobId) async {
    final getId = await _userToken.getUserId();
    final token = await _userToken.tokenAuth();

    http.Response result = await _apiJob.applyJob(jobId, getId, token);
    if (result.statusCode == 200) {
      Map<String, dynamic> myBody = jsonDecode(result.body);
      ApiRespons<UserModel> myRespons =
          ApiRespons.fromJson(myBody, UserModel.fromJson);
      return myRespons;
    } else {
      //debugPrint(result.body);
      Map<String, dynamic> myBody = jsonDecode(result.body);
      ApiRespons<UserModel> myRespons = ApiRespons.errorRespon(myBody);

      return myRespons;
    }
  }
}
