// To parse this JSON data, do
//
//     final myJobListModel = myJobListModelFromJson(jsonString);

import 'dart:convert';

MyJobListModel myJobListModelFromJson(String str) =>
    MyJobListModel.fromJson(json.decode(str));

String myJobListModelToJson(MyJobListModel data) => json.encode(data.toJson());

class MyJobListModel {
  List<Datum>? data;

  MyJobListModel({
    this.data,
  });

  factory MyJobListModel.fromJson(Map<String, dynamic> json) => MyJobListModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? jobId;
  int? userId;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Job? job;
  User? user;

  Datum({
    this.jobId,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.job,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jobId: json["jobId"],
        userId: json["userId"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "userId": userId,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "job": job?.toJson(),
        "user": user?.toJson(),
      };
}

class Job {
  int? id;
  String? name;
  int? price;
  String? description;
  int? categoryId;
  bool? status;
  String? file;
  DateTime? dueDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Job({
    this.id,
    this.name,
    this.price,
    this.description,
    this.categoryId,
    this.status,
    this.file,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        categoryId: json["categoryId"],
        status: json["status"],
        file: json["file"],
        dueDate:
            json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "categoryId": categoryId,
        "status": status,
        "file": file,
        "dueDate": dueDate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class User {
  int? id;
  String? name;
  String? email;
  int? balance;
  int? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserProfile? userProfile;

  User({
    this.id,
    this.name,
    this.email,
    this.balance,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.userProfile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        balance: json["balance"],
        role: json["role"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        userProfile: json["userProfile"] == null
            ? null
            : UserProfile.fromJson(json["userProfile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "balance": balance,
        "role": role,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "userProfile": userProfile?.toJson(),
      };
}

class UserProfile {
  int? id;
  String? address;
  String? image;
  String? skill;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserProfile({
    this.id,
    this.address,
    this.image,
    this.skill,
    this.createdAt,
    this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        address: json["address"],
        image: json["image"],
        skill: json["skill"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "image": image,
        "skill": skill,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
