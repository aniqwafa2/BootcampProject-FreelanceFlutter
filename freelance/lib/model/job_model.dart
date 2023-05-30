import 'package:flutter/material.dart';

class JobModel {
  int id;
  String name;
  int price;
  String description;
  int categoryId;
  bool status;
  String file;
  String dueDate;
  String createdAt;
  String category;

  JobModel(
      {this.id = 0,
      this.name = "",
      this.price = 0,
      this.description = "",
      this.categoryId = 0,
      this.status = false,
      this.file = "",
      this.dueDate = "",
      this.createdAt = "",
      this.category = ""});

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        categoryId: json['categoryId'],
        status: json['status'],
        file: json['file'],
        dueDate: json['dueDate'],
        createdAt: json['createdAt'],
        category: json['category']['name']);
  }
}
