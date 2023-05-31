// To parse this JSON data, do
//
//     final applicantModel = applicantModelFromJson(jsonString);

import 'dart:convert';

List<ApplicantModel> applicantModelFromJson(String str) {
  final jsonData = json.decode(str);
  return List<ApplicantModel>.from(
      jsonData['data'].map((x) => ApplicantModel.fromJson(x)));
}

String applicantModelToJson(List<ApplicantModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicantModel {
  int jobId;
  int userId;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;
  Job job;

  ApplicantModel({
    required this.jobId,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.job,
  });

  factory ApplicantModel.fromJson(Map<String, dynamic> json) => ApplicantModel(
        jobId: json["jobId"],
        userId: json["userId"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        job: Job.fromJson(json["job"]),
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "userId": userId,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "job": job.toJson(),
      };
}

class Job {
  int id;
  String name;
  int price;
  String description;
  int categoryId;
  bool status;
  String file;
  DateTime dueDate;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;

  Job({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.status,
    required this.file,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        categoryId: json["categoryId"],
        status: json["status"],
        file: json["file"],
        dueDate: DateTime.parse(json["dueDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "categoryId": categoryId,
        "status": status,
        "file": file,
        "dueDate": dueDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
      };
}

class Category {
  int id;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
