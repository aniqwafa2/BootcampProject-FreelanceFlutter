// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  ContactId contactId;
  List<Datum> data;

  Welcome({
    required this.contactId,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        contactId: ContactId.fromJson(json["contactId"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contactId": contactId.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ContactId {
  int id;
  int senderId;
  int recipientId;
  DateTime createdAt;
  DateTime updatedAt;
  Recipient sender;
  Recipient recipient;

  ContactId({
    required this.id,
    required this.senderId,
    required this.recipientId,
    required this.createdAt,
    required this.updatedAt,
    required this.sender,
    required this.recipient,
  });

  factory ContactId.fromJson(Map<String, dynamic> json) => ContactId(
        id: json["id"],
        senderId: json["senderId"],
        recipientId: json["recipientId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        sender: Recipient.fromJson(json["sender"]),
        recipient: Recipient.fromJson(json["recipient"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "senderId": senderId,
        "recipientId": recipientId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "sender": sender.toJson(),
        "recipient": recipient.toJson(),
      };
}

class Recipient {
  int id;
  String name;
  String email;
  int balance;
  int role;
  DateTime createdAt;
  DateTime updatedAt;
  UserProfile userProfile;

  Recipient({
    required this.id,
    required this.name,
    required this.email,
    required this.balance,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.userProfile,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) => Recipient(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        balance: json["balance"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userProfile: UserProfile.fromJson(json["userProfile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "balance": balance,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userProfile": userProfile.toJson(),
      };
}

class UserProfile {
  int id;
  String? address;
  dynamic image;
  dynamic skill;
  DateTime createdAt;
  DateTime updatedAt;

  UserProfile({
    required this.id,
    this.address,
    this.image,
    this.skill,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        address: json["address"],
        image: json["image"],
        skill: json["skill"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "image": image,
        "skill": skill,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Datum {
  int id;
  int messageContactId;
  int userId;
  String messageContent;
  DateTime createdAt;
  DateTime updatedAt;
  Recipient user;

  Datum({
    required this.id,
    required this.messageContactId,
    required this.userId,
    required this.messageContent,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        messageContactId: json["messageContactId"],
        userId: json["userId"],
        messageContent: json["messageContent"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        user: Recipient.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "messageContactId": messageContactId,
        "userId": userId,
        "messageContent": messageContent,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}
