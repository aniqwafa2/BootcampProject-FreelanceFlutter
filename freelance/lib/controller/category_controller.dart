import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:freelance/api/api_category.dart';
import 'package:freelance/api/api_job.dart';
import 'package:flutter/material.dart';
import 'package:freelance/model/api_respons.dart';
import 'package:freelance/model/category_model.dart';
import 'package:freelance/model/job_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_model.dart';
import '../model/register_model.dart';
import '../model/user_model.dart';

class CategoryController {
  ApiCategory _ApiCategory = ApiCategory();

  List<CategoryModel> items = [];

  Future<ApiRespons> getCategorylist() async {
    http.Response result = await _ApiCategory.getCategory();
    if (result.statusCode == 200) {
      Map<String, dynamic> myBody = jsonDecode(result.body);
      ApiRespons<List<CategoryModel>> myRespons =
          ApiRespons.fromJson(myBody, createList);

      if (myRespons.data != null) items.addAll(myRespons.data!);
      return myRespons;
    } else {
      return ApiRespons(code: 0, message: "error");
    }
  }

  List<CategoryModel> createList(List json) {
    return json.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
